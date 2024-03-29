/**
 * 
 */
var xhr = false;
var statesArray = new Array();

window.onload = new function() { 
	
	if (window.XMLHttpRequest) {
		xhr = new XMLHttpRequest();
	}
	else {
		if (window.ActiveXObject) {
			try {
				xhr = new ActiveXObject("Microsoft.XMLHTTP");
			}
			catch (e) { }
		}
	}

	if (xhr) {
		xhr.onreadystatechange = setStatesArray;
		xhr.open("GET", "us-states.xml", true);
		xhr.send(null);
	}
	else {
		alert("Sorry, but I couldn't create an XMLHttpRequest");
	}
};


function setStatesArray(){
	if (xhr.readyState == 4) {
		if (xhr.status == 200) {
			if(xhr.responseXML){
				var allStates = xhr.responseXML.getElementsByTagName("item");
				for(var i=0; i<allStates.length; i++){
					statesArray[i] = allStates[i].getElementsByTagName("label")[0].firstChild;
				}
			}
		}
		else {
			alert("There was a problem with the request " + xhr.status);
		}
	}

}

function searchSuggest(){
	var str=document.getElementById("searchField").value;
	document.getElementById("searchField").className = "";
	if(str != ""){
		document.getElementById("popups").innerHTML="";
		for (var i=0; i<statesArray.length; i++){
			var thisState=statesArray[i].nodeValue;
			if(thisState.toLowerCase().indexOf(str.toLowerCase()) == 0){
				var tempDiv = document.createElement("div");
				tempDiv.innerHTML = thisState;
				tempDiv.onclick = makeChoice;
				tempDiv.className="suggestions";
				document.getElementById("popups").appendChild(tempDiv);
			}
		}
		var foundCt=document.getElementById("popups").childNodes.length;
		if(foundCt == 0){
			document.getElementById("searchField").className="error";
		}
		if(foundCt == 1){
			document.getElementById("searchField").value = 
			document.getElementById("popups").firstChild.innerHTML;
			document.getElementById("popups").innerHTML = "";
		}
	}
}

function makeChoice(evt){
	var thisDiv = (evt) ? evt.target : window.event.srcElement;
	document.getElementById("searchField").value = 
	document.getElementById("popups").firstChild.innerHTML;
	document.getElementById("popups").innerHTML = "";
}

function validatePassword(){
	var password=document.getElementById("password").value;
	var errorMessage = document.createElement("div");
	document.getElementById("password").className="";
	document.getElementById("errorMessage").appendChild(errorMessage);

	if(password.length<1){
		document.getElementById("errorMessage").innerHTML = "";
	}	
	else if(password.length<5){
		document.getElementById("errorMessage").innerHTML = "Password strength: Weak";
		document.getElementById("password").className="error";
	}
	else if(password.length>=5){
		document.getElementById("errorMessage").innerHTML = "Password strength: Strong";
		document.getElementById("password").className="error";
	}
}


