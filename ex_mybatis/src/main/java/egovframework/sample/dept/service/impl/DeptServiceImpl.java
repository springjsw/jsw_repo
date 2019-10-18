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
package egovframework.sample.dept.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.sample.dept.domain.DeptVO;
import egovframework.sample.dept.mapper.DeptMapper;
import egovframework.sample.dept.service.DeptService;

/**
 * 부서정보 CRUD 요청을 처리하는 비즈니스 클래스
 * 
 * @author  표준프레임워크센터
 * @since 2014.01.24
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *   
 *          수정일          수정자           수정내용
 *  ----------------    ------------    ---------------------------
 *   2014.01.24        표준프레임워크센터          최초 생성
 * 
 * </pre>
 */
@Service("deptService")
public class DeptServiceImpl implements DeptService {

	@Resource(name = "deptMapper")
	private DeptMapper deptMapper;

	@Resource(name = "egovIdGnrServiceDept")
	private EgovIdGnrService egovIdGnrService;

	/**
	 * 부서목록조회 요청을 처리하기 위해 데이터처리를 요청한다.
	 * 
	 * @param deptVO
	 * @return List
	 * @throws Exception
	 */
	public List<DeptVO> retrieveDeptList(DeptVO deptVO) throws Exception {
		return deptMapper.retrieveDeptList(deptVO);
	}

	/**
	 * 부서상세조회 요청을 처리하기 위해 데이터처리를 요청한다.
	 * 
	 * @param deptVO
	 * @return List
	 * @throws Exception
	 */
	public DeptVO retrieveDept(DeptVO deptVO) throws Exception {
		return deptMapper.retrieveDept(deptVO);
	}

	/**
	 * 부서정보수정 요청을 처리하기 위해 데이터처리를 요청한다.
	 * 
	 * @param deptVO
	 * @return List
	 * @throws Exception
	 */
	public void updateDept(DeptVO deptVO) throws Exception {
		deptMapper.updateDept(deptVO);
	}

	/**
	 * 부서정보입력 요청을 처리하기 위해 데이터처리를 요청한다.
	 * 
	 * @param deptVO
	 * @return List
	 * @throws Exception
	 */
	public void insertDept(DeptVO deptVO) throws Exception {

		// 부서번호(deptNo) 자동생성
		String deptNo = egovIdGnrService.getNextStringId();
		deptVO.setDeptNo(deptNo);
		deptMapper.insertDept(deptVO);
	}

	/**
	 * 부서정보삭제 요청을 처리하기 위해 데이터처리를 요청한다.
	 * 
	 * @param deptVO
	 * @return List
	 * @throws Exception
	 */
	public void deleteDept(DeptVO deptVO) throws Exception {
		deptMapper.deleteDept(deptVO);
	}

	/**
	 * 총 레코드 수 조회 요청을 처리하기 위해 데이터처리를 요청한다.
	 * 
	 * @param deptVO
	 * @return int
	 * @throws Exception
	 */
	public int retrieveDeptListTotCnt(DeptVO deptVO) throws Exception {
		return deptMapper.retrieveDeptListTotCnt(deptVO);
	}
}
