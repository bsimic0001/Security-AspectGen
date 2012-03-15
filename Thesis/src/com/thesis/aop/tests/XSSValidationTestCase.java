package com.thesis.aop.tests;

import static org.junit.Assert.*;

import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;
import org.junit.Test;
import org.owasp.esapi.errors.IntrusionException;
import org.owasp.esapi.errors.ValidationException;

import com.sun.net.httpserver.Authenticator.Success;
import com.thesis.aop.esapi.XSSValidation;

public class XSSValidationTestCase {

	final Logger logger;
	
	public XSSValidationTestCase() {
		PropertyConfigurator.configure("log4j.properties");
		logger = Logger.getLogger("testLogger");
	}
	
	@Test
	public void testEscapeCustomString() {
		String returnString = "";
		try {
			returnString = XSSValidation.escapeCustomString("abc123def456ghij-", "[a-z]+", 300);
		} catch (IntrusionException e) {
			// TODO Auto-generated catch block
			logger.info("XSS Test FAIL - EscapeCustomString " + returnString);
			logger.info("XSS Test FAIL - ", e);
			fail("IntrusionException");		
		}
		catch (Exception e){
			logger.info("XSS Test FAIL - EscapeCustomString " + returnString);
			logger.info("XSS Test FAIL - ", e);
			fail("Exception");		
		}
		logger.info("XSS Test Successful - EscapeCustomString " + returnString);
	}

	@Test
	public void testEscapeJavaScript() {
		fail("Not yet implemented");
	}

	@Test
	public void testEscapeCSS() {
		fail("Not yet implemented");
	}

	@Test
	public void testEscapeHTML() {
		fail("Not yet implemented");
	}

	@Test
	public void testEscapeHTMLAttribute() {
		fail("Not yet implemented");
	}

	@Test
	public void testEscapeURL() {
		fail("Not yet implemented");
	}

	@Test
	public void testValidateCreditCard() {
		try{
			logger.info("Credit Card Validation Result: " + 
				XSSValidation.validateCreditCard("4111111111111111"));
		}
		catch(Exception e){
			logger.info("CC VALIDATION FAILED");
			fail("CREDIT CARD VALIDATION FAIL");
		}
		
		
	}

}
