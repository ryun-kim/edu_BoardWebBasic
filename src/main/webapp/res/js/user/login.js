var frm = document.querySelector('#frm');
if (frm) {
    function frmSubmitEvent(e){
        if(frm.uid.value.length <5 || frm.uid.value.length >20){
            alert('아이디는 5~20글자 입니다.');
            e.preventDefault()
        }else if (frm.upw.value.length<5){
            alert('비밀번호를 확인해 주세요.');
            e.preventDefault();
        }
    }
    frm.addEventListener('submit',frmSubmitEvent);


    var btnShowPw = document.querySelector('#btnShowPw');
    if(btnShowPw){
        btnShowPw.addEventListener('click',function (){
            if(frm.upw.type === 'password'){
                frm.upw.type ='text';
                btnShowPw.value ='비밀번호 숨기기';
            } else{
                frm.upw.type ='password';
                btnShowPw.value ='비밀번호 보이기';
            }
        });
    }
}