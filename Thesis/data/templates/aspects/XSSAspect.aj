package com.aspects; 
 
public aspect XSSAspect{ 
//writing pointcut 

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
			
		before(String param1) : xss_writeFunction(param1){
			advice logic
		}
//writing pointcut 

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
			
		before(byte[] param1) : xss_writeByteArrayFunction(param1){
			advice logic
		}
//writing pointcut 

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
			
		before(String param1) : xss_printFunction(param1){
			advice logic
		}
//writing pointcut 

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
			
		before(String param1) : xss_printlnFunction(param1){
			advice logic
		}
//writing pointcut 

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
			
		before(String param2) : xss_sendErrorFunction(param2){
			advice logic
		}
//writing pointcut 

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
			
		before(String param1) : xss_getParameterFunction(param1){
			advice logic
		}
//writing pointcut 

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
			
		before(String param2) : xss_setAttributeFunction(param2){
			advice logic
		}
} 
