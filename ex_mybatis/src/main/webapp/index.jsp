<%@ page language="java" pageEncoding="utf-8" 	contentType="text/html; charset=utf-8" session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>DataAccess | MYBATIS 예제</title>
<style type="text/css">
body, p, pre {
    font-family: 나눔고딕;
    font-size: 15px;
    color: #666;
}
#menu, #menu li a{
    list-style-type: square;
    font-size: 15px;
    text-decoration: none;
    color: #333;
}
#menu li a:hover {
   font-weight: bold;
}
span {
background-color: #EAEAEA; font-weight: bold; 
}
</style>
</head>
<body>
<h1>MYBATIS 예제</h1>
<p>
<pre>
<span>[요약]</span>
아래는 MyBatis 적용을 돕기 위한 예제로,
1) DAO 클래스 대신 "Mapper 인터페이스"로 구현하는 방법과
2) EgovAbstractMapper 추상클래스를 상속하여 기존 DAO 클래스를 구현하는 방법으로 두 가지 예제를 제공한다.

<span>[ 표준프레임워크 MyBatis 적용 시 준수사항 ]</span>
1)의 경우, Mapper 인터페이스에 반드시 @Mapper를 선언해야 한다. 
@Mapper 스캔을 위해 egovframework.rte.psl.dataaccess.mapper.MapperConfigurer 클래스를 빈으로 등록하고, basePackage 프로퍼티를 설정한다.
2)의 경우, EgovAbstractMapper를 변경할 수 없으며, 반드시 상속하거나 확장하여 활용해야 한다. 

<span>[ MyBatis 버전정보 ]</span>
mybatis 3.2.4
mybatis-spring 1.2.1
</pre>
</p>
<br />
<div>
	<ul id="menu">
		<li><a href="<c:out value='dept/retrieveDeptList.do' />">@Mapper를 이용한 Mapper 인터페이스 구현 예제</a></li><br />
		<li><a href="<c:out value='emp/retrieveEmployeeList.do' />">EgovAbstractMapper를 상속한 DAO 구현 예제</a></li>
	</ul>
</div>
</body>
</html>