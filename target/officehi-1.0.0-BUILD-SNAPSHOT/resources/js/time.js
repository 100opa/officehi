function getTime() {
    var d = new Date();
    var hour = addZeroIfNeeded(d.getHours());    // 시
    var min = addZeroIfNeeded(d.getMinutes());   // 분
    var sec = addZeroIfNeeded(d.getSeconds());   // 초

    var timeBoard = document.getElementById("currentTime"); // 값이 입력될 공간
    
    var time = hour + ":" + min + ":" + sec;    // 형식 지정
    
    timeBoard.innerHTML = time;    // 출력
    
    setTimeout(getTime, 1000);    // 1000밀리초(1초) 마다 반복
}

function addZeroIfNeeded(value) {
    // 숫자가 한 자리 수이면 앞에 0을 추가
    return value < 10 ? "0" + value : value;
}