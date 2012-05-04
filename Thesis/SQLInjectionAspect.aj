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
 
 
public aspect SQLInjectionAspect{ 
	public HashMap<String, String> fixes = new HashMap<String, String>(); 
	Logger logger; 
	StopWatch watch; 
	 
	public SQLInjectionAspect(){ 
		PropertyConfigurator.configure("log4j.properties"); 
		logger = Logger.getLogger("sqlInjectionLogger"); 
		logger.info("SQL Injection Aspect Created"); 
		watch = new StopWatch(); 
		 
		fixes.put("SchemaBootstrap.java_1896", "SQL-ENCODE-ORACLE");
		fixes.put("SchemaBootstrap.java_605", "SQL-ENCODE-ORACLE");
		fixes.put("SchemaBootstrap.java_1043", "SQL-ENCODE-ORACLE");
		fixes.put("SchemaBootstrap.java_1876", "SQL-ENCODE-MYSQL");
		fixes.put("SchemaBootstrap.java_1917", "SQL-ENCODE-MYSQL");
		fixes.put("SchemaBootstrap.java_1271", "SQL-ENCODE-ORACLE");
		fixes.put("SchemaBootstrap.java_1883", "SQL-ENCODE-MYSQL");
		fixes.put("SchemaBootstrap.java_1931", "SQL-ENCODE-MYSQL");
		fixes.put("SchemaBootstrap.java_1890", "SQL-ENCODE-MYSQL");
		fixes.put("SchemaBootstrap.java_1266", "SQL-ENCODE-MYSQL");
		fixes.put("SchemaBootstrap.java_1910", "SQL-ENCODE-MYSQL");
		fixes.put("SchemaBootstrap.java_1903", "SQL-ENCODE-ORACLE");
		fixes.put("SchemaBootstrap.java_1924", "SQL-ENCODE-MYSQL");
	} 
	 

		pointcut sqlInjection_createSQLQueryFunction(String param1) : 
			call(* *.createSQLQuery(String)) && 
			(within(*..SchemaBootstrap)) && 
			args(param1);
			
		Object around(String param1) : sqlInjection_createSQLQueryFunction(param1){
			watch.start();
			if(fixes.containsKey(thisJoinPoint.getSourceLocation().getFileName() + "_" + 
				thisJoinPoint.getSourceLocation().getLine())){
				try{
					String result = ThesisUtil.doSQLInjectionFix(logger, param1, fixes.get(thisJoinPoint.getSourceLocation().getFileName() + "_" + 
						thisJoinPoint.getSourceLocation().getLine()));
					if(result.contains("VALIDATION_FAILURE")){
						logger.info(result);
					}
					else{
						proceed(result);	
					}				
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			else{
				proceed(param1);
			}
			watch.stop();
			logger.info(thisJoinPoint.getSourceLocation().getFileName() + "_" + 
				thisJoinPoint.getSourceLocation().getLine() + "," + watch.getElapsedTime());			
			return null;
		}

		pointcut sqlInjection_executeUpdateFunction(String param1) : 
			call(* *.executeUpdate(String)) && 
			(within(*..SchemaBootstrap)) && 
			args(param1);
			
		Object around(String param1) : sqlInjection_executeUpdateFunction(param1){
			watch.start();
			if(fixes.containsKey(thisJoinPoint.getSourceLocation().getFileName() + "_" + 
				thisJoinPoint.getSourceLocation().getLine())){
				try{
					String result = ThesisUtil.doSQLInjectionFix(logger, param1, fixes.get(thisJoinPoint.getSourceLocation().getFileName() + "_" + 
						thisJoinPoint.getSourceLocation().getLine()));
					if(result.contains("VALIDATION_FAILURE")){
						logger.info(result);
					}
					else{
						proceed(result);	
					}				
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			else{
				proceed(param1);
			}
			watch.stop();
			logger.info(thisJoinPoint.getSourceLocation().getFileName() + "_" + 
				thisJoinPoint.getSourceLocation().getLine() + "," + watch.getElapsedTime());			
			return null;
		}

		pointcut sqlInjection_executeQueryFunction(String param1) : 
			call(* *.executeQuery(String)) && 
			(within(*..SchemaBootstrap)) && 
			args(param1);
			
		Object around(String param1) : sqlInjection_executeQueryFunction(param1){
			watch.start();
			if(fixes.containsKey(thisJoinPoint.getSourceLocation().getFileName() + "_" + 
				thisJoinPoint.getSourceLocation().getLine())){
				try{
					String result = ThesisUtil.doSQLInjectionFix(logger, param1, fixes.get(thisJoinPoint.getSourceLocation().getFileName() + "_" + 
						thisJoinPoint.getSourceLocation().getLine()));
					if(result.contains("VALIDATION_FAILURE")){
						logger.info(result);
					}
					else{
						proceed(result);	
					}				
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			else{
				proceed(param1);
			}
			watch.stop();
			logger.info(thisJoinPoint.getSourceLocation().getFileName() + "_" + 
				thisJoinPoint.getSourceLocation().getLine() + "," + watch.getElapsedTime());			
			return null;
		}

		pointcut sqlInjection_createQueryFunction(String param1) : 
			call(* *.createQuery(String)) && 
			(within(*..SchemaBootstrap)) && 
			args(param1);
			
		Object around(String param1) : sqlInjection_createQueryFunction(param1){
			watch.start();
			if(fixes.containsKey(thisJoinPoint.getSourceLocation().getFileName() + "_" + 
				thisJoinPoint.getSourceLocation().getLine())){
				try{
					String result = ThesisUtil.doSQLInjectionFix(logger, param1, fixes.get(thisJoinPoint.getSourceLocation().getFileName() + "_" + 
						thisJoinPoint.getSourceLocation().getLine()));
					if(result.contains("VALIDATION_FAILURE")){
						logger.info(result);
					}
					else{
						proceed(result);	
					}				
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			else{
				proceed(param1);
			}
			watch.stop();
			logger.info(thisJoinPoint.getSourceLocation().getFileName() + "_" + 
				thisJoinPoint.getSourceLocation().getLine() + "," + watch.getElapsedTime());			
			return null;
		}

		pointcut sqlInjection_prepareStatementFunction(String param1) : 
			call(* *.prepareStatement(String)) && 
			(within(*..SchemaBootstrap)) && 
			args(param1);
			
		Object around(String param1) : sqlInjection_prepareStatementFunction(param1){
			watch.start();
			if(fixes.containsKey(thisJoinPoint.getSourceLocation().getFileName() + "_" + 
				thisJoinPoint.getSourceLocation().getLine())){
				try{
					String result = ThesisUtil.doSQLInjectionFix(logger, param1, fixes.get(thisJoinPoint.getSourceLocation().getFileName() + "_" + 
						thisJoinPoint.getSourceLocation().getLine()));
					if(result.contains("VALIDATION_FAILURE")){
						logger.info(result);
					}
					else{
						proceed(result);	
					}				
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			else{
				proceed(param1);
			}
			watch.stop();
			logger.info(thisJoinPoint.getSourceLocation().getFileName() + "_" + 
				thisJoinPoint.getSourceLocation().getLine() + "," + watch.getElapsedTime());			
			return null;
		}

		pointcut sqlInjection_prepareStatementFunctionMultiParam(String param1, int param2, int param3) : 
			call(* *.prepareStatement(String, int, int)) && 
			(within(*..SchemaBootstrap)) && 
			args(param1, param2, param3);
			
		Object around(String param1, int param2, int param3) : sqlInjection_prepareStatementFunctionMultiParam(param1, param2, param3){
			watch.start();
			if(fixes.containsKey(thisJoinPoint.getSourceLocation().getFileName() + "_" + 
				thisJoinPoint.getSourceLocation().getLine())){
				try{
					String result = ThesisUtil.doSQLInjectionFix(logger, param1, fixes.get(thisJoinPoint.getSourceLocation().getFileName() + "_" + 
						thisJoinPoint.getSourceLocation().getLine()));
					if(result.contains("VALIDATION_FAILURE")){
						logger.info(result);
					}
					else{
						proceed(result, param2, param3);	
					}				
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			else{
				proceed(param1, param2, param3);
			}
			watch.stop();
			logger.info(thisJoinPoint.getSourceLocation().getFileName() + "_" + 
				thisJoinPoint.getSourceLocation().getLine() + "," + watch.getElapsedTime());			
			return null;
		}

		pointcut sqlInjection_prepareStatementFunctionTwoParamIntArray(String param1, int param2) : 
			call(* *.prepareStatement(String, int)) && 
			(within(*..SchemaBootstrap)) && 
			args(param1, param2);
			
		Object around(String param1, int param2) : sqlInjection_prepareStatementFunctionTwoParamIntArray(param1, param2){
			watch.start();
			if(fixes.containsKey(thisJoinPoint.getSourceLocation().getFileName() + "_" + 
				thisJoinPoint.getSourceLocation().getLine())){
				try{
					String result = ThesisUtil.doSQLInjectionFix(logger, param1, fixes.get(thisJoinPoint.getSourceLocation().getFileName() + "_" + 
						thisJoinPoint.getSourceLocation().getLine()));
					if(result.contains("VALIDATION_FAILURE")){
						logger.info(result);
					}
					else{
						proceed(result, param2);	
					}				
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			else{
				proceed(param1, param2);
			}
			watch.stop();
			logger.info(thisJoinPoint.getSourceLocation().getFileName() + "_" + 
				thisJoinPoint.getSourceLocation().getLine() + "," + watch.getElapsedTime());			
			return null;
		}

		pointcut sqlInjection_prepareStatementFunctionTwoParam(String param1, int[] param2) : 
			call(* *.prepareStatement(String, int[])) && 
			(within(*..SchemaBootstrap)) && 
			args(param1, param2);
			
		Object around(String param1, int[] param2) : sqlInjection_prepareStatementFunctionTwoParam(param1, param2){
			watch.start();
			if(fixes.containsKey(thisJoinPoint.getSourceLocation().getFileName() + "_" + 
				thisJoinPoint.getSourceLocation().getLine())){
				try{
					String result = ThesisUtil.doSQLInjectionFix(logger, param1, fixes.get(thisJoinPoint.getSourceLocation().getFileName() + "_" + 
						thisJoinPoint.getSourceLocation().getLine()));
					if(result.contains("VALIDATION_FAILURE")){
						logger.info(result);
					}
					else{
						proceed(result, param2);	
					}				
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			else{
				proceed(param1, param2);
			}
			watch.stop();
			logger.info(thisJoinPoint.getSourceLocation().getFileName() + "_" + 
				thisJoinPoint.getSourceLocation().getLine() + "," + watch.getElapsedTime());			
			return null;
		}

		pointcut sqlInjection_generalExecuteFunction(String param1) : 
			call(* *.execute(String)) && 
			(within(*..SchemaBootstrap)) && 
			args(param1);
			
		Object around(String param1) : sqlInjection_generalExecuteFunction(param1){
			watch.start();
			if(fixes.containsKey(thisJoinPoint.getSourceLocation().getFileName() + "_" + 
				thisJoinPoint.getSourceLocation().getLine())){
				try{
					String result = ThesisUtil.doSQLInjectionFix(logger, param1, fixes.get(thisJoinPoint.getSourceLocation().getFileName() + "_" + 
						thisJoinPoint.getSourceLocation().getLine()));
					if(result.contains("VALIDATION_FAILURE")){
						logger.info(result);
					}
					else{
						proceed(result);	
					}				
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			else{
				proceed(param1);
			}
			watch.stop();
			logger.info(thisJoinPoint.getSourceLocation().getFileName() + "_" + 
				thisJoinPoint.getSourceLocation().getLine() + "," + watch.getElapsedTime());			
			return null;
		}
} 
