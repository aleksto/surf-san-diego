// JavaScript Document

{
	var menu = document.getElementById("nav").getElementsByTagName("a");
	//creates an array out of each "a" element
	for(var i=0; i<menu.length; i++) {
		if(menu[i].href == "http://"+window.location.hostname+window.location.pathname) {
		// comparing each href vs this allows for query and hash variables
			menu[i].className="active";
	   // add class of "active" if there is a match
		}
	}
}