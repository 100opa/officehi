/**
 * @author 박재용
 * @editDate 23.12.29 ~23.12.30
 */
 
var useAllTime = "";

function getTime() {
    var d = new Date();
    var hour = addZeroIfNeeded(d.getHours());    // 시
    var min = addZeroIfNeeded(d.getMinutes());   // 분
    var sec = addZeroIfNeeded(d.getSeconds());   // 초

    var timeBoard = document.getElementById("currentTime"); // 값이 입력될 공간
    
    var time = hour + ":" + min + ":" + sec;    // 형식 지정
    
    useAllTime = time;
    
    timeBoard.innerHTML = time;    // 출력
    
    setTimeout(getTime, 1000);    // 1000밀리초(1초) 마다 반복
}

function leaveMessage() {
    var date = document.getElementById('date');
	
	/* 콘텐트가 <%=value %>인 내부 텍스트 결과를 가져오는 방식 */ 
	var dateText = date.textContent || date.innerText;
	var dateParts = dateText.split(" ");  // 공백을 기준으로 문자열을 나누기

	// dateParts 배열에서 필요한 부분 가져오기
	var year = dateParts[0];
	var month = dateParts[1];
	var day = dateParts[2];
	var dayOfWeek = dateParts[3];
	
	var leaveInfo = year + month + day + " " + useAllTime + "\n퇴근 처리 되었습니다.";
	alert(leaveInfo);
	
	return true;
}

function arrivalMessage() {
	var arrivalConfirm = confirm('출근 처리 하시겠습니까?');
	
	if(arrivalConfirm) {
		var arrivalDupl = document.getElementById('arrivalDupl');
		
		if(!arrivalDupl){
		    var date = document.getElementById('date');
			
			var dateText = date.textContent || date.innerText;
			var dateParts = dateText.split(" ");
		
			var year = dateParts[0];
			var month = dateParts[1];
			var day = dateParts[2];
			var dayOfWeek = dateParts[3];
				
			var leaveInfo = year + month + day + " " + useAllTime + "\n출근 처리 되었습니다.";
			alert(leaveInfo);
			return true;
		}else {
			return false;
		}
	}else {
		return false;
	}
}