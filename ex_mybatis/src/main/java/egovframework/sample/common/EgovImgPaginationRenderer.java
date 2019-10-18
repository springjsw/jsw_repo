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
package egovframework.sample.common;

import javax.servlet.ServletContext;

import org.springframework.web.context.ServletContextAware;

import egovframework.rte.ptl.mvc.tags.ui.pagination.AbstractPaginationRenderer;

/**
 * PaginationRendering을 위한 클래스
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
public class EgovImgPaginationRenderer extends AbstractPaginationRenderer implements ServletContextAware {
	private ServletContext servletContext;
	
	public EgovImgPaginationRenderer() {
	}
	
	public void initVariables() {
		String contextPath = servletContext.getContextPath();
		String webDir = contextPath + "/images/egovframework/cmmn/";

		firstPageLabel = "<a href=\"?pageIndex={1}\" onclick=\"{0}({1}); return false;\">" + "<image src='" + webDir + "btn_page_pre10.gif' border=0/></a>&#160;";
		previousPageLabel = "<a href=\"?pageIndex={1}\" onclick=\"{0}({1}); return false;\">" + "<image src='"+ webDir + "btn_page_pre1.gif' border=0/></a>&#160;";
		currentPageLabel = "<strong>{0}</strong>&#160;";
		otherPageLabel = "<a href=\"?pageIndex={1}\" onclick=\"{0}({1}); return false;\">{2}</a>&#160;";
		nextPageLabel = "<a href=\"?pageIndex={1}\" onclick=\"{0}({1}); return false;\">" + "<image src='" + webDir + "btn_page_next1.gif' border=0/></a>&#160;";
		lastPageLabel = "<a href=\"?pageIndex={1}\" onclick=\"{0}({1}); return false;\">" + "<image src='" + webDir + "btn_page_next10.gif' border=0/></a>&#160;";
	}

	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
		initVariables();
	}
}
