package Chado::Dependencies;

use Data::Dumper;
use Moose;
use XML::LibXML;
use Archive::Extract;
use LWP::UserAgent;
use File::Temp;
use Path::Class::Dir;
use feature qw/say/;
use JSON qw/to_json/;
use Template::Tiny;
with 'MooseX::Getopt';

has output => (
    is            => 'rw',
    isa           => 'Str',
    documentation => 'Name of html file, default is chado.html',
    default       => 'chado.html'
);

has location => (
    is  => 'rw',
    isa => 'Str',
    default =>
        'http://downloads.sourceforge.net/project/gmod/gmod/chado-1.11/chado-1.11.tar.gz',
    documentation =>
        'Location of chado download url, default is http://downloads.sourceforge.net/project/gmod/gmod/chado-1.11/chado-1.11.tar.gz'
);

sub execute {
    my ($self) = @_;
    my $tmp_dir = File::Temp->newdir();
    my $tarball = $self->extra_argv;
    if ( @$tarball ) {    # given a tarball through command line
        my $archive = Archive::Extract->new(
            archive => $tarball->[0],
            type    => 'tgz'
        );
        $archive->extract( to => $tmp_dir ) or die $archive->error;
    }
    else {
        my $tmp_file = File::Temp->new;
        $tmp_file->print(
            $self->chado_content_from_remote( $self->location ) );
        my $archive = Archive::Extract->new(
            archive => $ARGV[0],
            type    => 'tgz'
        );
        $archive->extract( to => $tmp_dir ) or die $archive->error;
    }

    my @children = grep { $_->is_dir }
        Path::Class::Dir->new( $tmp_dir->dirname )->children;
    my $dom = XML::LibXML->load_xml( location =>
            $children[0]->file("chado-module-metadata.xml")->stringify );

    my ( $nodes, $links );
    for my $node ( $dom->findnodes("//module") ) {
        my $id = $node->getAttribute("id");
        push @$nodes, { id => $id, name => $id };
        if ( $node->exists("dependency") ) {
            for my $depnode ( $node->findnodes("dependency") ) {
                my $name = $depnode->getAttribute("to");
                push @$links, { source => $name, target => $id };
            }
        }
    }
    my $output = Path::Class::File->new( $self->output )->openw();
    my $template = Template::Tiny->new( TRIM => 1 );
    my $data;
    my $json
        = to_json( { nodes => $nodes, links => $links }, { pretty => 1 } );
    my $source = <<"END_HTML";
<html>
    <head>
        <meta charset="utf-8">
        <title>Chado module dependencies</title>
        <style type="text/css">
            svg {
                overflow: hidden;
            }
        </style>
        <script type="text/javascript" src="http://d3js.org/d3.v3.min.js"></script>
        <script src="http://cpettitt.github.io/project/dagre-d3/v0.1.5/dagre-d3.min.js"></script>
    </head>
    <body>
        <div id="svg">
            <svg width=800 height=480>
                <g transform="translate(20,20)"/>
            </svg>
        </div>
        <button id="save">Generate png image</button>
        <div id="pngdataurl"></div>
        <canvas style="display:none" width="800" height="480"></canvas>

        <script type="text/javascript">
            //Drawing code
                var g = new dagreD3.Digraph();
                var graph = [% json %];
                graph.nodes.forEach(function(node) {
                        g.addNode(node.id, {label : node.name});
                });
                graph.links.forEach(function(edge) {
                        g.addEdge(null, edge.source,edge.target);

                });
                var layout = dagreD3.layout()
                                    .nodeSep(5)
                                    .edgeSep(5);
                var renderer = new dagreD3.Renderer();
                var oldDrawNodes = renderer.drawNodes();
                renderer.drawNodes(function(graph,root) {
                    var svgNodes = oldDrawNodes(graph,root);
                    svgNodes.each(function(u) {
                        d3.select(this)
                        .attr("stroke", "#fff")
                        .attr("stroke-width","1.8px")
                        .attr("fill","rgb(170,200,250)");
                    });
                    return svgNodes;
                });
                var oldDrawEdgePaths = renderer.drawEdgePaths();
                renderer.drawEdgePaths(function(graph,root) {
                    var svgEdge = oldDrawEdgePaths(graph,root);
                    svgEdge.each(function(u) {
                        d3.select(this)
                        .attr("stroke", "#999")
                        .attr("stroke-width","1.2px")
                        .attr("fill", "none")
                        .attr("stroke-opacity", 0.5);
                    });
                    return svgEdge;
                });
                renderer.layout(layout);
                renderer.edgeInterpolate('linear');
                renderer.run(g, d3.select("#svg svg g"));
                d3.selectAll("text")
                    .attr("fill", "black")
                    .attr("font-family","Helvetica")
                    .attr("font-size","12px")
                    .attr("stroke-width", "0px")
                    .attr("text-anchor", "start")
                    .attr("font-weight", "normal");

            //Image saving code
            d3.select("#save").on("click", function(){
                var html = d3.select("svg")
                        .attr("version", 1.1)
                        .attr("xmlns", "http://www.w3.org/2000/svg")
                        .node().parentNode.innerHTML;

                var imgsrc = 'data:image/svg+xml;base64,'+ btoa(html);
                var canvas = document.querySelector("canvas"),
	            context = canvas.getContext("2d");

                var image = new Image;
                image.src = imgsrc;
                image.onload = function() {
	                context.drawImage(image, 0, 0);

	                var canvasdata = canvas.toDataURL("image/png");
	                var pngimg = '<img src="'+canvasdata+'">'; 
  	                d3.select("#pngdataurl").html(pngimg);

	                var a = document.createElement("a");
	                a.download = "sample.png";
	                a.href = canvasdata;
	                a.click();
                };
            });
        </script>
    </body>
</html>
END_HTML
    $template->process( \$source, { json => $json }, \$data );
    $output->print($data);
    $output->close;
}

sub chado_content_from_remote {
    my ( $self, $url ) = @_;
    my $ua   = LWP::UserAgent->new;
    my $resp = $ua->get($url);
    die $resp->status_line if $resp->is_error;
    return $resp->content;
}

package main;
Chado::Dependencies->new_with_options->execute();

=head1 NAME

generate_chado_dependencies.pl - Generate a html file to visualize chado dependencies with browser
