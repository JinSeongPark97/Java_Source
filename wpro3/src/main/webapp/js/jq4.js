$(document).ready(function(){
	// html 문서를 text로 읽기
	$("#test1").click(function(){
		// alert('a');
		$("#disp").empty();
		
		// $('#disp').load("jq4.html"); // jq4.html을 읽어 id가 disp인 태그에 출력
		$("#disp").hide().load("jq4.html", function() {
			$(this).fadeIn(); // effect 처리
		});
	});
	
	// json 읽기
	$("#test2").click(function() {
		$("#disp").empty();
		
		$.getJSON('jq4json.jsp', function(datas){ // getJSON : json 전용 메소드
			// alert(datas);
			// $("#disp").text(datas); // object 출력
			
			let items = [];
			let str = "<ul>";
			$.each(datas.sangpum, function(index, data){ // jquery 반복문 : each
				// alert(index + " " + data);
				let s = "<li>" + data["code"] + " " + 
				data["sang"] + " " + 
				data["su"] + " " + 
				data.dan + "</li>";
				items.push(s);
			}); 
				str += items.join('') + "</ul>";
			
			// 배열의 모든 항목을 하나의 문자열로 결합
			$("#disp").html(items);
		});
	});
	
	// xml 읽기
	$("#test3").click(function(){
		// alert('3');
		$.get('jq4xml.jsp', function(datas){
			// alert(datas);
			// 하위 element(요소)를 검색할 때 find()
			// alert($(datas).find('sangpum').length);
			$(datas).find('sangpum').each(function(){
				let sangpum = $(this);
				let str = "<div>";
				str += sangpum.find('code').text() + " ";
				str += sangpum.find('sangname').text() + " ";
				str += sangpum.find('su').text() + " ";
				str += sangpum.find('danga').text()
				str += "</div>";
				$("#disp").append(str);
			});
			
		}).fail(function(){
			$("#disp").text('test3 처리 오류');
		});
	});
	
	// json 읽기2
	$('#test4').on("click", function(){
		// alert('4');
		$("#disp").empty();
		
		$.ajax({
			type:"get",	// 요청 방식 post
			url:'jq4json.jsp',
			// data:{'code':3, 'sang':'book'},	// jq4json.jsp?code=3&sang=book 과 동일
			dataType:"json",	// 반환 data type
			success:function(datas){
				// alert(datas);<tr><th>코드</th>
				
				let str = "";
				let count = 0;
				str += "<table border='1'>";
				str +=  "<tr><th>코드</th><th>품명</th><th>수량</th><th>단가</th></tr>";
				
				$.each(datas.sangpum, function(index, data){	// jquery $
					str += "<tr>";
					str += "<td>" + data["code"] + "</td>";
					str += "<td>" + data["sang"] + "</td>";
					str += "<td>" + data["su"] + "</td>";
					str += "<td>" + data.dan + "</td>";
					str += "</tr>";
					count++;
				});
				str += "</table>";
				$("#disp").append(str);
				$("#disp").append(`건수 : ${count}개`);  
			},
			error:function(){
				$("#disp").text('test4 처리 오류');	
			}
			
		});
	});
	
	// xml 읽기2
	$('#test5').on("click", function(){
		// alert('5');
		$("#disp").empty();
		
		$.ajax({
			type:"post",	// 요청 방식 post
			url:'jq4xml.jsp',
			dataType:"xml",	// 반환 data type
			success:function(datas){	
				let count = 0;
				let str = "<table border='1'>";
				str +=  "<tr><th>코드</th><th>품명</th><th>수량</th><th>단가</th></tr>";
				
				$(datas).find('sangpum').each(function(){
					str += "<tr>";	//  타겟의 요소 이름 체크 
					str += "<td>" + $(this).find("code").text() + "</td>";
					str += "<td>" + $(this).find("sangname").text() + "</td>";
					str += "<td>" + $(this).find("su").text() + "</td>";
					str += "<td>" + $(this).find("danga").text() + "</td>";
					str += "</tr>";
					count++;
				});
				str += "</table>";
				$("#disp").append(str);
				$("#disp").append(`건수(xml) : ${count}개`);  
			},
			error:function(){
				$("#disp").text('test5 처리 오류');	
			}
			
		});
	});		
});