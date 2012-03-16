package com.thesis.aop.tests;

import static org.junit.Assert.fail;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;
import org.junit.Test;

import com.thesis.aop.logic.beans.TestBean;
import com.thesis.aop.util.StopWatch;
import com.thesis.aop.util.ThesisUtil;

public class ThesisUtilTests {

	public String xssTest = "abc123";
	public String sqlTest = "SELECT field1, field2, field3 FROM Users WHERE Id='1' AND LENGTH(username)=N OR 2.3 > 12";
	public final Logger logger;
	StopWatch t;

	public ThesisUtilTests() {
		PropertyConfigurator.configure("log4j.properties");
		logger = Logger.getLogger("testLogger");
		t = new StopWatch();
	}

	@Test
	public void testDoXSSFixStringString() throws IOException {
		
		ArrayList<TestBean> tests = getTestData("XSSTests.data", ThesisUtil.xssFixOptions, 2);
		int testNumber = 0;
		HashMap<String, String>	testLengths = new HashMap<String, String>();
		
		for (Iterator iterator = tests.iterator(); iterator.hasNext();) {
			TestBean testBean = (TestBean) iterator.next();
		
			logger.info("STARTING XSS TEST #" + testNumber);
			logger.info("Input: " + testBean.getInput());
			logger.info("FIX: " + testBean.getFix());
			logger.info("");
			
			t.start();
			try {
				String result = ThesisUtil.doXSSFix(testBean.getInput(), testBean.getFix());
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
			
			if(testLengths.containsKey(testBean.getFix())){
				testLengths.put(testBean.getFix(), testLengths.get(testBean.getFix()) + "," + t.getElapsedTime());
			}
			else{
				testLengths.put(testBean.getFix(), t.getElapsedTime() + "");
			}
			logger.info("-----------------------------------------------------------------------");
			testNumber++;
		}
		logger.info("XSS Test Results:");
		for(Map.Entry<String, String> entry : testLengths.entrySet()){
			String key = entry.getKey();
			String value = (String) entry.getValue();
			logger.info(key + ": " + value);
		}
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
	public void testDoSQLInjectionFix() throws IOException {

		ArrayList<TestBean> tests = getTestData("SQLITests.data", ThesisUtil.sqlInjectionFixOptions, 0);
		int testNumber = 0;
		String mysqlLengths = "";
		String oracleLengths = "";
		for(int i = 0; i < 50; i++){
		for (Iterator iterator = tests.iterator(); iterator.hasNext();) {
			TestBean testBean = (TestBean) iterator.next();

			logger.info("STARTING SQL TEST #" + testNumber);
			logger.info("Input: " + testBean.getInput());
			logger.info("FIX: " + testBean.getFix());
			logger.info("");

			t.start();
			try {
				String result = ThesisUtil.doSQLInjectionFix(logger,
						testBean.getInput(), testBean.getFix());
				logger.info("ThesisUtil Success: result is - " + result);
			} catch (Exception e) {
				logger.info("ThesisUtil FAIL - testDoSQLInjectionFix");
				logger.info("Exception Info: " + e.getCause());
				fail("testDoSQLInjectionFix FAIL");
			} finally {
				t.stop();
			}
			logger.info("Test took: " + t.getElapsedTime() + " ms");
			logger.info("testDoSQLInjectionFix Test Finished");
			if(testBean.getFix().equals(ThesisUtil.sqlInjectionFixOptions[0]))
				mysqlLengths = mysqlLengths + t.getElapsedTime() + ",";
			else{
				oracleLengths = oracleLengths + t.getElapsedTime() + ",";
			}
			
			logger.info("-----------------------------------------------------------------------");
			testNumber++;
		}
		}
		logger.info("MySQL: " + mysqlLengths);
		logger.info("Oracle: " + oracleLengths);
	}
	
	public ArrayList<TestBean> getTestData(String fileName, String[] fixOptions, int lessValue) throws IOException {

		ArrayList<TestBean> tests = new ArrayList<TestBean>();

		InputStream testStream = this.getClass().getResourceAsStream(
				"/tests/" + fileName);
		InputStreamReader is = new InputStreamReader(testStream);
		BufferedReader br = new BufferedReader(is);
		String read = br.readLine();

		while (read != null) {
			for (int i = 0; i < fixOptions.length - lessValue; i++) {
				tests.add(new TestBean(read, fixOptions[i]));
			}
			read = br.readLine();
		}

		return tests;

	}

}
