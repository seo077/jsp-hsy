/* 아이디 검사*/
 function idcheck(id){
    const a = document.querySelector('#al0');
    var idRegExp = /^[a-zA-z0-9]{4,12}$/; // 아이디 유효성 검사
    if(id.value===""){
         a.innerText="필수 정보입니다.";
       	a.setAttribute('style','color: red;  position: absolute; left: 40%; visibility: visible;');
    }else if(!idRegExp.test(id.value)){
         a.innerText="아이디는 영문 대소문자와 숫자 4~12자리로 입력해야합니다.";
       	a.setAttribute('style','color: red;  position: absolute; left: 40%; visibility: visible;');
     }else{
        a.innerText="";
		a.setAttribute('style','color: red;  position: absolute; left: 40%; visibility: hidden;');
        return true;
    }
    return false;
 }

/*비밀번호 검사*/
function pwcheck(id){
    const a = document.querySelector('#al1');
    var pwRegExp = /^[a-zA-z0-9]{4,12}$/; /* 비밀번호 유효성 검사*/
    if(id.value===""){
         a.innerText="필수 정보입니다.";
         a.setAttribute('style','color: red; position: absolute; left: 40%; visibility: visible;');
    }else if(!pwRegExp.test(id.value)){
        a.innerText="비밀번호는 영문 대소문자와 숫자 4~12자리로 입력해야합니다.";
        a.setAttribute('style','color: red; position: absolute; left: 40%; visibility: visible;');
    }else{
        a.innerText="";
        a.setAttribute('style','color: red; position: absolute; left: 40%; visibility: hidden;');
        return true;
    }
    return false;
 }

//비밀번호 재확인 검사
function re_pwcheck(id){
    const pw =  document.querySelector('#pwpw');
    const a = document.querySelector('#al2');
    if(id.value===""){
         a.innerText="필수 정보입니다.";
         a.setAttribute('style','color: red; position: absolute; left: 40%; visibility: visible;');
    }else{
       if(id.value.valueOf() !== pw.value.valueOf()){
         a.innerText="비밀번호가 일치하지 않습니다.";
         a.setAttribute('style','color: red; position: absolute; left: 40%; visibility: visible;');
       }else{
         a.innerText="";
         a.setAttribute('style','color: red; position: absolute; left: 40%; visibility: hidden;');
         return true;
       }
    }
    return false;
 }

//이름 검사
function namecheck(id){
    const a = document.querySelector('#al3');
     if(id.value===""){
          a.innerText="필수 정보입니다.";
          a.setAttribute('style','color: red; position: absolute; left: 40%; visibility: visible;');
     }else{
         a.innerText="";
         a.setAttribute('style','color: red; position: absolute; left: 40%; visibility: hidden;');
         return true;
     }
     return false;
}
//생년월일 중 '년'검사
function yearcheck(id){
    const a = document.querySelector('#al4');
     if(id.value==="년(4자)" || id.value===""){
          a.innerText="필수 정보입니다.";
          a.setAttribute('style','color: red; position: absolute; left: 40%; visibility: visible;');
     }else if(id.value.length !== 4){
        a.innerText="태어난 년도 4자리를 정확하게 입력하세요.";
        a.setAttribute('style','color: red; position: absolute; left: 40%; visibility: visible;');
     }else{
         a.innerText="";
         a.setAttribute('style','color: red; position: absolute; left: 40%; visibility: hidden;');
         return true;
     }
     return false;
}
//생년월일 중 '월'검사
function monthcheck(id){
    const a = document.querySelector('#al4');
     if(id.value==="월"){
          a.innerText="필수 정보입니다.";
          a.setAttribute('style','color: red; position: absolute; left: 40%; visibility: visible;');
     }else{
         a.innerText="";
         a.setAttribute('style','color: red; position: absolute; left: 40%; visibility: hidden;');
         return true;
     }
     return false;
}
//생년월일 중 '일'검사
function datecheck(id){
    const a = document.querySelector('#al4');
     if(id.value.valueOf()==="일" || id.value.valueOf()===""){
          a.innerText="필수 정보입니다.";
          a.setAttribute('style','color: red; position: absolute; left: 40%; visibility: visible;');
     }else if(id.value<1 || id.value>31){
          a.innerText="'일'을 정확하게 입력해주세요.";
          a.setAttribute('style','color: red; position: absolute; left: 40%; visibility: visible;');
     }else{
         a.innerText="";
         a.setAttribute('style','color: red; position: absolute; left: 40%; visibility: hidden;');
         return true;
     }
     return false;
}
//성별 검사
function gendercheck(id){
    const a = document.querySelector('#al5');
     if(id.value==="성별"){
          a.innerText="필수 정보입니다.";
          a.setAttribute('style','color: red; position: absolute; left: 40%; visibility: visible;');
     }else{
         a.innerText="";
         a.setAttribute('style','color: red; position: absolute; left: 40%; visibility: hidden;');
         return true;
     }
     return false;
}

//이메일 검사
function emailcheck(id){
    const a = document.querySelector('#alE');
     if(id.value !== "" || id.value !== "선택입력"){
         var emailRegExp = /^[A-Za-z0-9_]+[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{1,3}$/;
         if(!emailRegExp.test(id.value)){
          a.innerText="이메일 형식이 올바르지 않습니다.";
          a.setAttribute('style','color: red; position: absolute; left: 40%; visibility: visible;');	
         }else{
             a.innerText="";
             a.setAttribute('style','color: red; position: absolute; left: 40%; visibility: hidden;');
             return true;
         }
     }else{
         a.innerText="";
         a.setAttribute('style','color: red; position: absolute; left: 40%; visibility: hidden;');
         return true;
     }
     return false;
}
//전화번호 검사
function numbercheck(id){
    const a = document.querySelector('#al6');
     if(id.value==="전화번호 입력" || id.value===""){
          a.innerText="필수 정보입니다.";
          a.setAttribute('style','color: red; position: absolute; left: 40%; visibility: visible;');
     }else if(id.value.length !== 11){
         a.innerText="형식에 맞지 않은 전화번호입니다.";
        a.setAttribute('style','color: red; position: absolute; left: 40%; visibility: visible;');
     }else{
         a.innerText="";
         a.setAttribute('style','color: red; position: absolute; left: 40%; visibility: hidden;');
         return true;
     }
     return false;
}
//인증번호 검사
function verification(id){
    const code = document.querySelector('#code');
    const a = document.querySelector('#al6');
     if(id.value==="인증번호를 입력하세요" || id.value===""){
          a.innerText="필수 정보입니다.";
          a.setAttribute('style','color: red; position: absolute; left: 40%; visibility: visible;');
     }else if(id.value.valueOf() !== code.value.valueOf()){
          a.innerText="일치하지 않는 인증번호입니다.";
          a.setAttribute('style','color: red; position: absolute; left: 40%; visibility: visible;');
     }
     else{
         a.innerText="";
         a.setAttribute('style','color: red; position: absolute; left: 40%; visibility: hidden;');
         return true;
     }
     return false;
}

//인증번호 발급
function verificationCode(){
    const hide = document.querySelector('#code');
    let code = Math.floor(Math.random()*9999)+1000;
    const number = document.querySelector('#number');
    if(numbercheck(number)){
        alert(`인증번호 : ${code}`);
        hide.value=code;
    }
    
}

//모든 정보 유효성 검사
function checkVal(form) {
    //유효한 데이터 개수(check==10 -> submit)
    let check = 0;

    if (idcheck(form.id)) {
        check++;
    }
    if (pwcheck(form.pw)) {
        check++;
    }
    if (re_pwcheck(form.re_pw)) {
        check++;
    }
    if (namecheck(form.name)) {
        check++;
    }
    if (yearcheck(form.year)) {
        check++;
    }
    if (monthcheck(form.month)) {
        check++;
    }
    if (datecheck(form.date)) {
        check++;
    }
    if (gendercheck(form.gender)) {
        check++;
    }
    if (numbercheck(form.number)) {
        check++;
    }
    if (verification(form.num)) {
        check++;
    }

    //필수 정보가 모두 채워지면 제출
    if (check === 10) {
        form.submit();
    }
}