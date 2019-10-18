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
package egovframework.sample.dept.mapper;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.sample.dept.domain.DeptVO;

/**
 * 부서정보에 관한 데이터처리 매퍼 클래스
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
@Mapper("deptMapper")
public interface DeptMapper {

	/** 
	 * DB에서 부서목록을 조회한다.
	 * @param deptVO
	 * @return List
	 * @throws Exception
	 */
	public List<DeptVO> retrieveDeptList(DeptVO deptVO) throws Exception;

	/**
	 *  DB에서 부서정보를 상세조회한다.
	 * 
	 * @param deptVO
	 * @return DeptVO
	 * @throws Exception
	 */
	public DeptVO retrieveDept(DeptVO deptVO) throws Exception;

	/**
	 *  DB에서 부서정보를 수정한다.
	 * 
	 * @param deptVO
	 * @return void
	 * @throws Exception
	 */
	public void updateDept(DeptVO deptVO) throws Exception;

	/**
	 * DB에 부서정보를 입력한다.
	 * 
	 * @param deptVO
	 * @return void
	 * @throws Exception
	 */
	public void insertDept(DeptVO deptVO) throws Exception;

	/**
	 *  DB에서 부서정보를 삭제한다.
	 * 
	 * @param deptVO
	 * @return void
	 * @throws Exception
	 */
	public void deleteDept(DeptVO deptVO) throws Exception;

	/**
	 * 부서조회 시 총 레코드 수를 조회한다.
	 * 
	 * @param deptVO
	 * @return int
	 * @throws Exception
	 */
	public int retrieveDeptListTotCnt(DeptVO deptVO) throws Exception;
}
