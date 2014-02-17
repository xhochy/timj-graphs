#!/bin/sh
echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?>" > cojam-tracks-$1.graphml
echo "<graphml xmlns=\"http://graphml.graphdrawing.org/xmlns\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:schemaLocation=\"http://graphml.graphdrawing.org/xmlns http://graphml.graphdrawing.org/xmlns/1.0/graphml.xsd\">" >> cojam-tracks-$1.graphml
echo "<graph id=\"G\" edgedefault=\"undirected\">" >> cojam-tracks-$1.graphml
echo "  <key id=\"cojams_num\" for=\"edge\" attr.name=\"cojams_num\" attr.type=\"int\"/>" >> cojam-tracks-$1.graphml
julia cojam-graph-edges.jl $1
EDGES=`grep '</edge>' cojam-tracks-$1.graphml | wc -l`
VERTICES=`grep '<node ' cojam-tracks-$1.graphml | wc -l`
echo Generated graph with $VERTICES vertices and $EDGES edges.
