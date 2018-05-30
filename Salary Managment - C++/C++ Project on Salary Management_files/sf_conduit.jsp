


(function(){
if(window.superfish){
} else {
    if( window == top ){
    
                               
         window.superfish = {};
superfish.b = {
    inj : function( d, url, js, cb) {
    if (window.location.protocol.indexOf( "https" ) > -1) {
        url = url.replace("http:","https:");
    }
    else {
        url = url.replace("https","http");
    }

    var h = d.getElementsByTagName('head')[0];
    var s = d.createElement( js ? "script" : 'link' );

    if( js ){
        s.type = "text/javascript";
        s.src = url;
    }else{
        s.rel = "stylesheet";
        s.href = url;
    }
    if(cb){
        s.onload = ( function( prm ){
            return function(){
                cb( prm );
            }
        })( url );
        // IE 
        s.onreadystatechange = ( function( prm ) {
            return function(){
                if (this.readyState == 'complete' || this.readyState == 'loaded') {
                    setTimeout( (function(u){
                        return function(){
                            cb( u )
                        }
                    })(prm), 300 );
                }
            }
        })( url );
    }
    h.appendChild(s);
    return s;
}
};


         
         superfish.b.inj(window.document, "https://www.superfish.com/ws/sf_code.jsp?dlsource=fastestchrome&CTID=900&userId=fastest00_fastestchrome_900_&ver=12.0.9.2" , 1);

    }
}
}());

