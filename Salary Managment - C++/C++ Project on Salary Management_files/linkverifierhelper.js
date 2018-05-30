//daplvflag=1;
var pageDir;
var alreadyrunflag = 0; //flag to indicate whether target function has already been run
var posRelative;
var dlvOverflowHidden;
var dlvOverflowPos = "0";
var RelativePos = "0";

//width and height of viewport
var w=window,d=document,e=d.documentElement,g=d.getElementsByTagName('body')[0],x=w.innerWidth||e.clientWidth||g.clientWidth,y=w.innerHeight||e.offsetHeight||g.offsetHeight;
			
var dlvscriptsObj = document.getElementsByTagName('script'); 
for (var i = dlvscriptsObj.length - 1; i >= 0; --i) { 
	var dlvscriptsObj_src = dlvscriptsObj[i].src;
	if(dlvscriptsObj_src.indexOf("linkverifierhelper") != -1) {
		dlvDomain =  dlvscriptsObj_src.split('/public')[0]; 
        break; 
	}
}

var dlvth = document.getElementsByTagName('body')[0];
var dlvs = document.createElement('script');
dlvs.setAttribute('type','text/javascript');
dlvs.setAttribute('src',dlvDomain+'/public/linkverifierhelper2.js');
dlvth.appendChild(dlvs);

//Find IE version
var ver = -1; // value assumes failure.
if (navigator.appName == 'Microsoft Internet Explorer') {
	var ua = navigator.userAgent;
	var re  = new RegExp("MSIE ([0-9]{1,}[\.0-9]{0,})");
	if (re.exec(ua) != null)
	ver = parseFloat( RegExp.$1 );
}
			
function showdaplvsettings(num) 
{
	if(objS.style.display == "" || objS.style.display == "none") {
		objS.style.display = 'block';
		objM.innerHTML = 'Less &#9650;';
	} else {
		objS.style.display = 'none';
		objM.innerHTML = 'More &#9660;';
	}
}
function httpGet(theUrl,refresh,num)
{
	var i = document.createElement("img");
	var d = new Date();
	i.src = theUrl + "/dlv_unique/" + d.getTime();
	if(refresh == 1)
	{
		location.reload(true);
	} else
	{
	dlvDwlQ(num)
	}
}
function dlvDwlQ(num) {
	objIcon = document.getElementById("dlvicon"+num);
	objIcon.style.background = "url("+dlvDomain+"/public/dap_validlink_queued.png)";
}
function refresh()
{
	location.reload(true);
}      
function showDAPLV(num,bshowsettings,isWelcome)
{ 
	if (isWelcome != true) isWelcome = false;
	if (_divContext.style.display != "block") {
		objM = document.getElementById("daplvmore"+num);
		objPop = document.getElementById("daplvinfopopup"+num);
		objIcon = document.getElementById("dlvicon"+num);
		objIcon2 = document.getElementById("dlvicon"+num);
		objS = document.getElementById("dapversettings"+num);

		//if icon status is not pending
		if(objIcon.className.indexOf("Pending") == -1 && bshowsettings == true) 
		{			
			isLeft="left";
			
			// if invalid, hide download button
			if(objIcon.className.indexOf("Invalid") != -1) 
				document.getElementById("daplvDWL"+num).style.visibility = "hidden";

			// width of icon
			iw = objIcon.offsetWidth;
				
			// position of icon from top and left of document
			for (var ix=0, iy=0; objIcon != null; ix += objIcon.offsetLeft, iy += objIcon.offsetTop, objIcon = objIcon.offsetParent); 
		
			//width and height of popup div
			var gh=0;
			var gw=0;
			objPop.style.display = "inline";
			objPop.style.visibility = "hidden";
			gh = objPop.offsetHeight;
			gw = objPop.offsetWidth;
			var tempIcon = objIcon2, tempIcon2 = objIcon2;
							
			if((dlvOverflowPos>"0" && RelativePos>"0") && (dlvOverflowPos>=RelativePos) && (tempIcon.parentNode.clientWidth<gw || tempIcon.parentNode.clientHeight<gh)) { // if parent has overflow hidden style + width and height of popup div is bigger than width of parent div
				posRelative = "1";
			}
			
			// calculates X and Y scrolls
			if (self.pageYOffset) {yScroll = self.pageYOffset;} else if (document.documentElement && document.documentElement.clientTop) {yScroll = document.documentElement.clientTop;} else if (document.body) {/* all other Explorers*/ yScroll = document.body.clientTop;}
			if (self.pageXOffset) {xScroll = self.pageXOffset;} else if (document.documentElement && document.documentElement.clientLeft) {xScroll = document.documentElement.clientLeft;} else if (document.body) {/* all other Explorers*/ xScroll = document.body.clientLeft;}
			
			try{
				if((objIcon2.parentNode.parentNode.currentStyle.overflow == "scroll" || objIcon2.parentNode.parentNode.currentStyle.overflow ==  "auto") &&  objIcon2.parentNode.parentNode.nodeName != "BODY")
					scrollAdd=objIcon2.parentNode.parentNode.scrollTop;
				else
					scrollAdd=0;
			}         
			 catch (e) {
				scrollAdd=0;
			}
			if ( ver > -1 ) { // if IE
				if ( ver > 8.0 ) { // if IE>8
					for(var i=0; i<=15; i++) { // check 10 levels of parents
						if(tempIcon.nodeName.toLowerCase() != "body") { // only check if parent is not body
							if(tempIcon.parentNode.currentStyle.position == "relative") RelativePos = i;
							if(tempIcon.parentNode.currentStyle.overflow == "hidden") {
								dlvOverflowPos = i;
								if(RelativePos != "0") break;
							} else {
								tempIcon = tempIcon.parentNode;
							}
						}
					}
				}	
			}	

			for (var i = 0; i <= 15; i++) { // check 10 levels of parents
				if (tempIcon2.nodeName.toLowerCase() != "body") { // only check if parent is not body
					if(window.getComputedStyle) 
						PopDir = window.getComputedStyle(tempIcon2.parentNode, null);
					else 
						PopDir = tempIcon2.parentNode.currentStyle;

					if (PopDir.direction == "rtl") {
						pageDir = "rtl";
						break;
					} else {
						tempIcon2 = tempIcon2.parentNode;
					}
				}
			}			

			try
			{
				if ( ver == -1 )  // if not IE
					document.getElementById("daplv_disable"+num).style.visibility = "hidden";
			}catch(e){}


			// x axes - decide to which side the popup should open
			if((ix+gw)>(xScroll+x)) {
				popupLeftPos = -gw-iw;
				if(pageDir == "rtl") popupLeftPos = -gw
				isLeft="right";
				if (objPop.className.indexOf("ex") == -1)
				    objPop.className = 'daplvinfo-rtl';
				else 
				    objPop.className = 'exdaplvinfo-rtl';
			} else {
				popupLeftPos = 0;
				if(pageDir == "rtl") popupLeftPos += iw;
				isLeft="left";
				if (objPop.className.indexOf("ex") == -1)
				    objPop.className = "daplvinfo";
				else
				    objPop.className = "exdaplvinfo";
			}
		
			 if ((iy + gh + 80) > (yScroll + y)) {
                if (isWelcome == true) {
                    popupTopPos = -(gh / 2) + 25;
                    objPop.style.backgroundPosition = isLeft + ' ' + (gh/2-20) + 'px';
                } else {
                    popupTopPos = -gh + 25;
                    //objPop.style.backgroundPosition = isLeft + ' 115px';
					objPop.style.backgroundPosition = isLeft + ' ' + (gh - 30) + 'px';
                }
            } else {
                //if (isWelcome == true) {
                //    popupTopPos = gh / 2;
                //} else {
                    popupTopPos = 0;
                //}
                
                objPop.style.backgroundPosition = isLeft + ' 0px';
			}
			if(posRelative != "1") {
				objPop.style.left = popupLeftPos+"px";
				objPop.style.top = (popupTopPos-scrollAdd)+"px";
				objPop.style.zIndex = dlvzIndex+1;
				objPop.style.visibility = "visible";
				objPop.style.display = "block";
			}
			objIcon2.removeAttribute("title");
		}
	 else {
			objIcon2.setAttribute("title","DAP Link Checker is analyzing the link...");
		}
	}
}
function hideDAPLV(evt)
{
	objPop.style.display = "none";
}
function dlvdoprocess(e) { 
    e.stopPropagation && e.stopPropagation() || (e.cancelBubble = true); 
    return false;
}

function shortenString(url){
  var shortUrl, tmp;
  shortUrl = url;
  if (url.length > 50) {
    tmp = url.substr(0, 30 - 0);
    shortUrl = tmp;
    shortUrl += '....';
    tmp = url.substr(url.length - 16);
    shortUrl += tmp;
  }
  return shortUrl;
}

var dlvcurFile = 0;
function multiFiles(dir,num,numFiles, numFields, filesStr) {
	if (dlvcurFile == 0) i = 0;
	var file = filesStr.split(",");

	if (dir == "next") {
			   if (i < numFiles - 1) { i = i + 1; }
			   else { i = 0; }
		 } else if (dir == "prev") {
			   if (i > 0) { i = i - 1; }
			   else { i = numFiles - 1; }
		 }

		 document.getElementById('dlv-currentfile' + num).innerHTML = i + 1;
		 for (j = 0; j < numFields-1; j++) {
			   document.getElementById('dlv-file' + j + num).innerHTML = shortenString(file[numFields * i + j]);
		 }
		 dlvcurFile = i;

		 var DWLURL = "http://127.0.0.1:10029/sign/" + file[numFields * i + 4] + "/add%2Flinkonly%2F" + encodeURIComponent(file[numFields * i + 2]) + "/caller/DLV/";
		 document.getElementById("daplvDWL" + num).innerHTML = '<a href="javascript: void(0);" onclick="httpGet(\'' + DWLURL + '\',0,' + num + ');">Download <strong>with DAP</strong></a>';
  }


