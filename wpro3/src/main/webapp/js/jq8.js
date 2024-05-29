let xhr
let checkFirst = lookSend = false;
let kbs;

function start() {
	if (checkFirst === false) {	// input에서 입력이 시작되고 있다는 것을 의미함.
		kbs = setTimeout("sendkeyword()", 800); // 1초후에 sendkeyword 호출
		lookSend = true;
	}
}

function sendkeyword() {
	//let keyword = document.querySelector("#kbs").values; 는 아래 행과 동일
	let keyword = document.frm.keyword.value;
	//console.log(keyword);

	if (keyword === "") {
		hide();
	} else {
		xhr = new XMLHttpRequest();
		let para = "keyword=" + keyword;
		xhr.open("get", "jq8.jsp?" + para, true);
		xhr.onreadystatechange = function() {
			if (xhr.readyState === 4) {
				if (xhr.status === 200) {
					process();
				}
			}
		}
		xhr.send(null);
	}
	clearTimeout(kbs); // settimeout 설정 해제	
}

function process() {
	let resultData = xhr.responseText;
	//console.log(resultData);
	let result = resultData.split("|");
	//console.log(`건수 :${result[0]} 자료 :${result[1]}`);
	let tot = result[0];
	if(tot > 0){
		let datas = result[1].split(",");
		let imsi = "";
		for(let i=0; i < datas.length; i++){
			imsi += "<a href=\"javascript:func('" + datas[i] + "')\">" + datas[i] + "</a><br>"			
		}
		console.log(imsi);
		document.querySelector("#suggestlist").innerHTML = imsi;
		show();
	}
	 
}
function func(reData){
	//alert(reData);
	frm.sel.value = reData;
	lookSend = checkFirst = false;
	hide();
	
	frm.keyword.value = "";
}



function hide() {
	document.querySelector("#suggest").style.display = "none";

}

function show() {
	document.querySelector("#suggest").style.display = "";

}