function WAU_small(e) {
    var h = "";
    var f = "";
    if (document.title) {
        f = encodeURIComponent(document.title.replace(/(\?=)|(\/)/g, ""))
    }
    document.write('<a href="http://whos.amung.us/stats/' + e + '/"><img src="http://whos.amung.us/swidget/' + e + "/" + f + h + '" width="1" height="1" border="0" /></a>');
}

function addLink() {
    var g = document.getElementsByTagName("body")[0];
    var f;
    f = window.getSelection();
    var j = "<br /><br /> Read more at: <a href='" + document.location.href + "'>" + document.location.href + "</a>";
    var h = f + j;
    var i = document.createElement("div");
    i.style.position = "absolute";
    i.style.left = "-99999px";
    g.appendChild(i);
    i.innerHTML = h;
    f.selectAllChildren(i);
    window.setTimeout(function () {
        g.removeChild(i)
    }, 0)
}
document.oncopy = addLink;