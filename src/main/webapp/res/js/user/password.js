var frmElem = document.querySelector('#frm');
var submitBtnElem = document.querySelector('#submitBtn');

submitBtnElem.addEventListener('click',function(){
    // 현재 비밀번호도 5자 이하면 alert
    // 변경 비밀번호도 5자 이하면 alert
    // 변경 비밀번호랑 확인 비밀번호 값이 다르면 alert
    // 위에 3개 통과하면 frmElem.submit() 호출
    if(frmElem.upw.value.length <5){
        alert('현재 비밀번호를 확인해 주세요 .');
    }else if (frmElem.changedUpw.value.length <5){
        alert('변경 비밀번호를 확인해 주세요.');
    }else if (frmElem.changedUpw.value !== frmElem.changedUpwConfirm.value){
        alert('변경 비밀번호와 확인 비밀번호가 다릅니다.');
    }else {
        frmElem.submit();
    }
});