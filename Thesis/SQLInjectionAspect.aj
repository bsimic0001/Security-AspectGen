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
		 
		fixes.put("DOS_Login.java_134", "SQL-ENCODE-MYSQL");
		fixes.put("CreateDB.java_1007", "SQL-ENCODE-ORACLE");
		fixes.put("ViewProfile.java_161", "SQL-ENCODE-ORACLE");
		fixes.put("ThreadSafetyProblem.java_98", "SQL-ENCODE-MYSQL");
		fixes.put("Login.java_205", "SQL-ENCODE-ORACLE");
		fixes.put("Login.java_202", "SQL-ENCODE-ORACLE");
		fixes.put("MaliciousFileExecution.java_302", "SQL-ENCODE-MYSQL");
		fixes.put("ListStaff.java_130", "SQL-ENCODE-ORACLE");
		fixes.put("Controller.java_58", "SQL-ENCODE-ORACLE");
		fixes.put("ViewProfile.java_115", "SQL-ENCODE-MYSQL");
		fixes.put("ViewProfile.java_157", "SQL-ENCODE-ORACLE");
		fixes.put("DOS_Login.java_122", "SQL-ENCODE-MYSQL");
		fixes.put("Challenge2Screen.java_221", "SQL-ENCODE-ORACLE");
		fixes.put("UpdateProfile.java_178", "SQL-ENCODE-ORACLE");
		fixes.put("DOS_Login.java_126", "SQL-ENCODE-ORACLE");
		fixes.put("ParameterParser.java_674", "SQL-ENCODE-MYSQL");
		fixes.put("UpdateProfile.java_232", "SQL-ENCODE-MYSQL");
		fixes.put("BlindStringSqlInjection.java_114", "SQL-ENCODE-MYSQL");
		fixes.put("BackDoors.java_180", "SQL-ENCODE-ORACLE");
		fixes.put("Login.java_166", "SQL-ENCODE-ORACLE");
		fixes.put("ParameterParser.java_615", "SQL-ENCODE-ORACLE");
		fixes.put("ViewProfile_i.java_69", "SQL-ENCODE-MYSQL");
		fixes.put("MaliciousFileExecution.java_463", "SQL-ENCODE-ORACLE");
		fixes.put("UpdateProfile.java_183", "SQL-ENCODE-ORACLE");
		fixes.put("SqlStringInjection.java_101", "SQL-ENCODE-ORACLE");
		fixes.put("UpdateProfile.java_279", "SQL-ENCODE-MYSQL");
		fixes.put("ViewProfile_i.java_88", "SQL-ENCODE-MYSQL");
		fixes.put("Login.java_127", "SQL-ENCODE-ORACLE");
		fixes.put("BackDoors.java_148", "SQL-ENCODE-ORACLE");
		fixes.put("EditProfile_i.java_56", "SQL-ENCODE-ORACLE");
		fixes.put("SqlNumericInjection.java_119", "SQL-ENCODE-ORACLE");
		fixes.put("DeleteProfile_i.java_35", "SQL-ENCODE-ORACLE");
		fixes.put("ViewProfile.java_108", "SQL-ENCODE-MYSQL");
		fixes.put("BackDoors.java_141", "SQL-ENCODE-ORACLE");
		fixes.put("ViewProfile.java_145", "SQL-ENCODE-ORACLE");
		fixes.put("MaliciousFileExecution.java_421", "SQL-ENCODE-ORACLE");
		fixes.put("ViewDatabase.java_82", "SQL-ENCODE-MYSQL");
		fixes.put("DefaultLessonAction.java_252", "SQL-ENCODE-MYSQL");
		fixes.put("UpdateProfile_i.java_100", "SQL-ENCODE-ORACLE");
		fixes.put("MaliciousFileExecution.java_471", "SQL-ENCODE-ORACLE");
		fixes.put("ListStaff.java_87", "SQL-ENCODE-MYSQL");
		fixes.put("ListStaff.java_89", "SQL-ENCODE-MYSQL");
		fixes.put("BlindNumericSqlInjection.java_114", "SQL-ENCODE-ORACLE");
		fixes.put("EditProfile.java_85", "SQL-ENCODE-ORACLE");
		fixes.put("DeleteProfile.java_127", "SQL-ENCODE-ORACLE");
		fixes.put("SqlModifyData.java_108", "SQL-ENCODE-ORACLE");
		fixes.put("DOS_Login.java_146", "SQL-ENCODE-MYSQL");
		fixes.put("WsSqlInjection.java_233", "SQL-ENCODE-ORACLE");
		fixes.put("MaliciousFileExecution.java_150", "SQL-ENCODE-ORACLE");
		fixes.put("ViewProfile.java_94", "SQL-ENCODE-MYSQL");
		fixes.put("EditProfile.java_87", "SQL-ENCODE-MYSQL");
		fixes.put("SqlAddData.java_100", "SQL-ENCODE-ORACLE");
		fixes.put("DOS_Login.java_106", "SQL-ENCODE-MYSQL");
		fixes.put("UpdateProfile.java_321", "SQL-ENCODE-ORACLE");
		fixes.put("AbstractLesson.java_638", "SQL-ENCODE-MYSQL");
		fixes.put("Login.java_131", "SQL-ENCODE-ORACLE");
		fixes.put("Challenge2Screen.java_793", "SQL-ENCODE-MYSQL");
		fixes.put("ViewProfile.java_97", "SQL-ENCODE-ORACLE");
		fixes.put("HammerHead.java_174", "SQL-ENCODE-MYSQL");
	} 
	 

		pointcut sqlInjection_createSQLQueryFunction(String param1) : 
			call(* *.createSQLQuery(String)) && 
			(within(*..ParameterParser) || 
			within(*..SqlAddData) || 
			within(*..BlindNumericSqlInjection) || 
			within(*..EditProfile) || 
			within(*..ViewProfile) || 
			within(*..Login) || 
			within(*..UpdateProfile) || 
			within(*..MaliciousFileExecution) || 
			within(*..BlindStringSqlInjection) || 
			within(*..ViewDatabase) || 
			within(*..DOS_Login) || 
			within(*..DefaultLessonAction) || 
			within(*..ViewProfile_i) || 
			within(*..BackDoors) || 
			within(*..SqlModifyData) || 
			within(*..ListStaff) || 
			within(*..EditProfile_i) || 
			within(*..SqlStringInjection) || 
			within(*..DeleteProfile_i) || 
			within(*..WsSqlInjection) || 
			within(*..CreateDB) || 
			within(*..Challenge2Screen) || 
			within(*..UpdateProfile_i) || 
			within(*..SqlNumericInjection) || 
			within(*..HammerHead) || 
			within(*..AbstractLesson) || 
			within(*..ThreadSafetyProblem) || 
			within(*..Controller)) && 
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
						return proceed(result);	
					}				
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

		pointcut sqlInjection_executeUpdateFunction(String param1) : 
			call(* *.executeUpdate(String)) && 
			(within(*..ParameterParser) || 
			within(*..SqlAddData) || 
			within(*..BlindNumericSqlInjection) || 
			within(*..EditProfile) || 
			within(*..ViewProfile) || 
			within(*..Login) || 
			within(*..UpdateProfile) || 
			within(*..MaliciousFileExecution) || 
			within(*..BlindStringSqlInjection) || 
			within(*..ViewDatabase) || 
			within(*..DOS_Login) || 
			within(*..DefaultLessonAction) || 
			within(*..ViewProfile_i) || 
			within(*..BackDoors) || 
			within(*..SqlModifyData) || 
			within(*..ListStaff) || 
			within(*..EditProfile_i) || 
			within(*..SqlStringInjection) || 
			within(*..DeleteProfile_i) || 
			within(*..WsSqlInjection) || 
			within(*..CreateDB) || 
			within(*..Challenge2Screen) || 
			within(*..UpdateProfile_i) || 
			within(*..SqlNumericInjection) || 
			within(*..HammerHead) || 
			within(*..AbstractLesson) || 
			within(*..ThreadSafetyProblem) || 
			within(*..Controller)) && 
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
						return proceed(result);	
					}				
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

		pointcut sqlInjection_executeQueryFunction(String param1) : 
			call(* *.executeQuery(String)) && 
			(within(*..ParameterParser) || 
			within(*..SqlAddData) || 
			within(*..BlindNumericSqlInjection) || 
			within(*..EditProfile) || 
			within(*..ViewProfile) || 
			within(*..Login) || 
			within(*..UpdateProfile) || 
			within(*..MaliciousFileExecution) || 
			within(*..BlindStringSqlInjection) || 
			within(*..ViewDatabase) || 
			within(*..DOS_Login) || 
			within(*..DefaultLessonAction) || 
			within(*..ViewProfile_i) || 
			within(*..BackDoors) || 
			within(*..SqlModifyData) || 
			within(*..ListStaff) || 
			within(*..EditProfile_i) || 
			within(*..SqlStringInjection) || 
			within(*..DeleteProfile_i) || 
			within(*..WsSqlInjection) || 
			within(*..CreateDB) || 
			within(*..Challenge2Screen) || 
			within(*..UpdateProfile_i) || 
			within(*..SqlNumericInjection) || 
			within(*..HammerHead) || 
			within(*..AbstractLesson) || 
			within(*..ThreadSafetyProblem) || 
			within(*..Controller)) && 
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
						return proceed(result);	
					}				
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

		pointcut sqlInjection_createQueryFunction(String param1) : 
			call(* *.createQuery(String)) && 
			(within(*..ParameterParser) || 
			within(*..SqlAddData) || 
			within(*..BlindNumericSqlInjection) || 
			within(*..EditProfile) || 
			within(*..ViewProfile) || 
			within(*..Login) || 
			within(*..UpdateProfile) || 
			within(*..MaliciousFileExecution) || 
			within(*..BlindStringSqlInjection) || 
			within(*..ViewDatabase) || 
			within(*..DOS_Login) || 
			within(*..DefaultLessonAction) || 
			within(*..ViewProfile_i) || 
			within(*..BackDoors) || 
			within(*..SqlModifyData) || 
			within(*..ListStaff) || 
			within(*..EditProfile_i) || 
			within(*..SqlStringInjection) || 
			within(*..DeleteProfile_i) || 
			within(*..WsSqlInjection) || 
			within(*..CreateDB) || 
			within(*..Challenge2Screen) || 
			within(*..UpdateProfile_i) || 
			within(*..SqlNumericInjection) || 
			within(*..HammerHead) || 
			within(*..AbstractLesson) || 
			within(*..ThreadSafetyProblem) || 
			within(*..Controller)) && 
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
						return proceed(result);	
					}				
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

		pointcut sqlInjection_prepareStatementFunction(String param1) : 
			call(* *.prepareStatement(String)) && 
			(within(*..ParameterParser) || 
			within(*..SqlAddData) || 
			within(*..BlindNumericSqlInjection) || 
			within(*..EditProfile) || 
			within(*..ViewProfile) || 
			within(*..Login) || 
			within(*..UpdateProfile) || 
			within(*..MaliciousFileExecution) || 
			within(*..BlindStringSqlInjection) || 
			within(*..ViewDatabase) || 
			within(*..DOS_Login) || 
			within(*..DefaultLessonAction) || 
			within(*..ViewProfile_i) || 
			within(*..BackDoors) || 
			within(*..SqlModifyData) || 
			within(*..ListStaff) || 
			within(*..EditProfile_i) || 
			within(*..SqlStringInjection) || 
			within(*..DeleteProfile_i) || 
			within(*..WsSqlInjection) || 
			within(*..CreateDB) || 
			within(*..Challenge2Screen) || 
			within(*..UpdateProfile_i) || 
			within(*..SqlNumericInjection) || 
			within(*..HammerHead) || 
			within(*..AbstractLesson) || 
			within(*..ThreadSafetyProblem) || 
			within(*..Controller)) && 
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
						return proceed(result);	
					}				
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

		pointcut sqlInjection_prepareStatementFunctionMultiParam(String param1, int param2, int param3) : 
			call(* *.prepareStatement(String, int, int)) && 
			(within(*..ParameterParser) || 
			within(*..SqlAddData) || 
			within(*..BlindNumericSqlInjection) || 
			within(*..EditProfile) || 
			within(*..ViewProfile) || 
			within(*..Login) || 
			within(*..UpdateProfile) || 
			within(*..MaliciousFileExecution) || 
			within(*..BlindStringSqlInjection) || 
			within(*..ViewDatabase) || 
			within(*..DOS_Login) || 
			within(*..DefaultLessonAction) || 
			within(*..ViewProfile_i) || 
			within(*..BackDoors) || 
			within(*..SqlModifyData) || 
			within(*..ListStaff) || 
			within(*..EditProfile_i) || 
			within(*..SqlStringInjection) || 
			within(*..DeleteProfile_i) || 
			within(*..WsSqlInjection) || 
			within(*..CreateDB) || 
			within(*..Challenge2Screen) || 
			within(*..UpdateProfile_i) || 
			within(*..SqlNumericInjection) || 
			within(*..HammerHead) || 
			within(*..AbstractLesson) || 
			within(*..ThreadSafetyProblem) || 
			within(*..Controller)) && 
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
						return proceed(result, param2, param3);	
					}				
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

		pointcut sqlInjection_prepareStatementFunctionTwoParamIntArray(String param1, int param2) : 
			call(* *.prepareStatement(String, int)) && 
			(within(*..ParameterParser) || 
			within(*..SqlAddData) || 
			within(*..BlindNumericSqlInjection) || 
			within(*..EditProfile) || 
			within(*..ViewProfile) || 
			within(*..Login) || 
			within(*..UpdateProfile) || 
			within(*..MaliciousFileExecution) || 
			within(*..BlindStringSqlInjection) || 
			within(*..ViewDatabase) || 
			within(*..DOS_Login) || 
			within(*..DefaultLessonAction) || 
			within(*..ViewProfile_i) || 
			within(*..BackDoors) || 
			within(*..SqlModifyData) || 
			within(*..ListStaff) || 
			within(*..EditProfile_i) || 
			within(*..SqlStringInjection) || 
			within(*..DeleteProfile_i) || 
			within(*..WsSqlInjection) || 
			within(*..CreateDB) || 
			within(*..Challenge2Screen) || 
			within(*..UpdateProfile_i) || 
			within(*..SqlNumericInjection) || 
			within(*..HammerHead) || 
			within(*..AbstractLesson) || 
			within(*..ThreadSafetyProblem) || 
			within(*..Controller)) && 
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
						return proceed(result, param2);	
					}				
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			else{
				return proceed(param1, param2);
			}
			watch.stop();
			logger.info(thisJoinPoint.getSourceLocation().getFileName() + "_" + 
				thisJoinPoint.getSourceLocation().getLine() + "," + watch.getElapsedTime());			
			return proceed(param1, param2);
		}

		pointcut sqlInjection_prepareStatementFunctionTwoParam(String param1, int[] param2) : 
			call(* *.prepareStatement(String, int[])) && 
			(within(*..ParameterParser) || 
			within(*..SqlAddData) || 
			within(*..BlindNumericSqlInjection) || 
			within(*..EditProfile) || 
			within(*..ViewProfile) || 
			within(*..Login) || 
			within(*..UpdateProfile) || 
			within(*..MaliciousFileExecution) || 
			within(*..BlindStringSqlInjection) || 
			within(*..ViewDatabase) || 
			within(*..DOS_Login) || 
			within(*..DefaultLessonAction) || 
			within(*..ViewProfile_i) || 
			within(*..BackDoors) || 
			within(*..SqlModifyData) || 
			within(*..ListStaff) || 
			within(*..EditProfile_i) || 
			within(*..SqlStringInjection) || 
			within(*..DeleteProfile_i) || 
			within(*..WsSqlInjection) || 
			within(*..CreateDB) || 
			within(*..Challenge2Screen) || 
			within(*..UpdateProfile_i) || 
			within(*..SqlNumericInjection) || 
			within(*..HammerHead) || 
			within(*..AbstractLesson) || 
			within(*..ThreadSafetyProblem) || 
			within(*..Controller)) && 
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
						return proceed(result, param2);	
					}				
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			else{
				return proceed(param1, param2);
			}
			watch.stop();
			logger.info(thisJoinPoint.getSourceLocation().getFileName() + "_" + 
				thisJoinPoint.getSourceLocation().getLine() + "," + watch.getElapsedTime());			
			return proceed(param1, param2);
		}

		pointcut sqlInjection_generalExecuteFunction(String param1) : 
			call(* *.execute(String)) && 
			(within(*..ParameterParser) || 
			within(*..SqlAddData) || 
			within(*..BlindNumericSqlInjection) || 
			within(*..EditProfile) || 
			within(*..ViewProfile) || 
			within(*..Login) || 
			within(*..UpdateProfile) || 
			within(*..MaliciousFileExecution) || 
			within(*..BlindStringSqlInjection) || 
			within(*..ViewDatabase) || 
			within(*..DOS_Login) || 
			within(*..DefaultLessonAction) || 
			within(*..ViewProfile_i) || 
			within(*..BackDoors) || 
			within(*..SqlModifyData) || 
			within(*..ListStaff) || 
			within(*..EditProfile_i) || 
			within(*..SqlStringInjection) || 
			within(*..DeleteProfile_i) || 
			within(*..WsSqlInjection) || 
			within(*..CreateDB) || 
			within(*..Challenge2Screen) || 
			within(*..UpdateProfile_i) || 
			within(*..SqlNumericInjection) || 
			within(*..HammerHead) || 
			within(*..AbstractLesson) || 
			within(*..ThreadSafetyProblem) || 
			within(*..Controller)) && 
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
						return proceed(result);	
					}				
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
} 
