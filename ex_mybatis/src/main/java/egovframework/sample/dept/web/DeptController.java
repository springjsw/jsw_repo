/*
 * Copyright 2011 MOPAS(Ministry of Public Administration and Security).
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package egovframework.sample.dept.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import egovframework.sample.dept.domain.DeptVO;
import egovframework.sample.dept.service.DeptService;
/**
 *  부서정보 CRUD 요청을 처리하는 Controller 클래스
 * 
 * @author  표준프레임워크센터
 * @since 2014.01.24
 * @version 1.0
 * @see 
 * <pre>
 *  == 개정이력(Modification Information) ==
 *   
 *          수정일          수정자           수정내용
 *  ----------------    ------------    ---------------------------
 *   2014.01.24        표준프레임워크센터          최초 생성
 * 
 * </pre>
 */
@Controller
public class DeptController {

	@Resource(name = "deptService")
	private DeptService deptService;

	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	
	/** 
	 *부서목록을 조회한다.
	 * @param deptVO 검색조건
	 * @param model
	 * @return "dept/list"
	 * @throws Exception
	 */
	@RequestMapping(value = "/dept/retrieveDeptList.do")
	public String retrieveDeptList(@ModelAttribute("dept") DeptVO deptVO, ModelMap model) throws Exception {
		
		 // currentPageNo : 현재 페이지 번호
		 // recordCountPerPage : 한 페이지당 게시되는 게시물 건 수 (=pageUnit)
		 // pageSize : 페이지 리스트에 게시되는 페이지 건수
		 // totalRecordCount : 전체 게시물 건 수
		// pageUnit과 pageSize는 context-properties.xml에서 설정
				
		deptVO.setPageUnit(propertiesService.getInt("pageUnit"));
		deptVO.setPageSize(propertiesService.getInt("pageSize"));
		
		PaginationInfo paginationInfo = new PaginationInfo();
		
		paginationInfo.setCurrentPageNo(deptVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(deptVO.getPageUnit());
		paginationInfo.setPageSize(deptVO.getPageSize());
		
		deptVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		deptVO.setLastIndex(paginationInfo.getLastRecordIndex());
		deptVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		int totCnt = deptService.retrieveDeptListTotCnt(deptVO);
		paginationInfo.setTotalRecordCount(totCnt);
	
		model.addAttribute("paginationInfo", paginationInfo);
		
		// 검색조건과 키워드로 부서목록조회
		List<DeptVO> resultDeptList = deptService.retrieveDeptList(deptVO);
		model.addAttribute("resultList", resultDeptList);
		return "dept/list";
	}

	/**
	 * 부서상세조회 화면으로 이동한다.
	 * @param deptNo 부서번호
	 * @return "dept/detail"
	 * @throws Exception
	 */
	@RequestMapping(value = "/dept/retrieveDept.do")
	public String retrieveDept(@RequestParam("deptNo") String deptNo, ModelMap model) throws Exception {

		// 부서번호로 부서정보 조회
		DeptVO deptVO = new DeptVO();
		deptVO.setDeptNo(deptNo);
		
		DeptVO resultDept = deptService.retrieveDept(deptVO);
		model.addAttribute("dept", resultDept);

		return "dept/detail";
	}

	/**
	 * 부서정보 등록 화면으로 이동한다.
	 * @param model
	 * @return "dept/form"
	 * @throws Exception
	 */
	@RequestMapping(value = "/dept/retrieveDeptNewForm.do")
	public String retrieveDeptNewForm(@ModelAttribute("dept") DeptVO deptVO, ModelMap model) throws Exception {
		return "dept/form";
	}

	/**
	 * 부서정보 등록하고 목록조회 화면으로 이동한다.
	 * @param deptVO 부서정보
	 * @param model
	 * @return "redirect:/dept/retrieveDeptList.do"
	 * @throws Exception
	 */
	@RequestMapping(value = "/dept/insertDept.do")
	public String insertDept(@ModelAttribute("dept") DeptVO deptVO, ModelMap model) throws Exception {
		
		deptService.insertDept(deptVO);
		return "redirect:/dept/retrieveDeptList.do";
	}
	
	/**
	 * 부서정보 수정 화면으로 이동한다.
	 * @param dept 부서정보(부서번호 deptNo)
	 * @param model
	 * @return "dept/form"
	 * @throws Exception
	 */
	@RequestMapping(value = "/dept/retrieveDeptForm.do")
	public String retrieveDeptForm(@ModelAttribute("dept") DeptVO deptVO, ModelMap model) throws Exception {

		// 부서번호로 부서정보 조회
		DeptVO resultDept = deptService.retrieveDept(deptVO);
		model.addAttribute("dept", resultDept);

		return "dept/form";
	}

	/** 
	 * 부서정보 수정하고 목록조회 화면으로 이동한다.
	 * @param deptVO 부서정보
	 * @param model
	 * @return "forward:/dept/retrieveDept.do"
	 * @throws Exception
	 */
	@RequestMapping(value = "/dept/updateDept.do")
	public String updateDept(@ModelAttribute("dept") DeptVO deptVO, ModelMap model) throws Exception {

		deptService.updateDept(deptVO);
		return "forward:/dept/retrieveDept.do";
	}

	/**
	 * 부서정보 삭제 후 목록조회 화면으로 이동한다.
	 * @param deptVO 부서정보
	 * @return "redirect:/dept/retrieveDeptList.do"
	 * @throws Exception
	 */
	@RequestMapping(value = "/dept/deleteDept.do")
	public String deleteDept(@ModelAttribute("dept") DeptVO deptVO, ModelMap model) throws Exception {
		
		deptService.deleteDept(deptVO);
		return "redirect:/dept/retrieveDeptList.do";
	}
}
