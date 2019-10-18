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
<title>DataAccess | 부서상세조회</title>
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/egov.css'/>">
<script type="text/javaScript" language="javascript">
	function modifyDept() {
		document.deptForm.action = "<c:url value='/dept/retrieveDeptForm.do'/>";
		document.deptForm.submit();
	}
	function goToList() {
		document.deptForm.action = "<c:url value='/dept/retrieveDeptList.do'/>";
		document.deptForm.submit();
	}
	function deleteDept() {
		if(confirm("<spring:message code="msg.del" />")){
			document.deptForm.action = "<c:url value='/dept/deleteDept.do'/>";
			document.deptForm.submit();
		}
	}
</script>
</head>

<body style="text-align: center; margin: 0 auto; display: inline; padding-top: 100px;">
	<div id="content_pop">
		<form:form name="deptForm" commandName="dept" method="post">
			<form:hidden path="deptNo" />
			<div id="home">
				<span class="btn_blue_l" title="<spring:message code="button.home" />">
					<a href="../index.jsp"><spring:message code="button.home" /></a>
					<img src="<c:url value='/images/egovframework/rte/btn_bg_r.gif'/>" alt="<spring:message code="button.home" />" style="margin-left:6px;" />
				</span>
			</div>
			<div id="title2">
				<ul>
					<li><img src="<c:url value='/images/egovframework/rte/title_dot.gif'/>" alt="" /> <spring:message code="dept.detail" /></li>
				</ul>
			</div>
			<div id="table">
				<table width="100%" border="1" cellpadding="0" cellspacing="0" style="border-top:#C2D0DB 2px solid; border-left:#ffffff 1px solid; border-right:#ffffff 1px solid; border-bottom:#C2D0DB 1px solid; border-collapse: collapse;" summary="부서정보를 확인할 수 있다.">
					<caption>부서정보 조회</caption>
					<colgroup>
						<col width="80">
						<col width="">
					</colgroup>
					<tr>
						<td class="tbtd_caption"><spring:message code="dept.deptNo" /></td>
						<td class="tbtd_content"><c:out value="${dept.deptNo}" /></td>
					</tr>
					<tr>
						<td class="tbtd_caption"><spring:message code="dept.deptNm" /></td>
						<td class="tbtd_content"><c:out value="${dept.deptNm}" /></td>
					</tr>
					<tr>
						<td class="tbtd_caption"><spring:message code="dept.deptLoc" /></td>
						<td class="tbtd_content"><c:out value="${dept.deptLoc}" /></td>
					</tr>
					<tr>
						<td class="tbtd_caption"><spring:message code="dept.deptTel" /></td>
						<td class="tbtd_content"><c:out value="${dept.deptTel}" /></td>
					</tr>
				</table>
			</div>
			<div id="sysbtn">
				<ul>
					<!-- 수정 버튼 -->
					<li>
						<span class="btn_blue_l" title="<spring:message code="button.update" />">
							<a href="#link" onClick="javascript:modifyDept(); return false;"><spring:message code="button.update" /></a>
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
							<a href="#link" onClick="javascript:deleteDept(); return false;"><spring:message code="button.delete" /></a>
							<img src="<c:url value='/images/egovframework/rte/btn_bg_r.gif'/>" alt="<spring:message code="button.delete" />" style="margin-left:6px;" />
						</span>
					</li>	
				</ul>
			</div>
			<!-- 검색조건 유지 -->
			<input type="hidden" name="searchCondition" value="<c:out value='${dept.searchCondition}'/>"/>
			<input type="hidden" name="searchKeyword" value="<c:out value='${dept.searchKeyword}'/>"/>
			<input type="hidden" name="pageIndex" value="<c:out value='${dept.pageIndex}'/>"/>
		</form:form>
	</div>
</body>
</html>