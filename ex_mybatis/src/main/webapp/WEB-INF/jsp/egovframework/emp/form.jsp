<%@ page language="java" pageEncoding="utf-8" 	contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/1999/REC-html401-19991224/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="content-language" content="ko">
<c:set var="flag" value="${empty emp.empNo ? '등록' : '수정'}"/>
<title>DataAccess | 사원정보<c:out value="${flag}"/> </title>
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/egov.css'/>">
<script type="text/javaScript" language="javascript">
	function saveEmployee() {
		
		frm = document.empForm;

		if(frm.empNm.value == ""){
			alert("이름을 입력하세요.");
			return;
		}
		if(frm.birthdate.value == ""){
			alert("생년월일을 입력하세요.");
			return;
		}
		if(frm.telephone.value == ""){
			alert("핸드폰번호를 입력하세요.");
			return;
		}
		if(frm.address.value == ""){
			alert("주소를 입력하세요.");
			return;
		}
		
	   	if("<c:out value="${flag}"/>" == "등록"){
	   		if(confirm("<spring:message code="msg.insert" />")){
	   			frm.action  = "<c:url value='/emp/insertEmployee.do'/>";
	   			frm.submit();		
	   		}
	   	}else{
	   		if(confirm("<spring:message code="msg.update" />")){
	   			frm.action  = "<c:url value='/emp/updateEmployee.do'/>";
	   			frm.submit();		
	   		}
	   	}
	}
	function goToList() {
		document.empForm.action = "<c:url value='/emp/retrieveEmployeeList.do'/>";
		document.empForm.submit();
	}
</script>
</head>

<body style="text-align: center; margin: 0 auto; display: inline; padding-top: 100px;">
	<div id="content_pop">
		<form:form name="empForm" commandName="emp" method="post">
			 <div id="home">
				<span class="btn_blue_l" title="<spring:message code="button.home" />">
					<a href="../index.jsp"><spring:message code="button.home" /></a>
					<img src="<c:url value='/images/egovframework/rte/btn_bg_r.gif'/>" alt="<spring:message code="button.home" />" style="margin-left:6px;" />
				</span>
			</div>
			<div id="title2">
				<ul>
					<c:if test="${flag=='등록'}">
						<li><img src="<c:url value='/images/egovframework/rte/title_dot.gif'/>" alt="" /> <spring:message code="emp.create" /></li>
					</c:if>
					<c:if test="${flag=='수정'}">
						<li><img src="<c:url value='/images/egovframework/rte/title_dot.gif'/>" alt="" /> <spring:message code="emp.update" /></li>
					</c:if>
				</ul>
			</div>
			<div id="table">
				<table width="100%" border="1" cellpadding="0" cellspacing="0" style="border-top:#C2D0DB 2px solid; border-left:#ffffff 1px solid; border-right:#ffffff 1px solid; border-bottom:#C2D0DB 1px solid; border-collapse: collapse;" summary="사원정보를 등록하고 수정할 수 있다.">
					<caption>사원정보 등록 및 수정</caption>
					<colgroup>
						<col width="80">
						<col width="">
					</colgroup>
					<c:if test="${flag=='수정'}">
					<tr>
						<td class="tbtd_caption"><spring:message code="emp.empNo" /></td>
						<td class="tbtd_content"><form:hidden path="empNo" /><c:out value="${emp.empNo}" /></td>
					</tr>
					</c:if>
					<tr>
						<td class="tbtd_caption"><spring:message code="emp.empNm" /></td>
						<td class="tbtd_content"><form:input path="empNm" /><form:errors path="empNm" /></td>
					</tr>
					<tr>
						<td class="tbtd_caption"><spring:message code="emp.birthdate" /></td>
						<td class="tbtd_content"><form:input path="birthdate" /><form:errors path="birthdate" /></td>
					</tr>
					<tr>
						<td class="tbtd_caption"><spring:message code="emp.telephone" /></td>
						<td class="tbtd_content"><form:input path="telephone" /><form:errors path="telephone" /></td>
					</tr>
					<tr>
						<td class="tbtd_caption"><spring:message code="emp.address" /></td>
						<td class="tbtd_content"><form:input path="address" /><form:errors path="address" /></td>
					</tr>
				</table>
			</div>
			<div id="sysbtn">
				<ul>
					<!-- 저장 버튼 -->
					<li>
						<span class="btn_blue_l" title="<spring:message code="button.save" />">
							<a href="#link" onClick="javascript:saveEmployee(); return false;"><spring:message code="button.save" /></a>
							<img src="<c:url value='/images/egovframework/rte/btn_bg_r.gif'/>" alt="<spring:message code="button.save" />" style="margin-left:6px;" />
						</span>
					</li>
					<!-- 목록 버튼 -->
					<li>
						<span class="btn_blue_l" title="<spring:message code="button.list" />">
							<a href="#link" onClick="javascript:goToList(); return false;"><spring:message code="button.list" /></a>
							<img src="<c:url value='/images/egovframework/rte/btn_bg_r.gif'/>" alt="<spring:message code="button.list" />" style="margin-left:6px;" />
						</span>
					</li>
					<!-- 초기화 버튼 -->
					<li>
						<span class="btn_blue_l" title="<spring:message code="button.reset" />">
							<a href="#link" onClick="javascript:document.empForm.reset(); return false;"><spring:message code="button.reset" /></a>
							<img src="<c:url value='/images/egovframework/rte/btn_bg_r.gif'/>" alt="<spring:message code="button.reset" />" style="margin-left:6px;" />
						</span>
					</li>
				</ul>
			</div>
			<!-- 검색조건 유지 -->
			<input type="hidden" name="searchCondition" value="<c:out value='${emp.searchCondition}'/>"/>
			<input type="hidden" name="searchKeyword" value="<c:out value='${emp.searchKeyword}'/>"/>
			<input type="hidden" name="pageIndex" value="<c:out value='${emp.pageIndex}'/>"/>
		</form:form>
	</div>
</body>
</html>