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
package egovframework.sample.emp.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.sample.emp.service.EmpService;
import egovframework.sample.emp.service.EmpVO;

/**
 * 사원정보 CRUD 요청을 처리하는 비즈니스 클래스
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
@Service("empService")
public class EmpServiceImpl implements EmpService {

	@Resource(name = "empMapper")
	private EmpMapper empMapper;

	@Resource(name = "egovIdGnrServiceEmp")
	private EgovIdGnrService egovIdGnrService;

	/**
	 * 사원목록조회 요청을 처리하기 위해 데이터처리를 요청한다.
	 * 
	 * @param empVO
	 * @return List
	 * @throws Exception
	 */
	public List<EmpVO> retrieveEmpList(EmpVO empVO) throws Exception {
		return empMapper.retrieveEmpList(empVO);
	}

	/**
	 * 사원상세조회 요청을 처리하기 위해 데이터처리를 요청한다.
	 * 
	 * @param empVO
	 * @return List
	 * @throws Exception
	 */
	public EmpVO retrieveEmp(EmpVO empVO) throws Exception {
		return empMapper.retrieveEmp(empVO);
	}

	/**
	 * 사원정보수정 요청을 처리하기 위해 데이터처리를 요청한다.
	 * 
	 * @param empVO
	 * @return List
	 * @throws Exception
	 */
	public void updateEmp(EmpVO empVO) throws Exception {
		empMapper.updateEmp(empVO);
	}

	/**
	 * 사원정보입력 요청을 처리하기 위해 데이터처리를 요청한다.
	 * 
	 * @param empVO
	 * @return List
	 * @throws Exception
	 */
	public void insertEmp(EmpVO empVO) throws Exception {

		// 사원번호(empNo) 자동생성
		String empNo = egovIdGnrService.getNextStringId();
		empVO.setEmpNo(empNo);
		empMapper.insertEmp(empVO);
	}

	/**
	 * 사원정보삭제 요청을 처리하기 위해 데이터처리를 요청한다.
	 * 
	 * @param empVO
	 * @return List
	 * @throws Exception
	 */
	public void deleteEmp(EmpVO empVO) throws Exception {
		empMapper.deleteEmp(empVO);
	}

	/**
	 * 총 레코드 수 조회 요청을 처리하기 위해 데이터처리를 요청한다.
	 * 
	 * @param empVO
	 * @return int
	 * @throws Exception
	 */
	public int retrieveEmpListTotCnt(EmpVO empVO) throws Exception {
		return empMapper.retrieveEmpListTotCnt(empVO);
	}
}
