package com.thesis.aop.tests;

import static org.junit.Assert.*;

import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;
import org.junit.Test;

import com.thesis.aop.util.StopWatch;
import com.thesis.aop.util.ThesisUtil;

public class ThesisUtilTests {

	public String xssTest = "abc123";
	public String sqlTest = "SELECT field1, field2, field3 FROM Users WHERE Id='1' AND LENGTH(username)=N OR 2.3 > 12";
	final Logger logger;
	StopWatch t;

	public ThesisUtilTests() {
		PropertyConfigurator.configure("log4j.properties");
		logger = Logger.getLogger("testLogger");
		t = new StopWatch();
	}

	@Test
	public void testDoXSSFixStringString() {
		t.start();
		try {
			String result = ThesisUtil.doXSSFix(xssTest, "[a-z]+");
			logger.info("ThesisUtil Success: result is - " + result);
		} catch (Exception e) {
			logger.info("ThesisUtil FAIL - testDoXSSFixStringString");
			logger.info("Exception Stack: ", e);
			fail("testDoXSSFixStringString FAIL");
		} finally {
			t.stop();
		}
		logger.info("Test took: " + t.getElapsedTime() + " ms");
		logger.info("testDoXSSFixStringString Test Finished");
		logger.info("-----------------------------------------------------------------------");
	}

	@Test
	public void testDoXSSFixByteArrayString() {
		t.start();
		try {
			byte[] result = ThesisUtil.doXSSFix(xssTest.getBytes(), "[a-z]+");
			logger.info("ThesisUtil Success: result is - " + new String(result));
		} catch (Exception e) {
			logger.info("ThesisUtil FAIL - testDoXSSFixByteArrayString");
			logger.info("Exception Stack: ", e);
			fail("testDoXSSFixByteArrayString FAIL");
		} finally {
			t.stop();
		}
		logger.info("Test took: " + t.getElapsedTime() + " ms");
		logger.info("testDoXSSFixByteArrayString Test Finished");
		logger.info("-----------------------------------------------------------------------");
	}

	@Test
	public void testDoSQLInjectionFix() {
		t.start();
		try {
			String result = ThesisUtil.doSQLInjectionFix(logger, sqlTest,
					"SQL-ENCODE-MYSQL");
			logger.info("ThesisUtil Success: result is - " + result);
		} catch (Exception e) {
			logger.info("ThesisUtil FAIL - testDoSQLInjectionFix");
			logger.info("Exception Stack: ", e);
			fail("testDoSQLInjectionFix FAIL");
		} finally {
			t.stop();
		}
		logger.info("Test took: " + t.getElapsedTime() + " ms");
		logger.info("testDoSQLInjectionFix Test Finished");
		logger.info("-----------------------------------------------------------------------");
	}

}
