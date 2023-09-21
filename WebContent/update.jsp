<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="layout/db_connect.jsp"%>

<%
	String sql = "select custno, custname, phone, address, "
			   + "to_char(joindate, 'yyyy-mm-dd') joindate,"
			   + "grade,"
			   + "city from member_tbl_02 where custno=" + request.getParameter("custno");
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	rs.next();
	int num = rs.getInt(1);
	
	String s_custno = rs.getString("custno");
	String s_custname = rs.getString("custname");
	String s_phone = rs.getString("phone");
	String s_address = rs.getString("address");
	String s_joindate= rs.getString("joindate");
	String s_grade = rs.getString("grade");
	String s_city = rs.getString("city");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="./css/style.css?ver1.1.18">
	<script type="text/javascript">
 		function checkValue() {
	 		var cv = document.data;
	 		
	 		if(!cv.custname.value) {
	 			alert("회원성명을 입력하세요.");
	 			cv.custname.focus();
	 			return false;
	 		}
	 		if(!cv.phone.value) {
	 			alert("회원전화를 입력하세요.");
	 			cv.phone.focus();
	 			return false;
	 		}
	 		if(!cv.address.value) {
	 			alert("회원주소을 입력하세요.");
	 			cv.address.focus();
	 			return false;
	 		}
	 		if(!cv.joindate.value) {
	 			alert("가입일자를 입력하세요.");
	 			cv.joindate.focus();
	 			return false;
	 		}
	 		if(!cv.grade.value) {
	 			alert("고객등급을 입력하세요.");
	 			cv.grade.focus();
	 			return false;
	 		}
	 		if(!cv.city.value) {
	 			alert("도시코드를 입력하세요.");
	 			cv.city.focus();
	 			return false;
	 		}
	 	}
	 	
	</script>
</head>
<body>
	<header>
		<jsp:include page="layout/header.jsp"></jsp:include>
	</header>
	
	<nav>
		<jsp:include page="layout/nav.jsp"></jsp:include>
	</nav>
	
	<main class="section">
		<h2 class="title">회원정보 수정</h2>
		
		<form name="data" action="update_p.jsp" method="post" onsubmit="return checkValue()">
			<table class="table_line">
				<tr>
					<th>회원번호(자동생성)</th>
					<td><input type="text" name="custno" value="<%= num %>" size="20" readonly></td>
				</tr>
				<tr>
					<th>회원성명</th>
				<td><input type="text" name="custname" size="20" placeholder="성명을 입력해주세요." value="<%= s_custname %>" autofocus></td>
				</tr>
				<tr>
					<th>회원전화</th>
					<td><input type="text" name="phone" placeholder="ex) 010-1234-5678" value="<%= s_phone %>" size="20"y></td>
				</tr>
				<tr>
					<th>회원주소</th>
					<td><input type="text" name="address" placeholder="서울특별시 종로구 청와대로 1" value="<%= s_address %>" size="20"></td>
				</tr>
				<tr>
					<th>가입일자</th>
					<td><input type="text" name="joindate" value="<%= s_joindate %>" size="20"></td>
				</tr>
				<tr>
					<th>고객등급 A-VIP B-일반 C-직원</th>
					<td><input type="text" name="grade" value="<%= s_grade %>" size="20"></td>
				</tr>
				<tr>
					<th>도시코드</th>
					<td><input type="text" name="city" value="<%= s_city %>"size="20"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="수정">
						<input type="button" value="조회" onclick="location.href='member_list.jsp'">		
					</td>
				</tr>
		</table>
		</form>
	</main>

	<footer>
		<jsp:include page="layout/footer.jsp"></jsp:include>
	</footer>
</body>
</html>