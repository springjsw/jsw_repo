<%@ page language="java" pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/1999/REC-html401-19991224/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="content-language" content="ko">
<title>DataAccess | 사원상세조회</title>
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/egov.css'/>">
<script type="text/javaScript" language="javascript">
	function modifyEmployee() {
		document.empForm.action = "<c:url value='/emp/retrieveEmployeeForm.do'/>";
		document.empForm.submit();
	}
	function goToList() {
		document.empForm.action = "<c:url value='/emp/retrieveEmployeeList.do'/>";
		document.empForm.submit();
	}
	function deleteEmployee() {
		if(confirm("<spring:message code="msg.del" />")){
			document.empForm.action = "<c:url value='/emp/deleteEmployee.do'/>";
			document.empForm.submit();
		}
	}
</script>
</head>

<body style="text-align: center; margin: 0 auto; display: inline; padding-top: 100px;">
	<div id="content_pop">
		<form:form name="empForm" commandName="emp" method="post">
			<form:hidden path="empNo" />
			 <div id="home">
				<span class="btn_blue_l" title="<spring:message code="button.home" />">
					<a href="../index.jsp"><spring:message code="button.home" /></a>
					<img src="<c:url value='/images/egovframework/rte/btn_bg_r.gif'/>" alt="<spring:message code="button.home" />" style="margin-left:6px;" />
				</span>
			</div>
			<div id="title2">
				<ul>
					<li><img src="<c:url value='/images/egovframework/rte/title_dot.gif'/>" alt="" /> <spring:message code="emp.detail" /></li>
				</ul>
			</div>
			<div id="table">
				<table width="100%" border="1" cellpadding="0" cellspacing="0" style="border-top:#C2D0DB 2px solid; border-left:#ffffff 1px solid; border-right:#ffffff 1px solid; border-bottom:#C2D0DB 1px solid; border-collapse: collapse;" summary="사원정보를 확인할 수 있다.">
					<caption>사원정보 조회</caption>
					<colgroup>
						<col width="80">
						<col width="">
					</colgroup>
					<tr>
						<td class="tbtd_caption"><spring:message code="emp.empNo" /></td>
						<td class="tbtd_content"><c:out value="${emp.empNo}" /></td>
					</tr>
					<tr>
						<td class="tbtd_caption"><spring:message code="emp.empNm" /></td>
						<td class="tbtd_content"><c:out value="${emp.empNm}" /></td>
					</tr>
					<tr>
						<td class="tbtd_caption"><spring:message code="emp.birthdate" /></td>
						<td class="tbtd_content"><c:out value="${emp.birthdate}" /></td>
					</tr>
					<tr>
						<td class="tbtd_caption"><spring:message code="emp.telephone" /></td>
						<td class="tbtd_content"><c:out value="${emp.telephone}" /></td>
					</tr>
					<tr>
						<td class="tbtd_caption"><spring:message code="emp.address" /></td>
						<td class="tbtd_content"><c:out value="${emp.address}" /></td>
					</tr>
				</table>
			</div>
			<div id="sysbtn">
				<ul>
					<!-- 수정 버튼 -->
					<li>
						<span class="btn_blue_l" title="<spring:message code="button.update" />">
							<a href="#link" onClick="javascript:modifyEmployee(); return false;"><spring:message code="button.update" /></a>
							<img src="<c:url value='/images/egovframework/rte/btn_bg_r.gif'/>" alt="<spring:message code="button.update" />" style="margin-left:6px;" />
						</span>
					</li>
					<!-- 목록 버튼 -->
					<li>
						<span class="btn_blue_l" title="<spring:message code="button.list" />">
							<a href="#link" onClick="javascript:goToList(); return false;"><spring:message code="button.list" /></a>
							<img src="<c:url value='/images/egovframework/rte/btn_bg_r.gif'/>" alt="<spring:message code="button.list" />" style="margin-left:6px;" />
						</span>
					</li>
					<!--  삭제 버튼 -->
					<li>
						<span class="btn_blue_l" title="<spring:message code="button.delete" />">
							<a href="#link" onClick="javascript:deleteEmployee(); return false;"><spring:message code="button.delete" /></a>
							<img src="<c:url value='/images/egovframework/rte/btn_bg_r.gif'/>" alt="<spring:message code="button.delete" />" style="margin-left:6px;" />
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