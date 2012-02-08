package com.aspects; 
import com.thesis.aop.util.ThesisUtil; 
 
public aspect XSSAspect{ 
	public HashMap<String, String> fixes = new HashMap<String, String>(); 
	public XSSAspect{ 
		fixes.put("SecureImageProvider.java_71", "URL-ENCODING");
		fixes.put("SimpleUploaderServlet.java_144", "ALPHA-WHITELIST");
		fixes.put("CustomConnectorServlet.java_271", "CSS-ENCODING");
		fixes.put("CustomConnectorServlet.java_307", "HTML-ENCODING");
		fixes.put("ItemImageDAO.java_38", "EMAIL-WHITELIST");
		fixes.put("SimpleUploaderServlet.java_93", "DO-NOTHING");
		fixes.put("SimpleUploaderServlet.java_71", "SSN-WHITELIST");
		fixes.put("AdminBean.java_76", "IP-ADDRESS-WHITELIST");
		fixes.put("SiteDAO.java_50", "CREDIT-CARD-VALIDATION");
		fixes.put("ImageProvider.java_58", "ZIP-CODE-WHITELIST");
		fixes.put("AdminBean.java_74", "ALPHA-NUMERIC-WHITELIST");
		fixes.put("ContentImageDAO.java_38", "HTML-ATTRIBUTE-ENCODING");
	} 
	 

		pointcut xss_writeFunction(String param1) : 
			execution(* * write(String)) && 
			(within(fredck.FCKeditor.connector.CustomConnectorServlet) || 
			within(fredck.FCKeditor.connector.CustomConnectorServlet) || 
			within(jada.dao.ContentImageDAO) || 
			within(jada.service.SecureImageProvider) || 
			within(jada.dao.SiteDAO) || 
			within(jada.service.SecureImageProvider) || 
			within(jada.admin.AdminBean) || 
			within(fredck.FCKeditor.uploader.SimpleUploaderServlet) || 
			within(jada.dao.ItemImageDAO) || 
			within(jada.service.SecureImageProvider) || 
			within(jada.dao.SiteDAO) || 
			within(jada.service.ImageProvider) || 
			within(jada.dao.ItemImageDAO) || 
			within(jada.service.ImageProvider) || 
			within(jada.dao.ContentImageDAO) || 
			within(jada.service.ImageProvider) || 
			within(jada.admin.AdminBean) || 
			within(fredck.FCKeditor.uploader.SimpleUploaderServlet) || 
			within(fredck.FCKeditor.uploader.SimpleUploaderServlet) || 
			within(fredck.FCKeditor.uploader.SimpleUploaderServlet) || 
			within(fredck.FCKeditor.uploader.SimpleUploaderServlet) || 
			within(fredck.FCKeditor.uploader.SimpleUploaderServlet)) && 
			args(param1);
			
		Object around(String param1) : xss_writeFunction(param1){
			if(fixes.containsKey(thisJoinPoint.getSourceLocation().getFileName() + "_" + 
				thisJoinPoint.getSourceLocation().getLine()){
				proceed(ThesisUtil.doXSSFix(param1, fixes.get(thisJoinPoint.getSourceLocation().getFileName() + "_" + 
					thisJoinPoint.getSourceLocation().getLine())));	
			}
			else{
				proceed(..);
			}			
			return null;
		}

		pointcut xss_writeByteArrayFunction(byte[] param1) : 
			execution(* * write(byte[])) && 
			(within(fredck.FCKeditor.connector.CustomConnectorServlet) || 
			within(fredck.FCKeditor.connector.CustomConnectorServlet) || 
			within(jada.dao.ContentImageDAO) || 
			within(jada.service.SecureImageProvider) || 
			within(jada.dao.SiteDAO) || 
			within(jada.service.SecureImageProvider) || 
			within(jada.admin.AdminBean) || 
			within(fredck.FCKeditor.uploader.SimpleUploaderServlet) || 
			within(jada.dao.ItemImageDAO) || 
			within(jada.service.SecureImageProvider) || 
			within(jada.dao.SiteDAO) || 
			within(jada.service.ImageProvider) || 
			within(jada.dao.ItemImageDAO) || 
			within(jada.service.ImageProvider) || 
			within(jada.dao.ContentImageDAO) || 
			within(jada.service.ImageProvider) || 
			within(jada.admin.AdminBean) || 
			within(fredck.FCKeditor.uploader.SimpleUploaderServlet) || 
			within(fredck.FCKeditor.uploader.SimpleUploaderServlet) || 
			within(fredck.FCKeditor.uploader.SimpleUploaderServlet) || 
			within(fredck.FCKeditor.uploader.SimpleUploaderServlet) || 
			within(fredck.FCKeditor.uploader.SimpleUploaderServlet)) && 
			args(param1);
			
		Object around(byte[] param1) : xss_writeByteArrayFunction(param1){
			if(fixes.containsKey(thisJoinPoint.getSourceLocation().getFileName() + "_" + 
				thisJoinPoint.getSourceLocation().getLine()){
				proceed(ThesisUtil.doXSSFix(param1, fixes.get(thisJoinPoint.getSourceLocation().getFileName() + "_" + 
					thisJoinPoint.getSourceLocation().getLine())));	
			}
			else{
				proceed(..);
			}			
			return null;
		}

		pointcut xss_printFunction(String param1) : 
			execution(* * print(String)) && 
			(within(fredck.FCKeditor.connector.CustomConnectorServlet) || 
			within(fredck.FCKeditor.connector.CustomConnectorServlet) || 
			within(jada.dao.ContentImageDAO) || 
			within(jada.service.SecureImageProvider) || 
			within(jada.dao.SiteDAO) || 
			within(jada.service.SecureImageProvider) || 
			within(jada.admin.AdminBean) || 
			within(fredck.FCKeditor.uploader.SimpleUploaderServlet) || 
			within(jada.dao.ItemImageDAO) || 
			within(jada.service.SecureImageProvider) || 
			within(jada.dao.SiteDAO) || 
			within(jada.service.ImageProvider) || 
			within(jada.dao.ItemImageDAO) || 
			within(jada.service.ImageProvider) || 
			within(jada.dao.ContentImageDAO) || 
			within(jada.service.ImageProvider) || 
			within(jada.admin.AdminBean) || 
			within(fredck.FCKeditor.uploader.SimpleUploaderServlet) || 
			within(fredck.FCKeditor.uploader.SimpleUploaderServlet) || 
			within(fredck.FCKeditor.uploader.SimpleUploaderServlet) || 
			within(fredck.FCKeditor.uploader.SimpleUploaderServlet) || 
			within(fredck.FCKeditor.uploader.SimpleUploaderServlet)) && 
			args(param1);
			
		Object around(String param1) : xss_printFunction(param1){
			if(fixes.containsKey(thisJoinPoint.getSourceLocation().getFileName() + "_" + 
				thisJoinPoint.getSourceLocation().getLine()){
				proceed(ThesisUtil.doXSSFix(param1, fixes.get(thisJoinPoint.getSourceLocation().getFileName() + "_" + 
					thisJoinPoint.getSourceLocation().getLine())));	
			}
			else{
				proceed(..);
			}			
			return null;
		}

		pointcut xss_printlnFunction(String param1) : 
			execution(* * println(String)) && 
			(within(fredck.FCKeditor.connector.CustomConnectorServlet) || 
			within(fredck.FCKeditor.connector.CustomConnectorServlet) || 
			within(jada.dao.ContentImageDAO) || 
			within(jada.service.SecureImageProvider) || 
			within(jada.dao.SiteDAO) || 
			within(jada.service.SecureImageProvider) || 
			within(jada.admin.AdminBean) || 
			within(fredck.FCKeditor.uploader.SimpleUploaderServlet) || 
			within(jada.dao.ItemImageDAO) || 
			within(jada.service.SecureImageProvider) || 
			within(jada.dao.SiteDAO) || 
			within(jada.service.ImageProvider) || 
			within(jada.dao.ItemImageDAO) || 
			within(jada.service.ImageProvider) || 
			within(jada.dao.ContentImageDAO) || 
			within(jada.service.ImageProvider) || 
			within(jada.admin.AdminBean) || 
			within(fredck.FCKeditor.uploader.SimpleUploaderServlet) || 
			within(fredck.FCKeditor.uploader.SimpleUploaderServlet) || 
			within(fredck.FCKeditor.uploader.SimpleUploaderServlet) || 
			within(fredck.FCKeditor.uploader.SimpleUploaderServlet) || 
			within(fredck.FCKeditor.uploader.SimpleUploaderServlet)) && 
			args(param1);
			
		Object around(String param1) : xss_printlnFunction(param1){
			if(fixes.containsKey(thisJoinPoint.getSourceLocation().getFileName() + "_" + 
				thisJoinPoint.getSourceLocation().getLine()){
				proceed(ThesisUtil.doXSSFix(param1, fixes.get(thisJoinPoint.getSourceLocation().getFileName() + "_" + 
					thisJoinPoint.getSourceLocation().getLine())));	
			}
			else{
				proceed(..);
			}			
			return null;
		}

		pointcut xss_sendErrorFunction(String param2) : 
			execution(* * sendError(.., String)) && 
			(within(fredck.FCKeditor.connector.CustomConnectorServlet) || 
			within(fredck.FCKeditor.connector.CustomConnectorServlet) || 
			within(jada.dao.ContentImageDAO) || 
			within(jada.service.SecureImageProvider) || 
			within(jada.dao.SiteDAO) || 
			within(jada.service.SecureImageProvider) || 
			within(jada.admin.AdminBean) || 
			within(fredck.FCKeditor.uploader.SimpleUploaderServlet) || 
			within(jada.dao.ItemImageDAO) || 
			within(jada.service.SecureImageProvider) || 
			within(jada.dao.SiteDAO) || 
			within(jada.service.ImageProvider) || 
			within(jada.dao.ItemImageDAO) || 
			within(jada.service.ImageProvider) || 
			within(jada.dao.ContentImageDAO) || 
			within(jada.service.ImageProvider) || 
			within(jada.admin.AdminBean) || 
			within(fredck.FCKeditor.uploader.SimpleUploaderServlet) || 
			within(fredck.FCKeditor.uploader.SimpleUploaderServlet) || 
			within(fredck.FCKeditor.uploader.SimpleUploaderServlet) || 
			within(fredck.FCKeditor.uploader.SimpleUploaderServlet) || 
			within(fredck.FCKeditor.uploader.SimpleUploaderServlet)) && 
			args(param2);
			
		Object around(String param2) : xss_sendErrorFunction(param2){
			if(fixes.containsKey(thisJoinPoint.getSourceLocation().getFileName() + "_" + 
				thisJoinPoint.getSourceLocation().getLine()){
				proceed(ThesisUtil.doXSSFix(param2, fixes.get(thisJoinPoint.getSourceLocation().getFileName() + "_" + 
					thisJoinPoint.getSourceLocation().getLine())));	
			}
			else{
				proceed(..);
			}			
			return null;
		}

		pointcut xss_getParameterFunction(String param1) : 
			execution(* * getParameter(String)) && 
			(within(fredck.FCKeditor.connector.CustomConnectorServlet) || 
			within(fredck.FCKeditor.connector.CustomConnectorServlet) || 
			within(jada.dao.ContentImageDAO) || 
			within(jada.service.SecureImageProvider) || 
			within(jada.dao.SiteDAO) || 
			within(jada.service.SecureImageProvider) || 
			within(jada.admin.AdminBean) || 
			within(fredck.FCKeditor.uploader.SimpleUploaderServlet) || 
			within(jada.dao.ItemImageDAO) || 
			within(jada.service.SecureImageProvider) || 
			within(jada.dao.SiteDAO) || 
			within(jada.service.ImageProvider) || 
			within(jada.dao.ItemImageDAO) || 
			within(jada.service.ImageProvider) || 
			within(jada.dao.ContentImageDAO) || 
			within(jada.service.ImageProvider) || 
			within(jada.admin.AdminBean) || 
			within(fredck.FCKeditor.uploader.SimpleUploaderServlet) || 
			within(fredck.FCKeditor.uploader.SimpleUploaderServlet) || 
			within(fredck.FCKeditor.uploader.SimpleUploaderServlet) || 
			within(fredck.FCKeditor.uploader.SimpleUploaderServlet) || 
			within(fredck.FCKeditor.uploader.SimpleUploaderServlet)) && 
			args(param1);
			
		Object around(String param1) : xss_getParameterFunction(param1){
			if(fixes.containsKey(thisJoinPoint.getSourceLocation().getFileName() + "_" + 
				thisJoinPoint.getSourceLocation().getLine()){
				proceed(ThesisUtil.doXSSFix(param1, fixes.get(thisJoinPoint.getSourceLocation().getFileName() + "_" + 
					thisJoinPoint.getSourceLocation().getLine())));	
			}
			else{
				proceed(..);
			}			
			return null;
		}

		pointcut xss_setAttributeFunction(String param2) : 
			execution(* * setAttribute(.., String)) && 
			(within(fredck.FCKeditor.connector.CustomConnectorServlet) || 
			within(fredck.FCKeditor.connector.CustomConnectorServlet) || 
			within(jada.dao.ContentImageDAO) || 
			within(jada.service.SecureImageProvider) || 
			within(jada.dao.SiteDAO) || 
			within(jada.service.SecureImageProvider) || 
			within(jada.admin.AdminBean) || 
			within(fredck.FCKeditor.uploader.SimpleUploaderServlet) || 
			within(jada.dao.ItemImageDAO) || 
			within(jada.service.SecureImageProvider) || 
			within(jada.dao.SiteDAO) || 
			within(jada.service.ImageProvider) || 
			within(jada.dao.ItemImageDAO) || 
			within(jada.service.ImageProvider) || 
			within(jada.dao.ContentImageDAO) || 
			within(jada.service.ImageProvider) || 
			within(jada.admin.AdminBean) || 
			within(fredck.FCKeditor.uploader.SimpleUploaderServlet) || 
			within(fredck.FCKeditor.uploader.SimpleUploaderServlet) || 
			within(fredck.FCKeditor.uploader.SimpleUploaderServlet) || 
			within(fredck.FCKeditor.uploader.SimpleUploaderServlet) || 
			within(fredck.FCKeditor.uploader.SimpleUploaderServlet)) && 
			args(param2);
			
		Object around(String param2) : xss_setAttributeFunction(param2){
			if(fixes.containsKey(thisJoinPoint.getSourceLocation().getFileName() + "_" + 
				thisJoinPoint.getSourceLocation().getLine()){
				proceed(ThesisUtil.doXSSFix(param2, fixes.get(thisJoinPoint.getSourceLocation().getFileName() + "_" + 
					thisJoinPoint.getSourceLocation().getLine())));	
			}
			else{
				proceed(..);
			}			
			return null;
		}
} 
