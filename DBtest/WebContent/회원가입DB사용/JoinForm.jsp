<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script language="javascript">
   function wow() {
      //정규식
      var reObj = /\w*/;
      var idObj = document.getElementById("id").value;//회원가입 id
      var aa = reObj.exec(idObj);
      
      var mailRb = /^[\w.%+\-]+@[\w.\-]+\.[A-Za-z]{2,3}$/;
      var mailObj = document.getElementById("userEmail").value;//메일 입력 받기.
      var resultMail = mailRb.exec(mailObj);
      
      var pwObj = document.getElementById("userPW").value; //비밀번호 받아오기
      var pwObj2 = document.getElementById("userPW2").value; // 비밀번호 확인
      var pwRs = reObj.exec(pwObj);
      
      var num1 = document.getElementById("userNum");
      var num2 = document.getElementById("userNum2");
      var arrNum1 = new Array(); // 주민번호 앞자리숫자 6개를 담을 배열
      var arrNum2 = new Array(); // 주민번호 뒷자리숫자 7개를 담을 배열
       
	  var year = document.getElementById("user_birth_year");
	  var month = document.getElementById("user_birth_month");
	  var day = document.getElementById("user_birth_day");
      var hobby = document.getElementsByName("hobby");
      var selfInt = document.getElementById("self").value;
      
      if(idObj.length<4 || idObj.length > 12 || idObj != aa)
         {
            alert("ID 형식에 맞지 않습니다.");
            document.getElementById("id").value = "";
            document.getElementById("id").focus();
         }
      
      if(pwObj.length<4 || pwObj.length > 12 || pwRs != pwObj2)
      {
       		alert("패스워드 형식에 맞지 않습니다.");
       		document.getElementById("userPW").value = "";
       		document.getElementById("userPW2").value = "";
       		document.getElementById("userPW").focus();
      }
      if(resultMail != mailObj)
      {
    	  	alert("메일 형식에 맞지 않습니다.");
          	document.getElementById("userEmail").value = "";
          	document.getElementById("userEmail").focus();
      }
      
      // -------------- 주민번호 -------------
      for (var i=0; i<num1.value.length; i++) {
          arrNum1[i] = num1.value.charAt(i);
      } // 주민번호 앞자리를 배열에 순서대로 담는다.
      for (var i=0; i<num2.value.length; i++) {
          arrNum2[i] = num2.value.charAt(i);
      } // 주민번호 뒷자리를 배열에 순서대로 담는다.
      var tempSum=0;
      for (var i=0; i<num1.value.length; i++) {
          tempSum += arrNum1[i] * (2+i);
      } // 주민번호 검사방법을 적용하여 앞 번호를 모두 계산하여 더함
      for (var i=0; i<num2.value.length-1; i++) {
          if(i>=2) {
              tempSum += arrNum2[i] * i;
          }
          else {
              tempSum += arrNum2[i] * (8+i);
          }
      } // 같은방식으로 앞 번호 계산한것의 합에 뒷번호 계산한것을 모두 더함
      if((11-(tempSum%11))%10!=arrNum2[6]) {
          alert("올바른 주민번호가 아닙니다.");
          num1.value = "";
          num2.value = "";
          num1.focus();
          return false;
      }else{
    	// ------------ 생일 자동 등록 -----------
          if(arrNum2[0]==1 || arrNum2[0]==2) {
              var y = parseInt(num1.value.substring(0,2));
              var m = parseInt(num1.value.substring(2,4));
              var d = parseInt(num1.value.substring(4,6));
              year.value = 1900 + y;
              month.value = m;
              day.value = d;
          }
          else if(arrNum2[0]==3 || arrNum2[0]==4) {
              var y = parseInt(num1.value.substring(0,2));
              var m = parseInt(num1.value.substring(2,4));
              var d = parseInt(num1.value.substring(4,6));
              year.value = 2000 + y;
              month.value = m;
              day.value = d;
          }
      }
      
      if(hobby[0].checked==false &&
    		  hobby[1].checked==false &&
    		  hobby[2].checked==false &&
    		  hobby[3].checked==false &&
    		  hobby[4].checked==false) {
              alert("관심분야를 골라주세요");
              return false;
          }
          if(selfInt=="") {
              alert("자기소개를 적어주세요");
              self.focus();
              return false;
          }
          
          alert("회원가입이 완료되었습니다.");
          
          document.join.submit();
   }
</script>
</head>
<body>
	<form name = "join" action="JoinProcess.jsp" id="f1" method="post">
		<div align="center">
			<table>
				<table border="1">
					<th colspan="2" " bgcolor="#e9e9e9">회원 기본 정보</th>
					<tr>
						<td bgcolor="powderblue" align="center">아이디 :</td>
						<td><input type="text" id="id" name = "id"> 4~12자의 영문 대소문자와 숫자로만
							입력</td>
					</tr>
					<tr>
						<td bgcolor="powderblue" align="center">비밀 번호 :</td>
						<td><input type="password" id="userPW" name = "password"> 4~12자의 영문
							대소문자와 숫자로만 입력</td>
					</tr>
					<tr>
						<td bgcolor="powderblue" align="center">비밀 번호 확인 :</td>
						<td><input type="password" id="userPW2"></td>
					</tr>
					<tr>
						<td bgcolor="powderblue" align="center">메일주소 :</td>
						<td><input type="email" id="userEmail" name = "email">예)id@domain.com</td>
					</tr>
					<th colspan="2" bgcolor="#e9e9e9">개인 신상 정보</th>
					<tr>
						<td bgcolor="powderblue" align="center">주민등록 번호:</td>
						<td><input type="text" id="userNum" name = "priNum1">-<input
							type="password" id="userNum2" name = "priNum2">예)123456-1234567</td>
					</tr>
					<tr>
						<td bgcolor="powderblue" align="center">주소:</td>
						<td><input type="text" id="sample4_postcode"placeholder="우편번호" name = "addrNum1"> 
						<input type="button" name = "addrNum2" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
						<input type="text" name = "addrNum3" id="sample4_roadAddress" placeholder="도로명주소">
						<input type="text" name = "addrNum4" id="sample4_jibunAddress" placeholder="지번주소">
						<span id="guide" style="color: #999"></span></td>
					</tr>
					<tr>
						<td bgcolor="powderblue" align="center">생일</td>
						<td><input type="text" id="user_birth_year" size="10" name = "birYear">년
							<input type="text" id="user_birth_month" size="10" name = "birMonth">월
							 <input type="text" id="user_birth_day" size="10" name = "birDay">일</td>
					</tr>
					<tr>
						<td bgcolor="powderblue" align="center">관심분야 :</td>
						<td>
							<input type="checkbox" name="hobby" value="컴퓨터" >컴퓨터 
							<input type="checkbox" name="hobby" value="인터넷">인터넷 
							<input type="checkbox" name="hobby" value="여행">여행 
							<input type="checkbox" name="hobby" value="영화감상">영화감상 
							<input type="checkbox" name="hobby" value="음악감상">음악감상
						</td>
					</tr>
					<tr>
						<td bgcolor="powderblue" align="center">자기소개:</td>
						<td><textarea rows="5" , cols="50" id="self" name = "self"></textarea></td>
					</tr>
				</table>
				</div>
				<div align="center">
					<input type="button" value="회원가입" onclick="wow()"> <input
						type="reset" value="다시 입력">
				</div>
				</form>
				<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
				<script>
					function sample4_execDaumPostcode() {
						new daum.Postcode(
								{
									oncomplete : function(data) {
										// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
										// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
										// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
										var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
										var extraRoadAddr = ''; // 도로명 조합형 주소 변수
										// 법정동명이 있을 경우 추가한다. (법정리는 제외)
										// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
										if (data.bname !== ''
												&& /[동|로|가]$/g.test(data.bname)) {
											extraRoadAddr += data.bname;
										}
										// 건물명이 있고, 공동주택일 경우 추가한다.
										if (data.buildingName !== ''
												&& data.apartment === 'Y') {
											extraRoadAddr += (extraRoadAddr !== '' ? ', '
													+ data.buildingName
													: data.buildingName);
										}
										// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
										if (extraRoadAddr !== '') {
											extraRoadAddr = ' ('
													+ extraRoadAddr + ')';
										}
										// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
										if (fullRoadAddr !== '') {
											fullRoadAddr += extraRoadAddr;
										}
										// 우편번호와 주소 정보를 해당 필드에 넣는다.
										document
												.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
										document
												.getElementById('sample4_roadAddress').value = fullRoadAddr;
										document
												.getElementById('sample4_jibunAddress').value = data.jibunAddress;
										// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
										if (data.autoRoadAddress) {
											//예상되는 도로명 주소에 조합형 주소를 추가한다.
											var expRoadAddr = data.autoRoadAddress
													+ extraRoadAddr;
											document.getElementById('guide').innerHTML = '(예상 도로명 주소 : '
													+ expRoadAddr + ')';
										} else if (data.autoJibunAddress) {
											var expJibunAddr = data.autoJibunAddress;
											document.getElementById('guide').innerHTML = '(예상 지번 주소 : '
													+ expJibunAddr + ')';
										} else {
											document.getElementById('guide').innerHTML = '';
										}
									}
								}).open();
					}
				</script>
</body>
</html>