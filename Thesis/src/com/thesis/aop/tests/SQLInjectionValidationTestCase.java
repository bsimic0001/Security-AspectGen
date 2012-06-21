/*******************************************************************************
 * Copyright (c) 2012 Bojan Simic.
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the GNU Lesser Public License v2.1
 * which accompanies this distribution, and is available at
 * http://www.gnu.org/licenses/old-licenses/gpl-2.0.html
 * 
 * Contributors:
 *     Bojan Simic - initial API and implementation
 ******************************************************************************/
package com.thesis.aop.tests;

import static org.junit.Assert.*;

import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;
import org.junit.Test;

import com.thesis.aop.esapi.SQLInjectionValidation;
import com.thesis.aop.util.StopWatch;

public class SQLInjectionValidationTestCase {

	final Logger logger;

	String query = "SELECT * FROM salaries WHERE userid='whatever'; INSERT INTO salaries VALUES ('rlupin',150000);'";

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
			} else if (result.contains("PARSE_ERROR")) {
				logger.info(result);
			} else
				logger.info("SUCCESS: " + result);

		} catch (Exception e) {
			e.printStackTrace();
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
			} else if (result.contains("PARSE_ERROR")) {
				logger.info(result);
			} else
				logger.info("SUCCESS: " + result);

		} catch (Exception e) {
			e.printStackTrace();
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
