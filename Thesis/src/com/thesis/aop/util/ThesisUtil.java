package com.thesis.aop.util;

import org.owasp.esapi.errors.EncodingException;
import org.owasp.esapi.errors.IntrusionException;
import org.owasp.esapi.errors.ValidationException;

import com.thesis.aop.esapi.XSSValidation;

public class ThesisUtil {

	public static String[] xssFixOptions = {"JAVASCRIPT-ENCODING", 
			"CSS-ENCODING", 
			"HTML-ENCODING", 
			"HTML-ATTRIBUTE-ENCODING", 
			"URL-ENCODING", 
			"CREDIT-CARD-VALIDATION", 
			"ALPHA-NUMERIC-WHITELIST", 
			"ALPHA-WHITELIST", 
			"EMAIL-WHITELIST", 
			"ZIP-CODE-WHITELIST", 
			"IP-ADDRESS-WHITELIST",
			"SSN-WHITELIST",
			"DO-NOTHING"};
	
	public static String doXSSFix(String s, String solution) throws ValidationException, IntrusionException{
		String result = getSolution(s, solution);
		return result;
	}
	
	public static byte[] doXSSFix(byte[] s, String solution) throws ValidationException, IntrusionException{
		String result = getSolution(s.toString(), solution);
		return result.getBytes();
	}
	
	public static String getSolution(String s, String solution) throws ValidationException, IntrusionException{
		String result = s;
		
		if(solution.equals(xssFixOptions[0])){
			result = XSSValidation.escapeJavaScript(s);
		}
		else if(solution.equals(xssFixOptions[1])){
			result = XSSValidation.escapeCSS(s);
		}
		else if(solution.equals(xssFixOptions[2])){
			result = XSSValidation.escapeHTML(s);
		}
		else if(solution.equals(xssFixOptions[3])){
			result = XSSValidation.escapeHTMLAttribute(s);
		}		
		else if(solution.equals(xssFixOptions[4])){
			try {
				result = XSSValidation.escapeURL(s);
			} catch (EncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}		
		else if(solution.equals(xssFixOptions[5])){
			try {
				result = XSSValidation.validateCreditCard(s);
			} catch (ValidationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IntrusionException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if(solution.equals(xssFixOptions[6])){
			result = XSSValidation.escapeCustomString(s, XSSValidation.REGEX_ALPHANUMERIC, 1024);
		}
		else if(solution.equals(xssFixOptions[7])){
			result = XSSValidation.escapeCustomString(s, XSSValidation.REGEX_ALPHA, 1024);
		}
		else if(solution.equals(xssFixOptions[8])){
			result = XSSValidation.escapeCustomString(s, XSSValidation.REGEX_EMAIL, 255);
		}
		else if(solution.equals(xssFixOptions[9])){
			result = XSSValidation.escapeCustomString(s, XSSValidation.REGEX_ZIP_CODE, 10);
		}
		else if(solution.equals(xssFixOptions[10])){
			result = XSSValidation.escapeCustomString(s, XSSValidation.REGEX_IP_ADDRESS, 32);
		}
		else if(solution.equals(xssFixOptions[11])){
			result = XSSValidation.escapeCustomString(s, XSSValidation.REGEX_SSN, 12);
		}
		
		return result;
	}
}
