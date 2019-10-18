<%@ page language="java" pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/1999/REC-html401-19991224/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="content-language" content="ko">
<title>DataAccess | 사원조회목록 </title>
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/egov.css'/>">
<script type="text/javaScript" language="javascript">
	function searchEmployee() {
		document.empForm.pageIndex.value='1';
		document.empForm.action = "<c:url value='/emp/retrieveEmployeeList.do'/>";
		document.empForm.submit();
	}
	function detailEmployee(empNo) {
		document.empForm.empNo.value = empNo;
		document.empForm.action = "<c:url value='/emp/retrieveEmployee.do'/>";
		document.empForm.submit();
	}
	function createEmployee() {
		document.empForm.action = "<c:url value='/emp/retrieveEmployeeNewForm.do'/>";
		document.empForm.empNo.value = "";
		document.empForm.submit();
	}
	function linkToPage(pageNo) {
		document.empForm.pageIndex.value = pageNo;
		document.empForm.action = "<c:url value='/emp/retrieveEmployeeList.do'/>";
		document.empForm.submit();
	}
</script>
</head>

<body style="text-align: center; margin: 0 auto; display: inline; padding-top: 100px;">
	<div id="content_pop">
		<form:form name="empForm" commandName="emp" method="post"	onsubmit="searchEmployee()">
			<input type="hidden" name="empNo" />
			<div id="home">
				<span class="btn_blue_l" title="<spring:message code="button.home" />">
					<a href="../index.jsp"><spring:message code="button.home" /></a>
					<img src="<c:url value='/images/egovframework/rte/btn_bg_r.gif'/>" alt="<spring:message code="button.home" />" style="margin-left:6px;" />
				</span>
			</div>
			<div id="title2">
				<ul>
					<li>
						<img src="<c:url value='/images/egovframework/rte/title_dot.gif'/>" alt="" /> <spring:message code="emp.list" />
						<span style="font-size: 13px; padding-left: 5px;">(<c:out value='${paginationInfo.totalRecordCount}' />건)</span>
					</li>
				</ul>
			</div>
			<div id="search">
				<ul>
					<li>
						<form:select path="searchCondition" cssClass="use" title="search">
							<form:option value="1" label="사원번호">사원번호</form:option>
							<form:option value="2" label="사원이름">사원이름</form:option>
						</form:select>
					</li> 
					<li><form:input path="searchKeyword" cssClass="txt" title="검색어"/></li>
					<!-- 검색 버튼 -->
					<li>
						<span class="btn_blue_l"	title="<spring:message code="button.search" />">
							<a href="javascript:searchEmployee();"><spring:message code="button.search" /></a>
							<img src="<c:url value='/images/egovframework/rte/btn_bg_r.gif'/>" style="margin-left: 6px;" alt="검색" />
						</span>
					</li>
				</ul>
			</div>
			<div id="table">
				<table width="100%" border="0" cellpadding="0" cellspacing="0" summary="사원 목록을 조회할 수 있다.">
					<caption>사원목록조회</caption>
					<colgroup>
						<col width="20">
						<col width="70">
						<col width="50">
						<col width="70">
						<col width="70">
						<col width="70">
					</colgroup>
					<thead>
						<tr align="center">
							<th><spring:message code="content.no" /></th>
							<th><spring:message code="emp.empNo" /></th>
							<th><spring:message code="emp.empNm" /></th>
							<th><spring:message code="emp.birthdate" /></th>
							<th><spring:message code="emp.telephone" /></th>
							<th><spring:message code="emp.address" /></th>
						</tr>
					</thead>
					<tbody align="center">
						<c:if test="${fn:length(resultList) == 0}">
							<tr>
								<td class="listtd" colspan="6"><spring:message code="info.nodata.msg" /></td>
							</tr>
	    				</c:if>
						<c:forEach var="emp" items="${resultList}" varStatus="status">
							<tr>
								<td class="listtd"><c:out value="${(paginationInfo.currentPageNo - 1) * paginationInfo.recordCountPerPage + status.count}" /></td>
								<td class="listtd"><a href="javascript:detailEmployee('${emp.empNo}');"><c:out value="${emp.empNo}" /></a></td>
								<td class="listtd"><c:out value="${emp.empNm}" /></td>
								<td class="listtd"><c:out value="${emp.birthdate}" /> </td>
								<td class="listtd"><c:out value="${emp.telephone}" /></td>
								<td class="listtd"><c:out value="${emp.address}" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div id="paging">
				<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="linkToPage" />
				<form:hidden path="pageIndex" />
			</div>
		</form:form>
		<div id="sysbtn">
			<ul>
				<!-- 등록 버튼 -->
				<li>
					<span class="btn_blue_l" title="<spring:message code="button.add" />">
						<a href="#link" onclick="javascript:createEmployee(); return false;"><spring:message	code="button.add" /></a>
						<img src="<c:url value='/images/egovframework/rte/btn_bg_r.gif'/>" style="margin-left: 8px;" alt="<spring:message code="button.add" />" />
					</span>
				</li>
			</ul>
		</div>
	</div>
</body>
</html>