package egovframework.sample.common;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import egovframework.rte.fdl.cmmn.exception.handler.ExceptionHandler;

public class JdbcLoggingExcepHndlr implements ExceptionHandler {

    Logger logger = LoggerFactory.getLogger(JdbcLoggingExcepHndlr.class.getName());
    
    public void occur(Exception ex, String packageName) {
    	logger.error(ex.getMessage());
    }

}
