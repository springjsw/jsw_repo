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
<title>DataAccess | 부서조회목록 </title>
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/egov.css'/>">
<script type="text/javaScript" language="javascript">
	function searchDept() {
		document.deptForm.pageIndex.value='1';
		document.deptForm.action = "<c:url value='/dept/retrieveDeptList.do'/>";
		document.deptForm.submit();
	}
	function detailDept(deptNo) {
		document.deptForm.deptNo.value = deptNo;
		document.deptForm.action = "<c:url value='/dept/retrieveDept.do'/>";
		document.deptForm.submit();
	}
	function createDept() {
		document.deptForm.action = "<c:url value='/dept/retrieveDeptNewForm.do'/>";
		document.deptForm.deptNo.value = "";
		document.deptForm.submit();
	}
	function linkToPage(pageNo) {
		document.deptForm.pageIndex.value = pageNo;
		document.deptForm.action = "<c:url value='/dept/retrieveDeptList.do'/>";
		document.deptForm.submit();
	}
</script>
</head>

<body style="margin:0; padding:0;text-align: center; margin: 0 auto; display: inline; padding-top: 100px;">
	<div id="content_pop">
		<form:form name="deptForm" commandName="dept" method="post" onsubmit="searchDept()">
			<input type="hidden" name="deptNo" />
			<div id="home">
				<span class="btn_blue_l" title="<spring:message code="button.home" />">
					<a href="../index.jsp"><spring:message code="button.home" /></a>
					<img src="<c:url value='/images/egovframework/rte/btn_bg_r.gif'/>" alt="<spring:message code="button.home" />" style="margin-left:6px;" />
				</span>
			</div>
			<div id="title2">
				<ul>
					<li>
						<img src="<c:url value='/images/egovframework/rte/title_dot.gif'/>" alt="" /> <spring:message code="dept.list" />
						<span style="font-size: 13px; padding-left: 5px;">(<c:out value='${paginationInfo.totalRecordCount}' />건)</span>
					</li>
				</ul>
			</div>
			<div id="search">
				<ul>
					<li>
						<form:select path="searchCondition" cssClass="use" title="search">
							<form:option value="1" label="부서번호">부서번호</form:option>
							<form:option value="2" label="부서명">부서명</form:option>
						</form:select>
					</li> 
					<li><form:input path="searchKeyword" cssClass="txt" title="검색어"/></li>
					<!-- 검색 버튼 -->
					<li>
						<span class="btn_blue_l"	title="<spring:message code="button.search" />">
							<a href="javascript:searchDept();"><spring:message code="button.search" /></a>
							<img src="<c:url value='/images/egovframework/rte/btn_bg_r.gif'/>" style="margin-left: 6px;" alt="검색" />
						</span>
					</li>
				</ul>
			</div>
			<div id="table">
				<table width="100%" border="0" cellpadding="0" cellspacing="0" summary="부서 목록을 조회할 수 있다.">
					<caption>부서목록조회</caption>
					<colgroup>
						<col width="20">
						<col width="70">
						<col width="70">
						<col width="70">
						<col width="70">
					</colgroup>
					<thead>
						<tr align="center">
							<th><spring:message code="content.no" /></th>
							<th><spring:message code="dept.deptNo" /></th>
							<th><spring:message code="dept.deptNm" /></th>
							<th><spring:message code="dept.deptLoc" /></th>
							<th><spring:message code="dept.deptTel" /></th>
						</tr>
					</thead>
					<tbody align="center">
						<c:if test="${fn:length(resultList) == 0}">
							<tr>
								<td class="listtd" colspan="5"><spring:message code="info.nodata.msg" /></td>
							</tr>
	    				</c:if>
						<c:forEach var="dept" items="${resultList}" varStatus="status">
							<tr>
								<td class="listtd"><c:out value="${(paginationInfo.currentPageNo - 1) * paginationInfo.recordCountPerPage + status.count}" /></td>
								<td class="listtd"><a href="javascript:detailDept('${dept.deptNo}');"><c:out value="${dept.deptNo}" /></a></td>
								<td class="listtd"><c:out value="${dept.deptNm}" /></td>
								<td class="listtd"><c:out value="${dept.deptLoc}" /> </td>
								<td class="listtd"><c:out value="${dept.deptTel}" /></td>
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
						<a href="#link" onclick="javascript:createDept(); return false;"><spring:message	code="button.add" /></a>
						<img src="<c:url value='/images/egovframework/rte/btn_bg_r.gif'/>" style="margin-left: 8px;" alt="<spring:message code="button.add" />" />
					</span>
				</li>
			</ul>
		</div>
	</div>
</body>
</html>