/**
 * 회원가입 validation check 
 */

const contextLoot = "phycheck";

// 필수항목 체크
function signInCheck() {
   // id
   if(!document.joinform.id.value) {
      alert("아이디를 입력하세요.");
      document.joinform.id.focus();
      return false;
	//비밀번호 체크
	}else if(!document.joinform.password.value){ 
	  alert("비밀번호를 입력하세요.");
	  document.joinform.password.focus();
	  return false;
	//비밀번호 확인
	}else if(!document.joinform.re_password.value){
		alert("비밀번호 대시 입력하세요.");
		document.joinform.re_password.value = "";
		document.joinform.re_password.focus();
		return false;
	//비밀번호 일치여부
	}else if(document.joinform.password.value != document.joinform.re_password.value){
		alert("비밀번호가 일치하지 않습니다.");
		document.joinform.password.focus();
		return false;
	//이름 체크
	}else if(!document.joinform.name.value){
		alert("이름을 입력하세요.");
		document.joinform.name.focus();
		return false;
	//생일 체크
	}else if(!document.joinform.birthday.value){
		alert("생일을 입력하세요.");
		document.joinform.birthday.focus();
		return false;
	//주소 체크
	}else if(!document.joinform.address.value){
		alert("주소을 입력하세요.");
		document.joinform.address.focus();
		return false;
	//이메일 체크	
	}else if(!document.joinform.email1.value){
		alert("이메일을 입력하세요.");
		document.joinform.email1.focus();
		return false;	
	//이메일 형식 불일치 -> email2.value 미존재 && email3.value == 0일때 
	}else if(!document.joinform.email2.value && document.joinform.email3.value == 0){
		alert("이메일 형식이 일치하지 않습니다.");
		document.joinform.email2.focus();
		return false;
	
	
	// 2-1. join.jsp 폼 바로아래 추가
	//<input type="hidden" name="hiddenId" value="0">
	//hiddenId : 중복확인 버튼 클릭여부 체크(0:클릭안함, 1:클릭함)
	
	// 2. 중복확인 버튼 클릭하지 않은 경우 "중복확인 해주새요.";	
	}else if(document.joinform.hiddenId.value == "0"){
		alert("중복확인 해주세요");
		document.joinform.dupChk.focus();
		return false;
	}
}

// 아이디 중복확인 페이지 
// 1. 중복확인 페이지 open
function confirmId() {
   if(!document.joinform.id.value) {
      alert("아이디를 입력하세요.");
      document.joinform.id.focus();
      return false;
   }   
   
   const popupWidth = 300
   const popupHeight = 121
   
   const popupX = (window.screen.width / 2) - (popupWidth / 2)
   const popupY = (window.screen.height / 2) - (popupHeight / 2)
   const url = `/confirmIdAction?id=${document.joinform.id.value}`;
   window.open(url, "confirm", `menubar=no, width=${popupWidth}, height=${popupHeight}, left=${popupX}, top=${popupY}`);
}

//이메일 주소를 select 박스로 선택
function selectEmailChk(){
	if(document.joinform.email3.value != 0){
		document.joinform.email2.value = document.joinform.email3.value;
	}else{
		document.joinform.email2.value = "";
		document.joinform.email2.focus();
	}
}

// ----------- 아이디 중복확인 --------------------
//3. 중복확인창 포커스
function confirmIdFocus(){
	if (document.confirmform.id.value != null) {
		document.confirmform.id.focus();
	}
}

function confirmIdCheck(){
	if(!document.confirmform.id.value){
		alert("아이디를 입력하세요.");
		document.confirmform.id.focus();
		return false;
	}
}

//4. 자식 창에서 부모 창으로 id값을 전달
/*
	opener : window 객체의 open() 메서드로 열릴 새창(=중복확인창)에서 부모창(=회원가입폼)에 접근할 때 사용
	join.jsp - hiddenId : 중복확인
	self.close() : 내창 닫기*/
 
function setId(id){
	opener.document.joinform.id.value=id;
	opener.document.joinform.hiddenId.value="1";
	self.close();
}

// 카카오 주소 API
function execDaumPostcode() {
	new daum.Postcode({
		oncomplete: function(data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

			// 각 주소의 노출 규칙에 따라 주소를 조합한다.
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var addr = ''; // 주소 변수
			var extraAddr = ''; // 참고항목 변수

			//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
				addr = data.roadAddress;
			} else { // 사용자가 지번 주소를 선택했을 경우(J)
				addr = data.jibunAddress;
			}

			// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
			if(data.userSelectedType === 'R'){
				// 법정동명이 있을 경우 추가한다. (법정리는 제외)
				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
					extraAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if(data.buildingName !== '' && data.apartment === 'Y'){
					extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				}
				// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				if(extraAddr !== ''){
					extraAddr = ' (' + extraAddr + ')';
				}
				// 조합된 참고항목을 해당 필드에 넣는다.
				document.getElementById("extraAddress").value = extraAddr;

			} else {
				document.getElementById("extraAddress").value = '';
			}

			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			document.getElementById('postcode').value = data.zonecode;
			document.getElementById("address").value = addr;
			// 커서를 상세주소 필드로 이동한다.
			document.getElementById("detailAddress").focus();
		}
	}).open();
}

