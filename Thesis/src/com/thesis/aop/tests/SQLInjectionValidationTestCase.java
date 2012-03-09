package com.thesis.aop.tests;

import static org.junit.Assert.*;

import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;
import org.junit.Test;

import com.thesis.aop.esapi.SQLInjectionValidation;
import com.thesis.aop.util.StopWatch;

public class SQLInjectionValidationTestCase {

	final Logger logger;

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

			String validated = SQLInjectionValidation
					.escapeMySQL("SELECT * FROM Users WHERE Username='1' OR '1' = '1' AND Password='1' OR '1' = '1'");
			logger.info("SUCCESS: " + validated);

		} catch (Exception e) {
			e.printStackTrace();
			logger.info("Exception in MySQL Test", e);
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

			String validated = SQLInjectionValidation
					.escapeMySQL("SELECT * FROM Users WHERE Username='1' OR '1' = '1' AND Password='1' OR '1' = '1'");
			logger.info("SUCCESS: " + validated);

		} catch (Exception e) {
			e.printStackTrace();
			logger.info("Exception in Oracle Test", e);
			fail("Oracle Test Failed - Exception Thrown");
		} finally {
			t.stop();
		}

		logger.info("Test took: " + t.getElapsedTime() + " ms");
		logger.info("Oracle Test Finished");
		logger.info("-----------------------------------------------------------------------");
	}

}
