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
		 
		fixes.put("LessonSource.java_203", "HTML-ENCODING");
		fixes.put("ViewDatabase.java_69", "ZIP-CODE-WHITELIST");
		fixes.put("WeakAuthenticationCookie.java_350", "ALPHA-NUMERIC-WHITELIST");
		fixes.put("SqlStringInjection.java_167", "ALPHA-WHITELIST");
		fixes.put("SessionFixation.java_778", "SSN-WHITELIST");
		fixes.put("SqlNumericInjection.java_189", "DO-NOTHING");
		fixes.put("SessionFixation.java_570", "ALPHA-NUMERIC-WHITELIST");
		fixes.put("ReflectedXSS.java_128", "SSN-WHITELIST");
		fixes.put("XMLInjection.java_123", "IP-ADDRESS-WHITELIST");
		fixes.put("DangerousEval.java_110", "DO-NOTHING");
		fixes.put("MultiLevelLogin2.java_539", "EMAIL-WHITELIST");
		fixes.put("TraceXSS.java_184", "HTML-ENCODING");
		fixes.put("MultiLevelLogin2.java_438", "CREDIT-CARD-VALIDATION");
		fixes.put("SessionFixation.java_578", "ALPHA-NUMERIC-WHITELIST");
		fixes.put("MultiLevelLogin2.java_432", "HTML-ATTRIBUTE-ENCODING");
		fixes.put("ParameterParser.java_581", "ALPHA-NUMERIC-WHITELIST");
		fixes.put("MultiLevelLogin2.java_435", "[a-z]+");
		fixes.put("Encoding.java_193", "JAVASCRIPT-ENCODING");
		fixes.put("HttpOnly.java_255", "HTML-ATTRIBUTE-ENCODING");
		fixes.put("MultiLevelLogin2.java_381", "CSS-ENCODING");
		fixes.put("SilentTransactions.java_111", "ZIP-CODE-WHITELIST");
		fixes.put("MultiLevelLogin1.java_438", "ZIP-CODE-WHITELIST");
		fixes.put("ClientSideValidation.java_233", "SSN-WHITELIST");
		fixes.put("TraceXSS.java_180", "URL-ENCODING");
		fixes.put("MultiLevelLogin1.java_435", "EMAIL-WHITELIST");
		fixes.put("InsecureLogin.java_325", "ALPHA-WHITELIST");
		fixes.put("WSDLScanning.java_216", "[a-z]+");
		fixes.put("WSDLScanning.java_217", "URL-ENCODING");
		fixes.put("Challenge2Screen.java_221", "URL-ENCODING");
		fixes.put("OffByOne.java_261", "DO-NOTHING");
		fixes.put("SqlNumericInjection.java_109", "ALPHA-WHITELIST");
		fixes.put("WsSAXInjection.java_139", "ALPHA-NUMERIC-WHITELIST");
		fixes.put("MultiLevelLogin1.java_441", "EMAIL-WHITELIST");
		fixes.put("SessionFixation.java_581", "CSS-ENCODING");
		fixes.put("InsecureLogin.java_322", "ALPHA-NUMERIC-WHITELIST");
		fixes.put("UncheckedEmail.java_323", "IP-ADDRESS-WHITELIST");
		fixes.put("SessionFixation.java_584", "SSN-WHITELIST");
		fixes.put("UncheckedEmail.java_275", "EMAIL-WHITELIST");
		fixes.put("SessionFixation.java_315", "IP-ADDRESS-WHITELIST");
		fixes.put("ParameterParser.java_674", "CREDIT-CARD-VALIDATION");
		fixes.put("ECSFactory.java_483", "CREDIT-CARD-VALIDATION");
		fixes.put("SqlStringInjection.java_204", "ZIP-CODE-WHITELIST");
		fixes.put("Phishing.java_137", "URL-ENCODING");
		fixes.put("MultiLevelLogin2.java_422", "ALPHA-NUMERIC-WHITELIST");
		fixes.put("ParameterParser.java_615", "HTML-ATTRIBUTE-ENCODING");
		fixes.put("ClientSideValidation.java_307", "JAVASCRIPT-ENCODING");
		fixes.put("DatabaseUtilities.java_159", "DO-NOTHING");
		fixes.put("SqlStringInjection.java_101", "CSS-ENCODING");
		fixes.put("SqlModifyData.java_167", "ALPHA-WHITELIST");
		fixes.put("MaliciousFileExecution.java_160", "IP-ADDRESS-WHITELIST");
		fixes.put("ReflectedXSS.java_140", "HTML-ATTRIBUTE-ENCODING");
		fixes.put("CSRF.java_245", "[a-z]+");
		fixes.put("WsSqlInjection.java_179", "CREDIT-CARD-VALIDATION");
		fixes.put("BlindStringSqlInjection.java_81", "CSS-ENCODING");
		fixes.put("LogSpoofing.java_108", "JAVASCRIPT-ENCODING");
		fixes.put("ConcurrencyCart.java_276", "ALPHA-NUMERIC-WHITELIST");
		fixes.put("BackDoors.java_100", "CREDIT-CARD-VALIDATION");
		fixes.put("WeakSessionID.java_251", "ALPHA-WHITELIST");
		fixes.put("BackDoors.java_101", "URL-ENCODING");
		fixes.put("BackDoors.java_102", "URL-ENCODING");
		fixes.put("ClientSideValidation.java_355", "CSS-ENCODING");
		fixes.put("ConcurrencyCart.java_270", "CSS-ENCODING");
		fixes.put("BackDoors.java_108", "ALPHA-NUMERIC-WHITELIST");
		fixes.put("ClientSideValidation.java_350", "HTML-ATTRIBUTE-ENCODING");
		fixes.put("ParameterParser.java_567", "CREDIT-CARD-VALIDATION");
		fixes.put("BackDoors.java_109", "JAVASCRIPT-ENCODING");
		fixes.put("Screen.java_227", "JAVASCRIPT-ENCODING");
		fixes.put("SessionFixation.java_641", "DO-NOTHING");
		fixes.put("BackDoors.java_107", "ALPHA-NUMERIC-WHITELIST");
		fixes.put("OffByOne.java_240", "JAVASCRIPT-ENCODING");
		fixes.put("ProductsAdminScreen.java_68", "HTML-ATTRIBUTE-ENCODING");
		fixes.put("ReflectedXSS.java_153", "DO-NOTHING");
		fixes.put("MaliciousFileExecution.java_150", "ALPHA-WHITELIST");
		fixes.put("StoredXss.java_218", "CSS-ENCODING");
		fixes.put("CSRF.java_235", "JAVASCRIPT-ENCODING");
		fixes.put("DOS_Login.java_106", "ALPHA-WHITELIST");
		fixes.put("HttpSplitting.java_162", "JAVASCRIPT-ENCODING");
		fixes.put("HttpBasics.java_68", "DO-NOTHING");
		fixes.put("SqlAddData.java_102", "URL-ENCODING");
		fixes.put("MultiLevelLogin1.java_628", "JAVASCRIPT-ENCODING");
		fixes.put("WsSqlInjection.java_162", "SSN-WHITELIST");
		fixes.put("BackDoors.java_111", "CSS-ENCODING");
		fixes.put("OffByOne.java_374", "HTML-ATTRIBUTE-ENCODING");
		fixes.put("OffByOne.java_379", "ALPHA-NUMERIC-WHITELIST");
		fixes.put("BackDoors.java_110", "SSN-WHITELIST");
		fixes.put("TraceXSS.java_150", "DO-NOTHING");
		fixes.put("AbstractLesson.java_771", "JAVASCRIPT-ENCODING");
		fixes.put("MultiLevelLogin1.java_427", "EMAIL-WHITELIST");
		fixes.put("BackDoors.java_250", "JAVASCRIPT-ENCODING");
		fixes.put("ClientSideValidation.java_362", "ALPHA-NUMERIC-WHITELIST");
		fixes.put("MaliciousFileExecution.java_488", "IP-ADDRESS-WHITELIST");
		fixes.put("JavaScriptValidation.java_118", "HTML-ATTRIBUTE-ENCODING");
		fixes.put("JavaScriptValidation.java_117", "HTML-ATTRIBUTE-ENCODING");
		fixes.put("JavaScriptValidation.java_116", "DO-NOTHING");
		fixes.put("StoredXss.java_230", "SSN-WHITELIST");
		fixes.put("ClientSideValidation.java_330", "HTML-ATTRIBUTE-ENCODING");
		fixes.put("ThreadSafetyProblem.java_98", "URL-ENCODING");
		fixes.put("JavaScriptValidation.java_119", "DO-NOTHING");
		fixes.put("SqlModifyData.java_110", "HTML-ATTRIBUTE-ENCODING");
		fixes.put("JSONInjection.java_90", "CREDIT-CARD-VALIDATION");
		fixes.put("ClientSideValidation.java_333", "ALPHA-WHITELIST");
		fixes.put("WSDLScanning.java_154", "HTML-ENCODING");
		fixes.put("AbstractLesson.java_769", "DO-NOTHING");
		fixes.put("BlindScript.java_97", "ZIP-CODE-WHITELIST");
		fixes.put("JavaScriptValidation.java_120", "ALPHA-NUMERIC-WHITELIST");
		fixes.put("JavaScriptValidation.java_121", "URL-ENCODING");
		fixes.put("DOMInjection.java_87", "HTML-ENCODING");
		fixes.put("OffByOne.java_384", "HTML-ENCODING");
		fixes.put("SqlNumericInjection.java_235", "CREDIT-CARD-VALIDATION");
		fixes.put("JavaScriptValidation.java_122", "EMAIL-WHITELIST");
		fixes.put("BasicAuthentication.java_127", "JAVASCRIPT-ENCODING");
		fixes.put("BasicAuthentication.java_128", "DO-NOTHING");
		fixes.put("StoredXss.java_332", "SSN-WHITELIST");
		fixes.put("StoredXss.java_222", "HTML-ATTRIBUTE-ENCODING");
		fixes.put("ClientSideValidation.java_340", "CREDIT-CARD-VALIDATION");
		fixes.put("Encoding.java_609", "ZIP-CODE-WHITELIST");
		fixes.put("TraceXSS.java_137", "JAVASCRIPT-ENCODING");
		fixes.put("BackDoors.java_180", "ZIP-CODE-WHITELIST");
		fixes.put("ClientSideValidation.java_288", "URL-ENCODING");
		fixes.put("StoredXss.java_225", "[a-z]+");
		fixes.put("WebSession.java_507", "IP-ADDRESS-WHITELIST");
		fixes.put("ClientSideValidation.java_283", "IP-ADDRESS-WHITELIST");
		fixes.put("ClientSideValidation.java_208", "[a-z]+");
		fixes.put("DangerousEval.java_138", "HTML-ATTRIBUTE-ENCODING");
		fixes.put("CSRF.java_302", "CREDIT-CARD-VALIDATION");
		fixes.put("Screen.java_198", "JAVASCRIPT-ENCODING");
		fixes.put("Encoding.java_612", "IP-ADDRESS-WHITELIST");
		fixes.put("ClientSideValidation.java_217", "CREDIT-CARD-VALIDATION");
		fixes.put("SqlStringInjection.java_95", "IP-ADDRESS-WHITELIST");
		fixes.put("CSRF.java_290", "ALPHA-NUMERIC-WHITELIST");
		fixes.put("WebSession.java_1060", "CREDIT-CARD-VALIDATION");
		fixes.put("BackDoors.java_148", "CREDIT-CARD-VALIDATION");
		fixes.put("CSRF.java_306", "ALPHA-NUMERIC-WHITELIST");
		fixes.put("UncheckedEmail.java_318", "ALPHA-NUMERIC-WHITELIST");
		fixes.put("ReflectedXSS.java_187", "URL-ENCODING");
		fixes.put("SqlNumericInjection.java_119", "URL-ENCODING");
		fixes.put("Challenge2Screen.java_252", "ALPHA-NUMERIC-WHITELIST");
		fixes.put("OffByOne.java_466", "ALPHA-WHITELIST");
		fixes.put("CSRF.java_294", "EMAIL-WHITELIST");
		fixes.put("OffByOne.java_461", "URL-ENCODING");
		fixes.put("ReflectedXSS.java_183", "SSN-WHITELIST");
		fixes.put("ClientSideValidation.java_312", "HTML-ENCODING");
		fixes.put("CSRF.java_297", "ALPHA-NUMERIC-WHITELIST");
		fixes.put("ECSFactory.java_316", "CREDIT-CARD-VALIDATION");
		fixes.put("InsecureLogin.java_311", "CSS-ENCODING");
		fixes.put("OffByOne.java_471", "ZIP-CODE-WHITELIST");
		fixes.put("ReportCardScreen.java_274", "ALPHA-NUMERIC-WHITELIST");
		fixes.put("ViewDatabase.java_82", "[a-z]+");
		fixes.put("TraceXSS.java_125", "CREDIT-CARD-VALIDATION");
		fixes.put("ClientSideValidation.java_319", "CSS-ENCODING");
		fixes.put("HttpSplitting.java_103", "DO-NOTHING");
		fixes.put("InsecureLogin.java_319", "HTML-ENCODING");
		fixes.put("SilentTransactions.java_89", "SSN-WHITELIST");
		fixes.put("DangerousEval.java_128", "EMAIL-WHITELIST");
		fixes.put("ForgotPassword.java_193", "DO-NOTHING");
		fixes.put("ClientSideValidation.java_297", "JAVASCRIPT-ENCODING");
		fixes.put("BackDoors.java_98", "ALPHA-WHITELIST");
		fixes.put("BackDoors.java_99", "HTML-ENCODING");
		fixes.put("AbstractLesson.java_534", "SSN-WHITELIST");
		fixes.put("ForgotPassword.java_197", "IP-ADDRESS-WHITELIST");
		fixes.put("WsSqlInjection.java_233", "ALPHA-NUMERIC-WHITELIST");
		fixes.put("StoredXss.java_240", "[a-z]+");
		fixes.put("AbstractLesson.java_531", "HTML-ATTRIBUTE-ENCODING");
		fixes.put("ClientSideValidation.java_228", "[a-z]+");
		fixes.put("UserAdminScreen.java_68", "URL-ENCODING");
		fixes.put("OffByOne.java_282", "URL-ENCODING");
		fixes.put("UncheckedEmail.java_195", "ALPHA-NUMERIC-WHITELIST");
		fixes.put("Challenge2Screen.java_793", "CSS-ENCODING");
		fixes.put("TraceXSS.java_113", "SSN-WHITELIST");
		fixes.put("DOMXSS.java_156", "HTML-ATTRIBUTE-ENCODING");
		fixes.put("ReflectedXSS.java_116", "HTML-ATTRIBUTE-ENCODING");
		fixes.put("InsecureLogin.java_447", "CSS-ENCODING");
		fixes.put("BlindNumericSqlInjection.java_81", "IP-ADDRESS-WHITELIST");
		fixes.put("Encoding.java_203", "SSN-WHITELIST");
		fixes.put("SqlNumericInjection.java_263", "SSN-WHITELIST");
		fixes.put("SqlAddData.java_149", "ZIP-CODE-WHITELIST");
		fixes.put("DangerousEval.java_119", "CREDIT-CARD-VALIDATION");
			 
	} 
	 

		pointcut xss_writeFunction(String param1) : 
			call(* *.write(String)) && 
			(within(*..ParameterParser) || 
			within(*..ForgotPassword) || 
			within(*..SqlNumericInjection) || 
			within(*..DatabaseUtilities) || 
			within(*..SqlStringInjection) || 
			within(*..SessionFixation) || 
			within(*..AbstractLesson) || 
			within(*..ClientSideValidation) || 
			within(*..BackDoors) || 
			within(*..ReflectedXSS) || 
			within(*..InsecureLogin) || 
			within(*..JavaScriptValidation) || 
			within(*..BlindScript) || 
			within(*..WebSession) || 
			within(*..WeakSessionID) || 
			within(*..SqlAddData) || 
			within(*..BasicAuthentication) || 
			within(*..WsSqlInjection) || 
			within(*..MaliciousFileExecution) || 
			within(*..HttpSplitting) || 
			within(*..OffByOne) || 
			within(*..UserAdminScreen) || 
			within(*..DOMXSS) || 
			within(*..DOMInjection) || 
			within(*..HttpOnly) || 
			within(*..XMLInjection) || 
			within(*..MultiLevelLogin1) || 
			within(*..LessonSource) || 
			within(*..UncheckedEmail) || 
			within(*..ConcurrencyCart) || 
			within(*..WeakAuthenticationCookie) || 
			within(*..MultiLevelLogin2) || 
			within(*..ReportCardScreen) || 
			within(*..Phishing) || 
			within(*..CSRF) || 
			within(*..Challenge2Screen) || 
			within(*..ECSFactory) || 
			within(*..BlindStringSqlInjection) || 
			within(*..SilentTransactions) || 
			within(*..Encoding) || 
			within(*..SqlModifyData) || 
			within(*..DangerousEval) || 
			within(*..LogSpoofing) || 
			within(*..WSDLScanning) || 
			within(*..BlindNumericSqlInjection) || 
			within(*..ProductsAdminScreen) || 
			within(*..HttpBasics) || 
			within(*..JSONInjection) || 
			within(*..StoredXss) || 
			within(*..DOS_Login) || 
			within(*..TraceXSS) || 
			within(*..ViewDatabase) || 
			within(*..ThreadSafetyProblem) || 
			within(*..WsSAXInjection)) && 
			args(param1);
			
		Object around(String param1) : xss_writeFunction(param1){
			watch.start();
			if(fixes.containsKey(thisJoinPoint.getSourceLocation().getFileName() + "_" + 
				thisJoinPoint.getSourceLocation().getLine())){
				
				try{
					String result = ThesisUtil.doXSSFix(param1, fixes.get(thisJoinPoint.getSourceLocation().getFileName() + "_" + 
						thisJoinPoint.getSourceLocation().getLine()));
					return proceed(result);
				} catch (Exception e) {
					e.printStackTrace();
				}
			} 
			else{
				return proceed(param1);
			}
			watch.stop();
			logger.info(thisJoinPoint.getSourceLocation().getFileName() + "_" + 
				thisJoinPoint.getSourceLocation().getLine() + "," + watch.getElapsedTime());			
						
			return proceed(param1);
		}

		pointcut xss_writeByteArrayFunction(byte[] param1) : 
			call(* *.write(byte[])) && 
			(within(*..ParameterParser) || 
			within(*..ForgotPassword) || 
			within(*..SqlNumericInjection) || 
			within(*..DatabaseUtilities) || 
			within(*..SqlStringInjection) || 
			within(*..SessionFixation) || 
			within(*..AbstractLesson) || 
			within(*..ClientSideValidation) || 
			within(*..BackDoors) || 
			within(*..ReflectedXSS) || 
			within(*..InsecureLogin) || 
			within(*..JavaScriptValidation) || 
			within(*..BlindScript) || 
			within(*..WebSession) || 
			within(*..WeakSessionID) || 
			within(*..SqlAddData) || 
			within(*..BasicAuthentication) || 
			within(*..WsSqlInjection) || 
			within(*..MaliciousFileExecution) || 
			within(*..HttpSplitting) || 
			within(*..OffByOne) || 
			within(*..UserAdminScreen) || 
			within(*..DOMXSS) || 
			within(*..DOMInjection) || 
			within(*..HttpOnly) || 
			within(*..XMLInjection) || 
			within(*..MultiLevelLogin1) || 
			within(*..LessonSource) || 
			within(*..UncheckedEmail) || 
			within(*..ConcurrencyCart) || 
			within(*..WeakAuthenticationCookie) || 
			within(*..MultiLevelLogin2) || 
			within(*..ReportCardScreen) || 
			within(*..Phishing) || 
			within(*..CSRF) || 
			within(*..Challenge2Screen) || 
			within(*..ECSFactory) || 
			within(*..BlindStringSqlInjection) || 
			within(*..SilentTransactions) || 
			within(*..Encoding) || 
			within(*..SqlModifyData) || 
			within(*..DangerousEval) || 
			within(*..LogSpoofing) || 
			within(*..WSDLScanning) || 
			within(*..BlindNumericSqlInjection) || 
			within(*..ProductsAdminScreen) || 
			within(*..HttpBasics) || 
			within(*..JSONInjection) || 
			within(*..StoredXss) || 
			within(*..DOS_Login) || 
			within(*..TraceXSS) || 
			within(*..ViewDatabase) || 
			within(*..ThreadSafetyProblem) || 
			within(*..WsSAXInjection)) && 
			args(param1);
			
		Object around(byte[] param1) : xss_writeByteArrayFunction(param1){
			watch.start();
			if(fixes.containsKey(thisJoinPoint.getSourceLocation().getFileName() + "_" + 
				thisJoinPoint.getSourceLocation().getLine())){
				
				try{
					byte[] result = ThesisUtil.doXSSFix(param1, fixes.get(thisJoinPoint.getSourceLocation().getFileName() + "_" + 
						thisJoinPoint.getSourceLocation().getLine()));
					return proceed(result);
				} catch (Exception e) {
					e.printStackTrace();
				}
			} 
			else{
				return proceed(param1);
			}
			watch.stop();
			logger.info(thisJoinPoint.getSourceLocation().getFileName() + "_" + 
				thisJoinPoint.getSourceLocation().getLine() + "," + watch.getElapsedTime());			
						
			return proceed(param1);
		}

		pointcut xss_printFunction(String param1) : 
			call(* *.print(String)) && 
			(within(*..ParameterParser) || 
			within(*..ForgotPassword) || 
			within(*..SqlNumericInjection) || 
			within(*..DatabaseUtilities) || 
			within(*..SqlStringInjection) || 
			within(*..SessionFixation) || 
			within(*..AbstractLesson) || 
			within(*..ClientSideValidation) || 
			within(*..BackDoors) || 
			within(*..ReflectedXSS) || 
			within(*..InsecureLogin) || 
			within(*..JavaScriptValidation) || 
			within(*..BlindScript) || 
			within(*..WebSession) || 
			within(*..WeakSessionID) || 
			within(*..SqlAddData) || 
			within(*..BasicAuthentication) || 
			within(*..WsSqlInjection) || 
			within(*..MaliciousFileExecution) || 
			within(*..HttpSplitting) || 
			within(*..OffByOne) || 
			within(*..UserAdminScreen) || 
			within(*..DOMXSS) || 
			within(*..DOMInjection) || 
			within(*..HttpOnly) || 
			within(*..XMLInjection) || 
			within(*..MultiLevelLogin1) || 
			within(*..LessonSource) || 
			within(*..UncheckedEmail) || 
			within(*..ConcurrencyCart) || 
			within(*..WeakAuthenticationCookie) || 
			within(*..MultiLevelLogin2) || 
			within(*..ReportCardScreen) || 
			within(*..Phishing) || 
			within(*..CSRF) || 
			within(*..Challenge2Screen) || 
			within(*..ECSFactory) || 
			within(*..BlindStringSqlInjection) || 
			within(*..SilentTransactions) || 
			within(*..Encoding) || 
			within(*..SqlModifyData) || 
			within(*..DangerousEval) || 
			within(*..LogSpoofing) || 
			within(*..WSDLScanning) || 
			within(*..BlindNumericSqlInjection) || 
			within(*..ProductsAdminScreen) || 
			within(*..HttpBasics) || 
			within(*..JSONInjection) || 
			within(*..StoredXss) || 
			within(*..DOS_Login) || 
			within(*..TraceXSS) || 
			within(*..ViewDatabase) || 
			within(*..ThreadSafetyProblem) || 
			within(*..WsSAXInjection)) && 
			args(param1);
			
		Object around(String param1) : xss_printFunction(param1){
			watch.start();
			if(fixes.containsKey(thisJoinPoint.getSourceLocation().getFileName() + "_" + 
				thisJoinPoint.getSourceLocation().getLine())){
				
				try{
					String result = ThesisUtil.doXSSFix(param1, fixes.get(thisJoinPoint.getSourceLocation().getFileName() + "_" + 
						thisJoinPoint.getSourceLocation().getLine()));
					return proceed(result);
				} catch (Exception e) {
					e.printStackTrace();
				}
			} 
			else{
				return proceed(param1);
			}
			watch.stop();
			logger.info(thisJoinPoint.getSourceLocation().getFileName() + "_" + 
				thisJoinPoint.getSourceLocation().getLine() + "," + watch.getElapsedTime());			
						
			return proceed(param1);
		}

		pointcut xss_printlnFunction(String param1) : 
			call(* *.println(String)) && 
			(within(*..ParameterParser) || 
			within(*..ForgotPassword) || 
			within(*..SqlNumericInjection) || 
			within(*..DatabaseUtilities) || 
			within(*..SqlStringInjection) || 
			within(*..SessionFixation) || 
			within(*..AbstractLesson) || 
			within(*..ClientSideValidation) || 
			within(*..BackDoors) || 
			within(*..ReflectedXSS) || 
			within(*..InsecureLogin) || 
			within(*..JavaScriptValidation) || 
			within(*..BlindScript) || 
			within(*..WebSession) || 
			within(*..WeakSessionID) || 
			within(*..SqlAddData) || 
			within(*..BasicAuthentication) || 
			within(*..WsSqlInjection) || 
			within(*..MaliciousFileExecution) || 
			within(*..HttpSplitting) || 
			within(*..OffByOne) || 
			within(*..UserAdminScreen) || 
			within(*..DOMXSS) || 
			within(*..DOMInjection) || 
			within(*..HttpOnly) || 
			within(*..XMLInjection) || 
			within(*..MultiLevelLogin1) || 
			within(*..LessonSource) || 
			within(*..UncheckedEmail) || 
			within(*..ConcurrencyCart) || 
			within(*..WeakAuthenticationCookie) || 
			within(*..MultiLevelLogin2) || 
			within(*..ReportCardScreen) || 
			within(*..Phishing) || 
			within(*..CSRF) || 
			within(*..Challenge2Screen) || 
			within(*..ECSFactory) || 
			within(*..BlindStringSqlInjection) || 
			within(*..SilentTransactions) || 
			within(*..Encoding) || 
			within(*..SqlModifyData) || 
			within(*..DangerousEval) || 
			within(*..LogSpoofing) || 
			within(*..WSDLScanning) || 
			within(*..BlindNumericSqlInjection) || 
			within(*..ProductsAdminScreen) || 
			within(*..HttpBasics) || 
			within(*..JSONInjection) || 
			within(*..StoredXss) || 
			within(*..DOS_Login) || 
			within(*..TraceXSS) || 
			within(*..ViewDatabase) || 
			within(*..ThreadSafetyProblem) || 
			within(*..WsSAXInjection)) && 
			args(param1);
			
		Object around(String param1) : xss_printlnFunction(param1){
			watch.start();
			if(fixes.containsKey(thisJoinPoint.getSourceLocation().getFileName() + "_" + 
				thisJoinPoint.getSourceLocation().getLine())){
				
				try{
					String result = ThesisUtil.doXSSFix(param1, fixes.get(thisJoinPoint.getSourceLocation().getFileName() + "_" + 
						thisJoinPoint.getSourceLocation().getLine()));
					return proceed(result);
				} catch (Exception e) {
					e.printStackTrace();
				}
			} 
			else{
				return proceed(param1);
			}
			watch.stop();
			logger.info(thisJoinPoint.getSourceLocation().getFileName() + "_" + 
				thisJoinPoint.getSourceLocation().getLine() + "," + watch.getElapsedTime());			
						
			return proceed(param1);
		}

		pointcut xss_sendErrorFunction(String param1) : 
			call(* *.sendError(String)) && 
			(within(*..ParameterParser) || 
			within(*..ForgotPassword) || 
			within(*..SqlNumericInjection) || 
			within(*..DatabaseUtilities) || 
			within(*..SqlStringInjection) || 
			within(*..SessionFixation) || 
			within(*..AbstractLesson) || 
			within(*..ClientSideValidation) || 
			within(*..BackDoors) || 
			within(*..ReflectedXSS) || 
			within(*..InsecureLogin) || 
			within(*..JavaScriptValidation) || 
			within(*..BlindScript) || 
			within(*..WebSession) || 
			within(*..WeakSessionID) || 
			within(*..SqlAddData) || 
			within(*..BasicAuthentication) || 
			within(*..WsSqlInjection) || 
			within(*..MaliciousFileExecution) || 
			within(*..HttpSplitting) || 
			within(*..OffByOne) || 
			within(*..UserAdminScreen) || 
			within(*..DOMXSS) || 
			within(*..DOMInjection) || 
			within(*..HttpOnly) || 
			within(*..XMLInjection) || 
			within(*..MultiLevelLogin1) || 
			within(*..LessonSource) || 
			within(*..UncheckedEmail) || 
			within(*..ConcurrencyCart) || 
			within(*..WeakAuthenticationCookie) || 
			within(*..MultiLevelLogin2) || 
			within(*..ReportCardScreen) || 
			within(*..Phishing) || 
			within(*..CSRF) || 
			within(*..Challenge2Screen) || 
			within(*..ECSFactory) || 
			within(*..BlindStringSqlInjection) || 
			within(*..SilentTransactions) || 
			within(*..Encoding) || 
			within(*..SqlModifyData) || 
			within(*..DangerousEval) || 
			within(*..LogSpoofing) || 
			within(*..WSDLScanning) || 
			within(*..BlindNumericSqlInjection) || 
			within(*..ProductsAdminScreen) || 
			within(*..HttpBasics) || 
			within(*..JSONInjection) || 
			within(*..StoredXss) || 
			within(*..DOS_Login) || 
			within(*..TraceXSS) || 
			within(*..ViewDatabase) || 
			within(*..ThreadSafetyProblem) || 
			within(*..WsSAXInjection)) && 
			args(param1);
			
		Object around(String param1) : xss_sendErrorFunction(param1){
			watch.start();
			if(fixes.containsKey(thisJoinPoint.getSourceLocation().getFileName() + "_" + 
				thisJoinPoint.getSourceLocation().getLine())){
				
				try{
					String result = ThesisUtil.doXSSFix(param1, fixes.get(thisJoinPoint.getSourceLocation().getFileName() + "_" + 
						thisJoinPoint.getSourceLocation().getLine()));
					return proceed(result);
				} catch (Exception e) {
					e.printStackTrace();
				}
			} 
			else{
				return proceed(param1);
			}
			watch.stop();
			logger.info(thisJoinPoint.getSourceLocation().getFileName() + "_" + 
				thisJoinPoint.getSourceLocation().getLine() + "," + watch.getElapsedTime());			
						
			return proceed(param1);
		}

		pointcut xss_getParameterFunction(String param1) : 
			call(* *.getParameter(String)) && 
			(within(*..ParameterParser) || 
			within(*..ForgotPassword) || 
			within(*..SqlNumericInjection) || 
			within(*..DatabaseUtilities) || 
			within(*..SqlStringInjection) || 
			within(*..SessionFixation) || 
			within(*..AbstractLesson) || 
			within(*..ClientSideValidation) || 
			within(*..BackDoors) || 
			within(*..ReflectedXSS) || 
			within(*..InsecureLogin) || 
			within(*..JavaScriptValidation) || 
			within(*..BlindScript) || 
			within(*..WebSession) || 
			within(*..WeakSessionID) || 
			within(*..SqlAddData) || 
			within(*..BasicAuthentication) || 
			within(*..WsSqlInjection) || 
			within(*..MaliciousFileExecution) || 
			within(*..HttpSplitting) || 
			within(*..OffByOne) || 
			within(*..UserAdminScreen) || 
			within(*..DOMXSS) || 
			within(*..DOMInjection) || 
			within(*..HttpOnly) || 
			within(*..XMLInjection) || 
			within(*..MultiLevelLogin1) || 
			within(*..LessonSource) || 
			within(*..UncheckedEmail) || 
			within(*..ConcurrencyCart) || 
			within(*..WeakAuthenticationCookie) || 
			within(*..MultiLevelLogin2) || 
			within(*..ReportCardScreen) || 
			within(*..Phishing) || 
			within(*..CSRF) || 
			within(*..Challenge2Screen) || 
			within(*..ECSFactory) || 
			within(*..BlindStringSqlInjection) || 
			within(*..SilentTransactions) || 
			within(*..Encoding) || 
			within(*..SqlModifyData) || 
			within(*..DangerousEval) || 
			within(*..LogSpoofing) || 
			within(*..WSDLScanning) || 
			within(*..BlindNumericSqlInjection) || 
			within(*..ProductsAdminScreen) || 
			within(*..HttpBasics) || 
			within(*..JSONInjection) || 
			within(*..StoredXss) || 
			within(*..DOS_Login) || 
			within(*..TraceXSS) || 
			within(*..ViewDatabase) || 
			within(*..ThreadSafetyProblem) || 
			within(*..WsSAXInjection)) && 
			args(param1);
			
		Object around(String param1) : xss_getParameterFunction(param1){
			watch.start();
			if(fixes.containsKey(thisJoinPoint.getSourceLocation().getFileName() + "_" + 
				thisJoinPoint.getSourceLocation().getLine())){
				
				try{
					String result = (String) proceed(param1);
					
					String encodedValue = ThesisUtil.doXSSFix(result, fixes.get(thisJoinPoint.getSourceLocation().getFileName() + "_" + 
						thisJoinPoint.getSourceLocation().getLine()));
				
				    return encodedValue;
				} catch (Exception e) {
					e.printStackTrace();
				}
			} 
			else{
				return proceed(param1);
			}
			watch.stop();
			logger.info(thisJoinPoint.getSourceLocation().getFileName() + "_" + 
				thisJoinPoint.getSourceLocation().getLine() + "," + watch.getElapsedTime());			
						
			return proceed(param1);
		}

		pointcut xss_setAttributeFunction(String param1) : 
			call(* *.setAttribute(String)) && 
			(within(*..ParameterParser) || 
			within(*..ForgotPassword) || 
			within(*..SqlNumericInjection) || 
			within(*..DatabaseUtilities) || 
			within(*..SqlStringInjection) || 
			within(*..SessionFixation) || 
			within(*..AbstractLesson) || 
			within(*..ClientSideValidation) || 
			within(*..BackDoors) || 
			within(*..ReflectedXSS) || 
			within(*..InsecureLogin) || 
			within(*..JavaScriptValidation) || 
			within(*..BlindScript) || 
			within(*..WebSession) || 
			within(*..WeakSessionID) || 
			within(*..SqlAddData) || 
			within(*..BasicAuthentication) || 
			within(*..WsSqlInjection) || 
			within(*..MaliciousFileExecution) || 
			within(*..HttpSplitting) || 
			within(*..OffByOne) || 
			within(*..UserAdminScreen) || 
			within(*..DOMXSS) || 
			within(*..DOMInjection) || 
			within(*..HttpOnly) || 
			within(*..XMLInjection) || 
			within(*..MultiLevelLogin1) || 
			within(*..LessonSource) || 
			within(*..UncheckedEmail) || 
			within(*..ConcurrencyCart) || 
			within(*..WeakAuthenticationCookie) || 
			within(*..MultiLevelLogin2) || 
			within(*..ReportCardScreen) || 
			within(*..Phishing) || 
			within(*..CSRF) || 
			within(*..Challenge2Screen) || 
			within(*..ECSFactory) || 
			within(*..BlindStringSqlInjection) || 
			within(*..SilentTransactions) || 
			within(*..Encoding) || 
			within(*..SqlModifyData) || 
			within(*..DangerousEval) || 
			within(*..LogSpoofing) || 
			within(*..WSDLScanning) || 
			within(*..BlindNumericSqlInjection) || 
			within(*..ProductsAdminScreen) || 
			within(*..HttpBasics) || 
			within(*..JSONInjection) || 
			within(*..StoredXss) || 
			within(*..DOS_Login) || 
			within(*..TraceXSS) || 
			within(*..ViewDatabase) || 
			within(*..ThreadSafetyProblem) || 
			within(*..WsSAXInjection)) && 
			args(param1);
			
		Object around(String param1) : xss_setAttributeFunction(param1){
			watch.start();
			if(fixes.containsKey(thisJoinPoint.getSourceLocation().getFileName() + "_" + 
				thisJoinPoint.getSourceLocation().getLine())){
				
				try{
					String result = ThesisUtil.doXSSFix(param1, fixes.get(thisJoinPoint.getSourceLocation().getFileName() + "_" + 
						thisJoinPoint.getSourceLocation().getLine()));
					return proceed(result);
				} catch (Exception e) {
					e.printStackTrace();
				}
			} 
			else{
				return proceed(param1);
			}
			watch.stop();
			logger.info(thisJoinPoint.getSourceLocation().getFileName() + "_" + 
				thisJoinPoint.getSourceLocation().getLine() + "," + watch.getElapsedTime());			
						
			return proceed(param1);
		}

		pointcut xss_writeByteArrayThreeParam(byte[] param1, String param2, String param3) : 
			call(* *.write(byte[], String, String)) && 
			(within(*..ParameterParser) || 
			within(*..ForgotPassword) || 
			within(*..SqlNumericInjection) || 
			within(*..DatabaseUtilities) || 
			within(*..SqlStringInjection) || 
			within(*..SessionFixation) || 
			within(*..AbstractLesson) || 
			within(*..ClientSideValidation) || 
			within(*..BackDoors) || 
			within(*..ReflectedXSS) || 
			within(*..InsecureLogin) || 
			within(*..JavaScriptValidation) || 
			within(*..BlindScript) || 
			within(*..WebSession) || 
			within(*..WeakSessionID) || 
			within(*..SqlAddData) || 
			within(*..BasicAuthentication) || 
			within(*..WsSqlInjection) || 
			within(*..MaliciousFileExecution) || 
			within(*..HttpSplitting) || 
			within(*..OffByOne) || 
			within(*..UserAdminScreen) || 
			within(*..DOMXSS) || 
			within(*..DOMInjection) || 
			within(*..HttpOnly) || 
			within(*..XMLInjection) || 
			within(*..MultiLevelLogin1) || 
			within(*..LessonSource) || 
			within(*..UncheckedEmail) || 
			within(*..ConcurrencyCart) || 
			within(*..WeakAuthenticationCookie) || 
			within(*..MultiLevelLogin2) || 
			within(*..ReportCardScreen) || 
			within(*..Phishing) || 
			within(*..CSRF) || 
			within(*..Challenge2Screen) || 
			within(*..ECSFactory) || 
			within(*..BlindStringSqlInjection) || 
			within(*..SilentTransactions) || 
			within(*..Encoding) || 
			within(*..SqlModifyData) || 
			within(*..DangerousEval) || 
			within(*..LogSpoofing) || 
			within(*..WSDLScanning) || 
			within(*..BlindNumericSqlInjection) || 
			within(*..ProductsAdminScreen) || 
			within(*..HttpBasics) || 
			within(*..JSONInjection) || 
			within(*..StoredXss) || 
			within(*..DOS_Login) || 
			within(*..TraceXSS) || 
			within(*..ViewDatabase) || 
			within(*..ThreadSafetyProblem) || 
			within(*..WsSAXInjection)) && 
			args(param1, param2, param3);
			
		Object around(byte[] param1, String param2, String param3) : xss_writeByteArrayThreeParam(param1, param2, param3){
			watch.start();
			if(fixes.containsKey(thisJoinPoint.getSourceLocation().getFileName() + "_" + 
				thisJoinPoint.getSourceLocation().getLine())){
				
				try{
					byte[] result = ThesisUtil.doXSSFix(param1, fixes.get(thisJoinPoint.getSourceLocation().getFileName() + "_" + 
						thisJoinPoint.getSourceLocation().getLine()));
					return proceed(result, param2, param3);
				} catch (Exception e) {
					e.printStackTrace();
				}
			} 
			else{
				return proceed(param1, param2, param3);
			}
			watch.stop();
			logger.info(thisJoinPoint.getSourceLocation().getFileName() + "_" + 
				thisJoinPoint.getSourceLocation().getLine() + "," + watch.getElapsedTime());			
						
			return proceed(param1, param2, param3);
		}
} 
