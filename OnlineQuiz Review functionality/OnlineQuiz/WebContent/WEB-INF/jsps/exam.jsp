<%@ page language="java" import="co.edureka.quiz.*"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Quiz</title>
<style type="text/css">

</style>
<script language="javascript">
	var tim;
	var min = '${sessionScope.min}';
	var sec = '${sessionScope.sec}';

	function customSubmit(someValue) {
		document.questionForm.minute.value = min;
		document.questionForm.second.value = sec;
		document.questionForm.submit();
	}

	function examTimer() {
		if (parseInt(sec) > 0) {

			document.getElementById("showtime").innerHTML = "Time Remaining :"
					+ min + " Minute ," + sec + " Seconds";
			sec = parseInt(sec) - 1;
			tim = setTimeout("examTimer()", 1000);
		} else {

			if (parseInt(min) == 0 && parseInt(sec) == 0) {
				document.getElementById("showtime").innerHTML = "Time Remaining :"
						+ min + " Minute ," + sec + " Seconds";
				alert("Time Up");
				document.questionForm.minute.value = 0;
				document.questionForm.second.value = 0;
				document.questionForm.submit();

			}

			if (parseInt(sec) == 0) {
				document.getElementById("showtime").innerHTML = "Time Remaining :"
						+ min + " Minute ," + sec + " Seconds";
				min = parseInt(min) - 1;
				sec = 59;
				tim = setTimeout("examTimer()", 1000);
			}

		}
	}
</script>

</head>
<br />

<body onload="examTimer()">

	<div style="position: absolute; left: 50px; top: 20px">
		<%
		int currentQuestion=0;
		for(int i=0;i<10;i++){
			 currentQuestion = ((Exam) request.getSession().getAttribute("currentExam")).getCurrentQuestion();
			// System.out.println("Question Number "+currentQuestion+ " retrieved ");
		}
		%>
		Current Question ${sessionScope.quest.questionNumber+1} / 10
		
	</div>

	<div id="showtime" style="position: absolute; left: 800px; top: 20px"></div>

	<div
		style="position: absolute; width: 1000px; padding: 25px; height: 200px; border: 1px solid green; left: 100px; top: 60px">
		<span>${sessionScope.quest.question}</span><br /> <br />
		

		<form action="exam" method="post" name="questionForm">
			<c:forEach var="choice" items="${sessionScope.quest.questionOptions}"
				varStatus="counter">
				<input type="radio" name="answer" value="${counter.count}"> ${choice}  <br />
			</c:forEach>
			<br />

			<%
				if (currentQuestion > 0) {
			%>
			<input class="button quizbutton" type="submit" name="action"
				value="Previous" />
			<%
				}
			%>

			<%
				if (currentQuestion < (Exam.numberOfQuestions - 1)) {
			%>
			<input class="button quizbutton" type="submit" name="action"
				value="Next" />
			<%
				}
			%>
			<input class="button finish" type="submit" name="action"
				value="Save and Finish Exam" /> <a
				href='${pageContext.request.contextPath}'>
				<div class="button cancelandreturn">Cancel and Return</div>
			</a> <input type="hidden" name="minute" /> <input type="hidden"
				name="second" />

		</form>


	</div>



</body>
</html>