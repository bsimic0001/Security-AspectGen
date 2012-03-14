package com.thesis.aop.tests;

import static org.junit.Assert.*;

import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;
import org.junit.Test;

import com.thesis.aop.esapi.SQLInjectionValidation;
import com.thesis.aop.util.StopWatch;

public class SQLInjectionValidationTestCase {

	final Logger logger;
	
	
	//String query = "SELECT field1, field2, field3 FROM Users WHERE Id='1' AND LENGTH(username)=N AND '1' = '1'";
	//String query = "SELECT field1, field2, field3 FROM Users WHERE Id='1' AND LENGTH(username)=N OR 1=1";
	String query = "SELECT field1, field2, field3 FROM Users WHERE Id='1' AND LENGTH(username)=N OR 2.3 > 2";

	//String query = "SELECT field1, field2, field3 FROM Users WHERE Id='1' AND ASCII(SUBSTRING(username,1,1))=97 AND '1'='1'";
	//String query = "SELECT * FROM Users WHERE ((Username='1' or '1' = '1'))/*') AND (Password=MD5('$password')))";
	
	public SQLInjectionValidationTestCase() {
		PropertyConfigurator.configure("log4j.properties");
		logger = Logger.getLogger("testLogger");
	}

	@Test
	public void testEscapeMySQL() throws Exception {
		StopWatch t = new StopWatch();
		logger.info("Running MySQL Test");
		t.start();
		try {

			String result = SQLInjectionValidation.escapeMySQL(query, logger);

			if (result.contains("VALIDATION_FAILURE")) {
				logger.info(result);
				//fail(result);
			} else
				logger.info("SUCCESS: " + result);

		} catch (Exception e) {
			e.printStackTrace();
			//logger.info("Exception in MySQL Test", e);
			logger.info("Exception in MySQL Test - FAILURE");
			fail("MySQL Test Failed - Exception Thrown");
		} finally {
			t.stop();
		}

		logger.info("Test took: " + t.getElapsedTime() + " ms");
		logger.info("MySQL Test Finished");
		logger.info("-----------------------------------------------------------------------");
	}

	@Test
	public void testEscapeOracle() {
		StopWatch t = new StopWatch();
		logger.info("Running Oracle Test");
		t.start();
		try {

			String result = SQLInjectionValidation.escapeOracle(query, logger);

			if (result.contains("VALIDATION_FAILURE")) {
				logger.info(result);
				//fail(result);
			} else
				logger.info("SUCCESS: " + result);

		} catch (Exception e) {
			e.printStackTrace();
			//logger.info("Exception in Oracle Test", e);
			logger.info("Exception in Oracle Test - FAILURE");
			fail("Oracle Test Failed - Exception Thrown");
		} finally {
			t.stop();
		}

		logger.info("Test took: " + t.getElapsedTime() + " ms");
		logger.info("Oracle Test Finished");
		logger.info("-----------------------------------------------------------------------");
	}

}
