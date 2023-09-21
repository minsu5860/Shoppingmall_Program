<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="layout/db_connect.jsp"%>

<%
    String sql = "select custno, custname, phone, address, "
            + "to_char(joindate, 'yyyy-mm-dd') joindate,"
            + "decode(grade, 'A', 'VIP', 'B', '일반', 'C', '직업', '누락') grade,"
            + "city from member_tbl_02";
    PreparedStatement pstmt = conn.prepareStatement(sql);
    ResultSet rs = pstmt.executeQuery();
	rs.next();
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	<link rel="stylesheet" href="./css/style.css?ver1.1.15">
		<script type="text/javascript">
			function checkValue() {
				
				var cv = document.data;
	
				if(!cv.custno.value) {
					alert("회원번호을 입력하세요.");
					cv.custno.focus();
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
	        <h2 class="title">회원정보조회</h2>
	        
	        <form name="data" action="z_inquiry.jsp" method="post" onsubmit="return checkVaule()">
	            <table class="table_line">
	                <tr>
	                    <th>회원번호</th>
	                    <td><input type="text" name="custno" size="20"></td>
	                </tr>
	                
	                <tr>
	                    <td colspan="2" align="center">
	                    <input type="submit" value="조회">
	                    <input type="button" value="취소" onclick="location.href='z_input.jsp'">                
	                    <input type="button" value="회원목록조회/수정" onclick="location.href='member_list.jsp'">                
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