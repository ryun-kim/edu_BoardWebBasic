var cmtListContainerElem = document.querySelector('#cmtListContainer');
var cmtModContainerElem = document.querySelector('.cmtModContainer');

// (댓글 수정) 취소 버튼 클릭 이벤트 연결
var btnCancelElem = cmtModContainerElem.querySelector('#btnCancel');
btnCancelElem.addEventListener('click',function (){
    cmtModContainerElem.style.display = 'none';
});


if(cmtListContainerElem) {
    function openModForm({icmt, ctnt}){ // 구조 분해 할당 사용함

        cmtModContainerElem.style.display = 'flex';
        var cmtModFrmElem = cmtModContainerElem.querySelector('#cmtModFrm');
        cmtModFrmElem.icmt.value = icmt;
        cmtModFrmElem.ctnt.value = ctnt;
    }
    function getList() {
        var iboard = cmtListContainerElem.dataset.iboard;
        var url = '/board/cmt?iboard=' + iboard;

        fetch(url).then(function(res) {
            return res.json();
        }).then(function(data) {
            console.log(data);
            displayCmt2(data);
        }).catch(function (err) {
            console.log(err);
        })
    }
    function displayCmt2(data) {
        var tableElem = document.createElement('table');
        tableElem.innerHTML = `
            <tr>
                <th>내용</th>
                <th>작성자</th>
                <th>작성일</th>
                <th>비고</th>
            </tr>
        `; //템플릿 리터널
        cmtListContainerElem.appendChild(tableElem);

        data.forEach(function(item) {
            var tr = document.createElement('tr');
            var ctnt = item.ctnt.replaceAll('<', '&lt;').replaceAll('>', '&gt;');
            tr.innerHTML = `
                <td>${ctnt}</td>
                <td>${item.writerNm}</td>
                <td>${item.rdt}</td>
            `;
            tableElem.appendChild(tr);

            if(loginUserpk === item.writer ){
                var lastTd = document.createElement('td');
                var btnMod = document.createElement('button');
                btnMod.innerText='수정';
                btnMod.addEventListener('click',function (){
                    openModForm(item);
                })
                var btnDel = document.createElement('button');
                btnDel.innerText = '삭제';
                lastTd.appendChild(btnMod);
                lastTd.appendChild(btnDel);
            }
            tr.appendChild(lastTd);
        });
    }

    function displayCmt(data) {
        var tableElem = document.createElement('table');

        var tr = document.createElement('tr');
        var th1 = document.createElement('th');
        th1.innerText = '내용';
        var th2 = document.createElement('th');
        th2.innerText = '작성자';
        var th3 = document.createElement('th');
        th3.innerText = '작성일';
        var th4 = document.createElement('th');
        th4.innerText = '비고';
        tr.appendChild(th1);
        tr.appendChild(th2);
        tr.appendChild(th3);
        tr.appendChild(th4);

        tableElem.appendChild(tr);
        cmtListContainerElem.appendChild(tableElem);
    }
    getList();
}