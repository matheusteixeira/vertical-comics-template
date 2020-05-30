var items = data;

var tree = document.createDocumentFragment();

// Make this Dynamic
var div = document.createElement("div");
var link = document.createElement("a");

div.setAttribute("id", "id1");
link.setAttribute("id", "id2");
link.setAttribute("href", "http://site.com");
link.appendChild(document.createTextNode(items.comics[0].title));
div.appendChild(link)
tree.appendChild(div);

document.getElementById("main").appendChild(tree);
