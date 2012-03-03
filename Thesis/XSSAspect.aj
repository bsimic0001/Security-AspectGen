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
	Logger logger; 
	StopWatch watch; 
	 
	public XSSAspect(){ 
		PropertyConfigurator.configure("log4j.properties"); 
		logger = Logger.getRootLogger(); 
		logger.info("XSS Aspect Created!"); 
		watch = new StopWatch(); 
		 
		fixes.put("SecureImageProvider.java_71", "URL-ENCODING");
		fixes.put("SimpleUploaderServlet.java_144", "CREDIT-CARD-VALIDATION");
		fixes.put("CustomConnectorServlet.java_271", "JAVASCRIPT-ENCODING");
		fixes.put("CustomConnectorServlet.java_307", "ALPHA-NUMERIC-WHITELIST");
		fixes.put("ItemImageDAO.java_38", "SSN-WHITELIST");
		fixes.put("SimpleUploaderServlet.java_93", "URL-ENCODING");
		fixes.put("SimpleUploaderServlet.java_71", "ALPHA-NUMERIC-WHITELIST");
		fixes.put("AdminBean.java_76", "HTML-ATTRIBUTE-ENCODING");
		fixes.put("SiteDAO.java_50", "DO-NOTHING");
		fixes.put("ImageProvider.java_58", "CREDIT-CARD-VALIDATION");
		fixes.put("AdminBean.java_74", "CSS-ENCODING");
		fixes.put("ContentImageDAO.java_38", "HTML-ATTRIBUTE-ENCODING");
	} 
	 

		pointcut xss_writeFunction(String param1) : 
			call(* *.write(String)) && 
			(within(fredck.FCKeditor.connector.CustomConnectorServlet) || 
			within(jada.dao.ContentImageDAO) || 
			within(jada.service.SecureImageProvider) || 
			within(jada.dao.SiteDAO) || 
			within(jada.admin.AdminBean) || 
			within(fredck.FCKeditor.uploader.SimpleUploaderServlet) || 
			within(jada.dao.ItemImageDAO) || 
			within(jada.service.ImageProvider)) && 
			args(param1);
			
		Object around(String param1) : xss_writeFunction(param1){
			watch.start();
			if(fixes.containsKey(thisJoinPoint.getSourceLocation().getFileName() + "_" + 
				thisJoinPoint.getSourceLocation().getLine())){
				
				try{
					proceed(ThesisUtil.doXSSFix(param1, fixes.get(thisJoinPoint.getSourceLocation().getFileName() + "_" + 
						thisJoinPoint.getSourceLocation().getLine())));	
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

		pointcut xss_writeByteArrayFunction(byte[] param1) : 
			call(* *.write(byte[])) && 
			(within(fredck.FCKeditor.connector.CustomConnectorServlet) || 
			within(jada.dao.ContentImageDAO) || 
			within(jada.service.SecureImageProvider) || 
			within(jada.dao.SiteDAO) || 
			within(jada.admin.AdminBean) || 
			within(fredck.FCKeditor.uploader.SimpleUploaderServlet) || 
			within(jada.dao.ItemImageDAO) || 
			within(jada.service.ImageProvider)) && 
			args(param1);
			
		Object around(byte[] param1) : xss_writeByteArrayFunction(param1){
			watch.start();
			if(fixes.containsKey(thisJoinPoint.getSourceLocation().getFileName() + "_" + 
				thisJoinPoint.getSourceLocation().getLine())){
				
				try{
					proceed(ThesisUtil.doXSSFix(param1, fixes.get(thisJoinPoint.getSourceLocation().getFileName() + "_" + 
						thisJoinPoint.getSourceLocation().getLine())));	
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

		pointcut xss_printFunction(String param1) : 
			call(* *.print(String)) && 
			(within(fredck.FCKeditor.connector.CustomConnectorServlet) || 
			within(jada.dao.ContentImageDAO) || 
			within(jada.service.SecureImageProvider) || 
			within(jada.dao.SiteDAO) || 
			within(jada.admin.AdminBean) || 
			within(fredck.FCKeditor.uploader.SimpleUploaderServlet) || 
			within(jada.dao.ItemImageDAO) || 
			within(jada.service.ImageProvider)) && 
			args(param1);
			
		Object around(String param1) : xss_printFunction(param1){
			watch.start();
			if(fixes.containsKey(thisJoinPoint.getSourceLocation().getFileName() + "_" + 
				thisJoinPoint.getSourceLocation().getLine())){
				
				try{
					proceed(ThesisUtil.doXSSFix(param1, fixes.get(thisJoinPoint.getSourceLocation().getFileName() + "_" + 
						thisJoinPoint.getSourceLocation().getLine())));	
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

		pointcut xss_printlnFunction(String param1) : 
			call(* *.println(String)) && 
			(within(fredck.FCKeditor.connector.CustomConnectorServlet) || 
			within(jada.dao.ContentImageDAO) || 
			within(jada.service.SecureImageProvider) || 
			within(jada.dao.SiteDAO) || 
			within(jada.admin.AdminBean) || 
			within(fredck.FCKeditor.uploader.SimpleUploaderServlet) || 
			within(jada.dao.ItemImageDAO) || 
			within(jada.service.ImageProvider)) && 
			args(param1);
			
		Object around(String param1) : xss_printlnFunction(param1){
			watch.start();
			if(fixes.containsKey(thisJoinPoint.getSourceLocation().getFileName() + "_" + 
				thisJoinPoint.getSourceLocation().getLine())){
				
				try{
					proceed(ThesisUtil.doXSSFix(param1, fixes.get(thisJoinPoint.getSourceLocation().getFileName() + "_" + 
						thisJoinPoint.getSourceLocation().getLine())));	
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

		pointcut xss_sendErrorFunction(String param2) : 
			call(* *.sendError(.., String)) && 
			(within(fredck.FCKeditor.connector.CustomConnectorServlet) || 
			within(jada.dao.ContentImageDAO) || 
			within(jada.service.SecureImageProvider) || 
			within(jada.dao.SiteDAO) || 
			within(jada.admin.AdminBean) || 
			within(fredck.FCKeditor.uploader.SimpleUploaderServlet) || 
			within(jada.dao.ItemImageDAO) || 
			within(jada.service.ImageProvider)) && 
			args(param2);
			
		Object around(String param2) : xss_sendErrorFunction(param2){
			watch.start();
			if(fixes.containsKey(thisJoinPoint.getSourceLocation().getFileName() + "_" + 
				thisJoinPoint.getSourceLocation().getLine())){
				
				try{
					proceed(ThesisUtil.doXSSFix(param2, fixes.get(thisJoinPoint.getSourceLocation().getFileName() + "_" + 
						thisJoinPoint.getSourceLocation().getLine())));	
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			} 
			else{
				proceed(param2);
			}
			watch.stop();
			logger.info(thisJoinPoint.getSourceLocation().getFileName() + "_" + 
				thisJoinPoint.getSourceLocation().getLine() + "," + watch.getElapsedTime());			
						
			return null;
		}

		pointcut xss_getParameterFunction(String param1) : 
			call(* *.getParameter(String)) && 
			(within(fredck.FCKeditor.connector.CustomConnectorServlet) || 
			within(jada.dao.ContentImageDAO) || 
			within(jada.service.SecureImageProvider) || 
			within(jada.dao.SiteDAO) || 
			within(jada.admin.AdminBean) || 
			within(fredck.FCKeditor.uploader.SimpleUploaderServlet) || 
			within(jada.dao.ItemImageDAO) || 
			within(jada.service.ImageProvider)) && 
			args(param1);
			
		Object around(String param1) : xss_getParameterFunction(param1){
			watch.start();
			if(fixes.containsKey(thisJoinPoint.getSourceLocation().getFileName() + "_" + 
				thisJoinPoint.getSourceLocation().getLine())){
				
				try{
					proceed(ThesisUtil.doXSSFix(param1, fixes.get(thisJoinPoint.getSourceLocation().getFileName() + "_" + 
						thisJoinPoint.getSourceLocation().getLine())));	
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

		pointcut xss_setAttributeFunction(String param2) : 
			call(* *.setAttribute(.., String)) && 
			(within(fredck.FCKeditor.connector.CustomConnectorServlet) || 
			within(jada.dao.ContentImageDAO) || 
			within(jada.service.SecureImageProvider) || 
			within(jada.dao.SiteDAO) || 
			within(jada.admin.AdminBean) || 
			within(fredck.FCKeditor.uploader.SimpleUploaderServlet) || 
			within(jada.dao.ItemImageDAO) || 
			within(jada.service.ImageProvider)) && 
			args(param2);
			
		Object around(String param2) : xss_setAttributeFunction(param2){
			watch.start();
			if(fixes.containsKey(thisJoinPoint.getSourceLocation().getFileName() + "_" + 
				thisJoinPoint.getSourceLocation().getLine())){
				
				try{
					proceed(ThesisUtil.doXSSFix(param2, fixes.get(thisJoinPoint.getSourceLocation().getFileName() + "_" + 
						thisJoinPoint.getSourceLocation().getLine())));	
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			} 
			else{
				proceed(param2);
			}
			watch.stop();
			logger.info(thisJoinPoint.getSourceLocation().getFileName() + "_" + 
				thisJoinPoint.getSourceLocation().getLine() + "," + watch.getElapsedTime());			
						
			return null;
		}
} 
