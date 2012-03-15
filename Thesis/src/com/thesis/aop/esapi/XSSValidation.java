package com.thesis.aop.esapi;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.owasp.esapi.ESAPI;
import org.owasp.esapi.codecs.MySQLCodec;
import org.owasp.esapi.codecs.OracleCodec;
import org.owasp.esapi.errors.EncodingException;
import org.owasp.esapi.errors.IntrusionException;
import org.owasp.esapi.errors.ValidationException;

public abstract class XSSValidation {

	public static String REGEX_ALPHANUMERIC = "AlphaNumberic";
	public static String REGEX_ALPHA = "Alpha";
	public static String REGEX_NUMERIC = "Numeric";
	public static String REGEX_EMAIL = "Email";
	public static String REGEX_ZIP_CODE = "ZipCode";
	public static String REGEX_IP_ADDRESS = "IPAddress";
	public static String REGEX_SSN = "SSN";
	
	public XSSValidation(){}
	
	public static String escapeCustomString(String s, String regex, int maxLength){
		Pattern p = Pattern.compile(regex);
		
		//Sending pattern directly.
		try {
			return ESAPI.validator().getValidInput("CUSTOM_STRING_ESCAPE", s, p, maxLength, false, false);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			String resultString = "";
			Matcher m = p.matcher(s);
			while(m.find()){
				resultString += m.group(0);
			}
			
			return resultString;
			
		}
	}
	
	public static String escapeJavaScript(String s){
		return ESAPI.encoder().encodeForJavaScript(s);
	}
	
	public static String escapeCSS(String s){
		return ESAPI.encoder().encodeForCSS(s);
	}
	
	public static String escapeHTML(String s){
		return ESAPI.encoder().encodeForHTML(s);
	}
	
	public static String escapeHTMLAttribute(String s){
		return ESAPI.encoder().encodeForHTMLAttribute(s);
	}
	
	public static String escapeURL(String s) throws EncodingException{
		return ESAPI.encoder().encodeForURL(s);
	}
	
	public static String validateCreditCard(String s){
		try {
			return ESAPI.validator().getValidCreditCard("CREDIT_CARD", s, false);
		} catch (ValidationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IntrusionException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return s;
	}
}
