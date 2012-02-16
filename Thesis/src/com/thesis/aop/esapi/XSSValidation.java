package com.thesis.aop.esapi;
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
	
	public static String escapeCustomString(String s, String regex, int maxLength) throws ValidationException, IntrusionException{
		return ESAPI.validator().getValidInput("CUSTOM_STRING_ESCAPE", s, regex, maxLength, true);
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
	
	public static String validateCreditCard(String s) throws ValidationException, IntrusionException{
		return ESAPI.validator().getValidCreditCard("CREDIT_CARD_VALIDATION", s, false);
	}
}
