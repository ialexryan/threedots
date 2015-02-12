document.body.style.background="#ECECEC";
 
var css = "body{border-top-width: 0px !important;} #header{border-top-width: 0px !important;} #add_from_computer,#add_from_gdrive,#add_from_box{display: none;} #google_auth_row{display: none;} #google_auth_separator{display:none;} /*#logo{padding-left: 64px;}*/ ";
 
cssSetup = function() {
	head = document.head || document.getElementsByTagName( 'head' )[ 0 ];
	style = document.createElement( 'style' );
	style.type = 'text/css';
	if ( style.styleSheet ) {
			style.styleSheet.cssText = css;
	} else {
			style.appendChild( document.createTextNode( css ) );
	}
	head.appendChild( style );
};
 
function init() {
    cssSetup();
}
 
init();
