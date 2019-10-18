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
<c:set var="flag" value="${empty dept.deptNo ? '등록' : '수정'}"/>
<title>DataAccess | 부서정보<c:out value="${flag}"/> </title>
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/egov.css'/>">
<script type="text/javaScript" language="javascript">
	function saveDept() {
		
		frm = document.deptForm;

		if(frm.deptNm.value == ""){
			alert("이름을 입력하세요.");
			return;
		}
		if(frm.deptLoc.value == ""){
			alert("사무실 위치를 입력하세요.");
			return;
		}
		if(frm.deptTel.value == ""){
			alert("전화번호를 입력하세요.");
			return;
		}
		
	   	if("<c:out value="${flag}"/>" == "등록"){
	   		if(confirm("<spring:message code="msg.insert" />")){
	   			frm.action  = "<c:url value='/dept/insertDept.do'/>";
	   			frm.submit();		
	   		}
	   	}else{
	   		if(confirm("<spring:message code="msg.update" />")){
	   			frm.action  = "<c:url value='/dept/updateDept.do'/>";
	   			frm.submit();		
	   		}
	   	}
	}
	function goToList() {
		document.deptForm.action = "<c:url value='/dept/retrieveDeptList.do'/>";
		document.deptForm.submit();
	}
</script>
</head>

<body style="text-align: center; margin: 0 auto; display: inline; padding-top: 100px;">
	<div id="content_pop">
		<form:form name="deptForm" commandName="dept" method="post">
			 <div id="home">
				<span class="btn_blue_l" title="<spring:message code="button.home" />">
					<a href="../index.jsp"><spring:message code="button.home" /></a>
					<img src="<c:url value='/images/egovframework/rte/btn_bg_r.gif'/>" alt="<spring:message code="button.home" />" style="margin-left:6px;" />
				</span>
			</div>
			<div id="title2">
				<ul>
					<c:if test="${flag=='등록'}">
						<li><img src="<c:url value='/images/egovframework/rte/title_dot.gif'/>" alt="" /> <spring:message code="dept.create" /></li>
					</c:if>
					<c:if test="${flag=='수정'}">
						<li><img src="<c:url value='/images/egovframework/rte/title_dot.gif'/>" alt="" /> <spring:message code="dept.update" /></li>
					</c:if>
				</ul>
			</div>
			<div id="table">
				<table width="100%" border="1" cellpadding="0" cellspacing="0" style="border-top:#C2D0DB 2px solid; border-left:#ffffff 1px solid; border-right:#ffffff 1px solid; border-bottom:#C2D0DB 1px solid; border-collapse: collapse;" summary="부서정보를 등록하고 수정할 수 있다.">
					<caption>부서정보 등록 및 수정</caption>
					<colgroup>
						<col width="80">
						<col width="">
					</colgroup>
					<c:if test="${flag=='수정'}">
					<tr>
						<td class="tbtd_caption"><spring:message code="dept.deptNo" /></td>
						<td class="tbtd_content"><form:hidden path="deptNo" /><c:out value="${dept.deptNo}" /></td>
					</tr>
					</c:if>
					<tr>
						<td class="tbtd_caption"><spring:message code="dept.deptNm" /></td>
						<td class="tbtd_content"><form:input path="deptNm" /><form:errors path="deptNm" /></td>
					</tr>
					<tr>
						<td class="tbtd_caption"><spring:message code="dept.deptLoc" /></td>
						<td class="tbtd_content"><form:input path="deptLoc" /><form:errors path="deptLoc" /></td>
					</tr>
					<tr>
						<td class="tbtd_caption"><spring:message code="dept.deptTel" /></td>
						<td class="tbtd_content"><form:input path="deptTel" /><form:errors path="deptTel" /></td>
					</tr>
				</table>
			</div>
			<div id="sysbtn">
				<ul>
					<!-- 저장 버튼 -->
					<li>
						<span class="btn_blue_l" title="<spring:message code="button.save" />">
							<a href="#link" onClick="javascript:saveDept(); return false;"><spring:message code="button.save" /></a>
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
							<a href="#link" onClick="javascript:document.deptForm.reset(); return false;"><spring:message code="button.reset" /></a>
							<img src="<c:url value='/images/egovframework/rte/btn_bg_r.gif'/>" alt="<spring:message code="button.reset" />" style="margin-left:6px;" />
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