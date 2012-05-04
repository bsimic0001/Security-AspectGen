package com.aspects; 
import com.thesis.aop.util.ThesisUtil; 
import com.thesis.aop.util.StopWatch; 
import org.apache.log4j.Level; 
import org.apache.log4j.Logger; 
import org.apache.log4j.PropertyConfigurator; 
import java.util.HashMap; 
import org.owasp.esapi.errors.IntrusionException; 
import org.owasp.esapi.errors.ValidationException; 
import net.sf.jsqlparser.JSQLParserException; 
 
 
public aspect XSSAspect{ 
	public HashMap<String, String> fixes = new HashMap<String, String>(); 
	public HashMap<String, String> customRegex = new HashMap<String, String>(); 
	Logger logger; 
	StopWatch watch; 
	 
	public XSSAspect(){ 
		PropertyConfigurator.configure("log4j.properties"); 
		logger = Logger.getLogger("xssLogger"); 
		logger.info("XSS Aspect Created!"); 
		watch = new StopWatch(); 
		 
		fixes.put("AVMWebappLoader.java_1451", "ZIP-CODE-WHITELIST");
		fixes.put("TestDeploymentTransportTransformer.java_73", "ALPHA-NUMERIC-WHITELIST");
		fixes.put("BaseServlet.java_232", "CREDIT-CARD-VALIDATION");
		fixes.put("BaseServlet.java_254", "DO-NOTHING");
		fixes.put("AVMRemoteTransportService.java_411", "ALPHA-NUMERIC-WHITELIST");
		fixes.put("GetMethod.java_431", "JAVASCRIPT-ENCODING");
		fixes.put("BaseServlet.java_283", "DO-NOTHING");
		fixes.put("WebDAV.java_447", "HTML-ATTRIBUTE-ENCODING");
		fixes.put("BaseServlet.java_284", "CREDIT-CARD-VALIDATION");
		fixes.put("RepoRemoteTransportService.java_459", "ZIP-CODE-WHITELIST");
		fixes.put("SampleEncryptionTransformer.java_206", "ZIP-CODE-WHITELIST");
		fixes.put("GetMethod.java_405", "URL-ENCODING");
			 
	} 
	 


} 
