Not sure whether to use `.map`, `.filter`, or `.reduce`? This flowchart should
help to guide you:

<svg id="mermaid-1528788618330" width="100%" xmlns="http://www.w3.org/2000/svg" style="max-width: 428.080078125px;" viewBox="0 0 428.080078125 1134.265625"><style>


#mermaid-1528788618330 .label {
  font-family: 'trebuchet ms', verdana, arial;
  color: #333; }

#mermaid-1528788618330 .node rect,
#mermaid-1528788618330 .node circle,
#mermaid-1528788618330 .node ellipse,
#mermaid-1528788618330 .node polygon {
  fill: #ECECFF;
  stroke: #9370DB;
  stroke-width: 1px; }

#mermaid-1528788618330 .node.clickable {
  cursor: pointer; }

#mermaid-1528788618330 .arrowheadPath {
  fill: #333333; }

#mermaid-1528788618330 .edgePath .path {
  stroke: #333333;
  stroke-width: 1.5px; }

#mermaid-1528788618330 .edgeLabel {
  background-color: #e8e8e8; }

#mermaid-1528788618330 .cluster rect {
  fill: #ffffde !important;
  stroke: #aaaa33 !important;
  stroke-width: 1px !important; }

#mermaid-1528788618330 .cluster text {
  fill: #333; }

#mermaid-1528788618330 div.mermaidTooltip {
  position: absolute;
  text-align: center;
  max-width: 200px;
  padding: 2px;
  font-family: 'trebuchet ms', verdana, arial;
  font-size: 12px;
  background: #ffffde;
  border: 1px solid #aaaa33;
  border-radius: 2px;
  pointer-events: none;
  z-index: 100; }

#mermaid-1528788618330 .actor {
  stroke: #CCCCFF;
  fill: #ECECFF; }

#mermaid-1528788618330 text.actor {
  fill: black;
  stroke: none; }

#mermaid-1528788618330 .actor-line {
  stroke: grey; }

#mermaid-1528788618330 .messageLine0 {
  stroke-width: 1.5;
  stroke-dasharray: '2 2';
  marker-end: 'url(#arrowhead)';
  stroke: #333; }

#mermaid-1528788618330 .messageLine1 {
  stroke-width: 1.5;
  stroke-dasharray: '2 2';
  stroke: #333; }

#mermaid-1528788618330 #arrowhead {
  fill: #333; }

#mermaid-1528788618330 #crosshead path {
  fill: #333 !important;
  stroke: #333 !important; }

#mermaid-1528788618330 .messageText {
  fill: #333;
  stroke: none; }

#mermaid-1528788618330 .labelBox {
  stroke: #CCCCFF;
  fill: #ECECFF; }

#mermaid-1528788618330 .labelText {
  fill: black;
  stroke: none; }

#mermaid-1528788618330 .loopText {
  fill: black;
  stroke: none; }

#mermaid-1528788618330 .loopLine {
  stroke-width: 2;
  stroke-dasharray: '2 2';
  marker-end: 'url(#arrowhead)';
  stroke: #CCCCFF; }

#mermaid-1528788618330 .note {
  stroke: #aaaa33;
  fill: #fff5ad; }

#mermaid-1528788618330 .noteText {
  fill: black;
  stroke: none;
  font-family: 'trebuchet ms', verdana, arial;
  font-size: 14px; }


#mermaid-1528788618330 .section {
  stroke: none;
  opacity: 0.2; }

#mermaid-1528788618330 .section0 {
  fill: rgba(102, 102, 255, 0.49); }

#mermaid-1528788618330 .section2 {
  fill: #fff400; }

#mermaid-1528788618330 .section1,
#mermaid-1528788618330 .section3 {
  fill: white;
  opacity: 0.2; }

#mermaid-1528788618330 .sectionTitle0 {
  fill: #333; }

#mermaid-1528788618330 .sectionTitle1 {
  fill: #333; }

#mermaid-1528788618330 .sectionTitle2 {
  fill: #333; }

#mermaid-1528788618330 .sectionTitle3 {
  fill: #333; }

#mermaid-1528788618330 .sectionTitle {
  text-anchor: start;
  font-size: 11px;
  text-height: 14px; }


#mermaid-1528788618330 .grid .tick {
  stroke: lightgrey;
  opacity: 0.3;
  shape-rendering: crispEdges; }

#mermaid-1528788618330 .grid path {
  stroke-width: 0; }


#mermaid-1528788618330 .today {
  fill: none;
  stroke: red;
  stroke-width: 2px; }



#mermaid-1528788618330 .task {
  stroke-width: 2; }

#mermaid-1528788618330 .taskText {
  text-anchor: middle;
  font-size: 11px; }

#mermaid-1528788618330 .taskTextOutsideRight {
  fill: black;
  text-anchor: start;
  font-size: 11px; }

#mermaid-1528788618330 .taskTextOutsideLeft {
  fill: black;
  text-anchor: end;
  font-size: 11px; }


#mermaid-1528788618330 .taskText0,
#mermaid-1528788618330 .taskText1,
#mermaid-1528788618330 .taskText2,
#mermaid-1528788618330 .taskText3 {
  fill: white; }

#mermaid-1528788618330 .task0,
#mermaid-1528788618330 .task1,
#mermaid-1528788618330 .task2,
#mermaid-1528788618330 .task3 {
  fill: #8a90dd;
  stroke: #534fbc; }

#mermaid-1528788618330 .taskTextOutside0,
#mermaid-1528788618330 .taskTextOutside2 {
  fill: black; }

#mermaid-1528788618330 .taskTextOutside1,
#mermaid-1528788618330 .taskTextOutside3 {
  fill: black; }


#mermaid-1528788618330 .active0,
#mermaid-1528788618330 .active1,
#mermaid-1528788618330 .active2,
#mermaid-1528788618330 .active3 {
  fill: #bfc7ff;
  stroke: #534fbc; }

#mermaid-1528788618330 .activeText0,
#mermaid-1528788618330 .activeText1,
#mermaid-1528788618330 .activeText2,
#mermaid-1528788618330 .activeText3 {
  fill: black !important; }


#mermaid-1528788618330 .done0,
#mermaid-1528788618330 .done1,
#mermaid-1528788618330 .done2,
#mermaid-1528788618330 .done3 {
  stroke: grey;
  fill: lightgrey;
  stroke-width: 2; }

#mermaid-1528788618330 .doneText0,
#mermaid-1528788618330 .doneText1,
#mermaid-1528788618330 .doneText2,
#mermaid-1528788618330 .doneText3 {
  fill: black !important; }


#mermaid-1528788618330 .crit0,
#mermaid-1528788618330 .crit1,
#mermaid-1528788618330 .crit2,
#mermaid-1528788618330 .crit3 {
  stroke: #ff8888;
  fill: red;
  stroke-width: 2; }

#mermaid-1528788618330 .activeCrit0,
#mermaid-1528788618330 .activeCrit1,
#mermaid-1528788618330 .activeCrit2,
#mermaid-1528788618330 .activeCrit3 {
  stroke: #ff8888;
  fill: #bfc7ff;
  stroke-width: 2; }

#mermaid-1528788618330 .doneCrit0,
#mermaid-1528788618330 .doneCrit1,
#mermaid-1528788618330 .doneCrit2,
#mermaid-1528788618330 .doneCrit3 {
  stroke: #ff8888;
  fill: lightgrey;
  stroke-width: 2;
  cursor: pointer;
  shape-rendering: crispEdges; }

#mermaid-1528788618330 .doneCritText0,
#mermaid-1528788618330 .doneCritText1,
#mermaid-1528788618330 .doneCritText2,
#mermaid-1528788618330 .doneCritText3 {
  fill: black !important; }

#mermaid-1528788618330 .activeCritText0,
#mermaid-1528788618330 .activeCritText1,
#mermaid-1528788618330 .activeCritText2,
#mermaid-1528788618330 .activeCritText3 {
  fill: black !important; }

#mermaid-1528788618330 .titleText {
  text-anchor: middle;
  font-size: 18px;
  fill: black; }

#mermaid-1528788618330 g.classGroup text {
  fill: #9370DB;
  stroke: none;
  font-family: 'trebuchet ms', verdana, arial;
  font-size: 10px; }

#mermaid-1528788618330 g.classGroup rect {
  fill: #ECECFF;
  stroke: #9370DB; }

#mermaid-1528788618330 g.classGroup line {
  stroke: #9370DB;
  stroke-width: 1; }

#mermaid-1528788618330 .classLabel .box {
  stroke: none;
  stroke-width: 0;
  fill: #ECECFF;
  opacity: 0.5; }

#mermaid-1528788618330 .classLabel .label {
  fill: #9370DB;
  font-size: 10px; }

#mermaid-1528788618330 .relation {
  stroke: #9370DB;
  stroke-width: 1;
  fill: none; }

#mermaid-1528788618330 #compositionStart {
  fill: #9370DB;
  stroke: #9370DB;
  stroke-width: 1; }

#mermaid-1528788618330 #compositionEnd {
  fill: #9370DB;
  stroke: #9370DB;
  stroke-width: 1; }

#mermaid-1528788618330 #aggregationStart {
  fill: #ECECFF;
  stroke: #9370DB;
  stroke-width: 1; }

#mermaid-1528788618330 #aggregationEnd {
  fill: #ECECFF;
  stroke: #9370DB;
  stroke-width: 1; }

#mermaid-1528788618330 #dependencyStart {
  fill: #9370DB;
  stroke: #9370DB;
  stroke-width: 1; }

#mermaid-1528788618330 #dependencyEnd {
  fill: #9370DB;
  stroke: #9370DB;
  stroke-width: 1; }

#mermaid-1528788618330 #extensionStart {
  fill: #9370DB;
  stroke: #9370DB;
  stroke-width: 1; }

#mermaid-1528788618330 #extensionEnd {
  fill: #9370DB;
  stroke: #9370DB;
  stroke-width: 1; }

#mermaid-1528788618330 .commit-id,
#mermaid-1528788618330 .commit-msg,
#mermaid-1528788618330 .branch-label {
  fill: lightgrey;
  color: lightgrey; }
</style><style>#mermaid-1528788618330 {
    color: rgba(0, 0, 0, 0.65);
    font: normal normal 400 normal 14px / 21px "Monospaced Number", "Chinese Quote", -apple-system, system-ui, "Segoe UI", Roboto, "PingFang SC", "Hiragino Sans GB", "Microsoft YaHei", "Helvetica Neue", Helvetica, Arial, sans-serif;
  }</style><g transform="translate(-12, -12)"><g class="output"><g class="clusters"></g><g class="edgePaths"><g class="edgePath" style="opacity: 1;"><path class="path" d="M310.82673809643114,141.93220684643117L266.748046875,207.1640625L267.248046875,243.1640625" marker-end="url(#arrowhead2168)" style="fill:none"></path><defs><marker id="arrowhead2168" viewBox="0 0 10 10" refX="9" refY="5" markerUnits="strokeWidth" markerWidth="8" markerHeight="6" orient="auto"><path d="M 0 0 L 10 5 L 0 10 z" class="arrowheadPath" style="stroke-width: 1; stroke-dasharray: 1, 0;"></path></marker></defs></g><g class="edgePath" style="opacity: 1;"><path class="path" d="M371.29044940356886,141.93220684643117L414.369140625,207.1640625L414.369140625,302.07421875" marker-end="url(#arrowhead2169)" style="fill:none"></path><defs><marker id="arrowhead2169" viewBox="0 0 10 10" refX="9" refY="5" markerUnits="strokeWidth" markerWidth="8" markerHeight="6" orient="auto"><path d="M 0 0 L 10 5 L 0 10 z" class="arrowheadPath" style="stroke-width: 1; stroke-dasharray: 1, 0;"></path></marker></defs></g><g class="edgePath" style="opacity: 1;"><path class="path" d="M228.27287283419196,364.00920095919196L156.86328125,437.984375L157.36328125,473.984375" marker-end="url(#arrowhead2170)" style="fill:none"></path><defs><marker id="arrowhead2170" viewBox="0 0 10 10" refX="9" refY="5" markerUnits="strokeWidth" markerWidth="8" markerHeight="6" orient="auto"><path d="M 0 0 L 10 5 L 0 10 z" class="arrowheadPath" style="stroke-width: 1; stroke-dasharray: 1, 0;"></path></marker></defs></g><g class="edgePath" style="opacity: 1;"><path class="path" d="M306.22322091580804,364.00920095919196L376.6328125,437.984375L376.6328125,589.84765625" marker-end="url(#arrowhead2171)" style="fill:none"></path><defs><marker id="arrowhead2171" viewBox="0 0 10 10" refX="9" refY="5" markerUnits="strokeWidth" markerWidth="8" markerHeight="6" orient="auto"><path d="M 0 0 L 10 5 L 0 10 z" class="arrowheadPath" style="stroke-width: 1; stroke-dasharray: 1, 0;"></path></marker></defs></g><g class="edgePath" style="opacity: 1;"><path class="path" d="M111.00515589992357,701.3528121499236L68.576171875,782.7109375L68.576171875,901.73828125" marker-end="url(#arrowhead2172)" style="fill:none"></path><defs><marker id="arrowhead2172" viewBox="0 0 10 10" refX="9" refY="5" markerUnits="strokeWidth" markerWidth="8" markerHeight="6" orient="auto"><path d="M 0 0 L 10 5 L 0 10 z" class="arrowheadPath" style="stroke-width: 1; stroke-dasharray: 1, 0;"></path></marker></defs></g><g class="edgePath" style="opacity: 1;"><path class="path" d="M203.72140660007642,701.3528121499236L245.150390625,782.7109375L245.650390625,818.7109375" marker-end="url(#arrowhead2173)" style="fill:none"></path><defs><marker id="arrowhead2173" viewBox="0 0 10 10" refX="9" refY="5" markerUnits="strokeWidth" markerWidth="8" markerHeight="6" orient="auto"><path d="M 0 0 L 10 5 L 0 10 z" class="arrowheadPath" style="stroke-width: 1; stroke-dasharray: 1, 0;"></path></marker></defs></g><g class="edgePath" style="opacity: 1;"><path class="path" d="M219.27885350431828,1000.3940878793182L197.767578125,1061.765625L197.767578125,1097.265625" marker-end="url(#arrowhead2174)" style="fill:none"></path><defs><marker id="arrowhead2174" viewBox="0 0 10 10" refX="9" refY="5" markerUnits="strokeWidth" markerWidth="8" markerHeight="6" orient="auto"><path d="M 0 0 L 10 5 L 0 10 z" class="arrowheadPath" style="stroke-width: 1; stroke-dasharray: 1, 0;"></path></marker></defs></g><g class="edgePath" style="opacity: 1;"><path class="path" d="M272.02192774568175,1000.3940878793182L292.533203125,1061.765625L292.533203125,1097.265625" marker-end="url(#arrowhead2175)" style="fill:none"></path><defs><marker id="arrowhead2175" viewBox="0 0 10 10" refX="9" refY="5" markerUnits="strokeWidth" markerWidth="8" markerHeight="6" orient="auto"><path d="M 0 0 L 10 5 L 0 10 z" class="arrowheadPath" style="stroke-width: 1; stroke-dasharray: 1, 0;"></path></marker></defs></g></g><g class="edgeLabels"><g class="edgeLabel" transform="translate(266.748046875,207.1640625)" style="opacity: 1;"><g transform="translate(-11.453125,-10.5)" class="label"><foreignObject width="22.90625" height="21"><div xmlns="http://www.w3.org/1999/xhtml" style="display: inline-block; white-space: nowrap;"><span class="edgeLabel">Yes</span></div></foreignObject></g></g><g class="edgeLabel" transform="translate(414.369140625,207.1640625)" style="opacity: 1;"><g transform="translate(-9.1875,-10.5)" class="label"><foreignObject width="18.375" height="21"><div xmlns="http://www.w3.org/1999/xhtml" style="display: inline-block; white-space: nowrap;"><span class="edgeLabel">No</span></div></foreignObject></g></g><g class="edgeLabel" transform="translate(156.86328125,437.984375)" style="opacity: 1;"><g transform="translate(-11.453125,-10.5)" class="label"><foreignObject width="22.90625" height="21"><div xmlns="http://www.w3.org/1999/xhtml" style="display: inline-block; white-space: nowrap;"><span class="edgeLabel">Yes</span></div></foreignObject></g></g><g class="edgeLabel" transform="translate(376.6328125,437.984375)" style="opacity: 1;"><g transform="translate(-9.1875,-10.5)" class="label"><foreignObject width="18.375" height="21"><div xmlns="http://www.w3.org/1999/xhtml" style="display: inline-block; white-space: nowrap;"><span class="edgeLabel">No</span></div></foreignObject></g></g><g class="edgeLabel" transform="translate(68.576171875,782.7109375)" style="opacity: 1;"><g transform="translate(-11.453125,-10.5)" class="label"><foreignObject width="22.90625" height="21"><div xmlns="http://www.w3.org/1999/xhtml" style="display: inline-block; white-space: nowrap;"><span class="edgeLabel">Yes</span></div></foreignObject></g></g><g class="edgeLabel" transform="translate(245.150390625,782.7109375)" style="opacity: 1;"><g transform="translate(-9.1875,-10.5)" class="label"><foreignObject width="18.375" height="21"><div xmlns="http://www.w3.org/1999/xhtml" style="display: inline-block; white-space: nowrap;"><span class="edgeLabel">No</span></div></foreignObject></g></g><g class="edgeLabel" transform="translate(197.767578125,1061.765625)" style="opacity: 1;"><g transform="translate(-11.453125,-10.5)" class="label"><foreignObject width="22.90625" height="21"><div xmlns="http://www.w3.org/1999/xhtml" style="display: inline-block; white-space: nowrap;"><span class="edgeLabel">Yes</span></div></foreignObject></g></g><g class="edgeLabel" transform="translate(292.533203125,1061.765625)" style="opacity: 1;"><g transform="translate(-9.1875,-10.5)" class="label"><foreignObject width="18.375" height="21"><div xmlns="http://www.w3.org/1999/xhtml" style="display: inline-block; white-space: nowrap;"><span class="edgeLabel">No</span></div></foreignObject></g></g></g><g class="nodes"><g class="node" id="A" transform="translate(340.55859375,95.83203125)" style="opacity: 1;"><polygon points="75.83203125,0 151.6640625,-75.83203125 75.83203125,-151.6640625 0,-75.83203125" rx="5" ry="5" transform="translate(-75.83203125,75.83203125)"></polygon><g class="label" transform="translate(0,0)"><g transform="translate(-53.7578125,-10.5)"><foreignObject width="107.515625" height="21"><div xmlns="http://www.w3.org/1999/xhtml" style="display: inline-block; white-space: nowrap;">Is input an array?</div></foreignObject></g></g></g><g class="node" id="B" transform="translate(266.748046875,322.57421875)" style="opacity: 1;"><polygon points="79.91015625,0 159.8203125,-79.91015625 79.91015625,-159.8203125 0,-79.91015625" rx="5" ry="5" transform="translate(-79.91015625,79.91015625)"></polygon><g class="label" transform="translate(0,0)"><g transform="translate(-58.2890625,-10.5)"><foreignObject width="116.578125" height="21"><div xmlns="http://www.w3.org/1999/xhtml" style="display: inline-block; white-space: nowrap;">Is output an array?</div></foreignObject></g></g></g><g class="node" id="X" transform="translate(414.369140625,322.57421875)" style="opacity: 1;"><rect rx="5" ry="5" x="-17.7109375" y="-20.5" width="35.421875" height="41"></rect><g class="label" transform="translate(0,0)"><g transform="translate(-7.7109375,-10.5)"><foreignObject width="15.421875" height="21"><div xmlns="http://www.w3.org/1999/xhtml" style="display: inline-block; white-space: nowrap;">???</div></foreignObject></g></g></g><g class="node" id="C" transform="translate(156.86328125,610.34765625)" style="opacity: 1;"><polygon points="136.86328125,0 273.7265625,-136.86328125 136.86328125,-273.7265625 0,-136.86328125" rx="5" ry="5" transform="translate(-136.86328125,136.86328125)"></polygon><g class="label" transform="translate(0,0)"><g transform="translate(-121.5703125,-10.5)"><foreignObject width="243.140625" height="21"><div xmlns="http://www.w3.org/1999/xhtml" style="display: inline-block; white-space: nowrap;">Is input.length equal to output.length?</div></foreignObject></g></g></g><g class="node" id="Y" transform="translate(376.6328125,610.34765625)" style="opacity: 1;"><rect rx="5" ry="5" x="-32.90625" y="-20.5" width="65.8125" height="41"></rect><g class="label" transform="translate(0,0)"><g transform="translate(-22.90625,-10.5)"><foreignObject width="45.8125" height="21"><div xmlns="http://www.w3.org/1999/xhtml" style="display: inline-block; white-space: nowrap;">Reduce</div></foreignObject></g></g></g><g class="node" id="D" transform="translate(68.576171875,922.23828125)" style="opacity: 1;"><rect rx="5" ry="5" x="-22.546875" y="-20.5" width="45.09375" height="41"></rect><g class="label" transform="translate(0,0)"><g transform="translate(-12.546875,-10.5)"><foreignObject width="25.09375" height="21"><div xmlns="http://www.w3.org/1999/xhtml" style="display: inline-block; white-space: nowrap;">Map</div></foreignObject></g></g></g><g class="node" id="E" transform="translate(245.150390625,922.23828125)" style="opacity: 1;"><polygon points="104.02734375,0 208.0546875,-104.02734375 104.02734375,-208.0546875 0,-104.02734375" rx="5" ry="5" transform="translate(-104.02734375,104.02734375)"></polygon><g class="label" transform="translate(0,0)"><g transform="translate(-85.0859375,-10.5)"><foreignObject width="170.171875" height="21"><div xmlns="http://www.w3.org/1999/xhtml" style="display: inline-block; white-space: nowrap;">Is output a subset of input?</div></foreignObject></g></g></g><g class="node" id="F" transform="translate(197.767578125,1117.765625)" style="opacity: 1;"><rect rx="5" ry="5" x="-27.0546875" y="-20.5" width="54.109375" height="41"></rect><g class="label" transform="translate(0,0)"><g transform="translate(-17.0546875,-10.5)"><foreignObject width="34.109375" height="21"><div xmlns="http://www.w3.org/1999/xhtml" style="display: inline-block; white-space: nowrap;">Filter</div></foreignObject></g></g></g><g class="node" id="G" transform="translate(292.533203125,1117.765625)" style="opacity: 1;"><rect rx="5" ry="5" x="-17.7109375" y="-20.5" width="35.421875" height="41"></rect><g class="label" transform="translate(0,0)"><g transform="translate(-7.7109375,-10.5)"><foreignObject width="15.421875" height="21"><div xmlns="http://www.w3.org/1999/xhtml" style="display: inline-block; white-space: nowrap;">???</div></foreignObject></g></g></g></g></g></g></svg>
