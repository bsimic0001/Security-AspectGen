//writing pointcut 

pointcut xss_writeFunction(String param1) : 
	execution(* * write(String)) && (within(fredck.FCKeditor.connector.CustomConnectorServlet.java) || within(fredck.FCKeditor.connector.CustomConnectorServlet.java) || within(jada.dao.ContentImageDAO.java) || within(jada.service.SecureImageProvider.java) || within(jada.dao.SiteDAO.java) || within(jada.service.SecureImageProvider.java) || within(jada.admin.AdminBean.java) || within(fredck.FCKeditor.uploader.SimpleUploaderServlet.java) || within(jada.dao.ItemImageDAO.java) || within(jada.service.SecureImageProvider.java) || within(jada.dao.SiteDAO.java) || within(jada.service.ImageProvider.java) || within(jada.dao.ItemImageDAO.java) || within(jada.service.ImageProvider.java) || within(jada.dao.ContentImageDAO.java) || within(jada.service.ImageProvider.java) || within(jada.admin.AdminBean.java) || within(fredck.FCKeditor.uploader.SimpleUploaderServlet.java) || within(fredck.FCKeditor.uploader.SimpleUploaderServlet.java) || within(fredck.FCKeditor.uploader.SimpleUploaderServlet.java) || within(fredck.FCKeditor.uploader.SimpleUploaderServlet.java) || within(fredck.FCKeditor.uploader.SimpleUploaderServlet.java)) && args(param1);
	
before(String param1) : xss_writeFunction(param1){
	advice logic
}
//writing pointcut 

pointcut xss_writeByteArrayFunction(byte[] param1) : 
	execution(* * write(byte[])) && (within(fredck.FCKeditor.connector.CustomConnectorServlet.java) || within(fredck.FCKeditor.connector.CustomConnectorServlet.java) || within(jada.dao.ContentImageDAO.java) || within(jada.service.SecureImageProvider.java) || within(jada.dao.SiteDAO.java) || within(jada.service.SecureImageProvider.java) || within(jada.admin.AdminBean.java) || within(fredck.FCKeditor.uploader.SimpleUploaderServlet.java) || within(jada.dao.ItemImageDAO.java) || within(jada.service.SecureImageProvider.java) || within(jada.dao.SiteDAO.java) || within(jada.service.ImageProvider.java) || within(jada.dao.ItemImageDAO.java) || within(jada.service.ImageProvider.java) || within(jada.dao.ContentImageDAO.java) || within(jada.service.ImageProvider.java) || within(jada.admin.AdminBean.java) || within(fredck.FCKeditor.uploader.SimpleUploaderServlet.java) || within(fredck.FCKeditor.uploader.SimpleUploaderServlet.java) || within(fredck.FCKeditor.uploader.SimpleUploaderServlet.java) || within(fredck.FCKeditor.uploader.SimpleUploaderServlet.java) || within(fredck.FCKeditor.uploader.SimpleUploaderServlet.java)) && args(param1);
	
before(byte[] param1) : xss_writeByteArrayFunction(param1){
	advice logic
}
//writing pointcut 

pointcut xss_printFunction(String param1) : 
	execution(* * print(String)) && (within(fredck.FCKeditor.connector.CustomConnectorServlet.java) || within(fredck.FCKeditor.connector.CustomConnectorServlet.java) || within(jada.dao.ContentImageDAO.java) || within(jada.service.SecureImageProvider.java) || within(jada.dao.SiteDAO.java) || within(jada.service.SecureImageProvider.java) || within(jada.admin.AdminBean.java) || within(fredck.FCKeditor.uploader.SimpleUploaderServlet.java) || within(jada.dao.ItemImageDAO.java) || within(jada.service.SecureImageProvider.java) || within(jada.dao.SiteDAO.java) || within(jada.service.ImageProvider.java) || within(jada.dao.ItemImageDAO.java) || within(jada.service.ImageProvider.java) || within(jada.dao.ContentImageDAO.java) || within(jada.service.ImageProvider.java) || within(jada.admin.AdminBean.java) || within(fredck.FCKeditor.uploader.SimpleUploaderServlet.java) || within(fredck.FCKeditor.uploader.SimpleUploaderServlet.java) || within(fredck.FCKeditor.uploader.SimpleUploaderServlet.java) || within(fredck.FCKeditor.uploader.SimpleUploaderServlet.java) || within(fredck.FCKeditor.uploader.SimpleUploaderServlet.java)) && args(param1);
	
before(String param1) : xss_printFunction(param1){
	advice logic
}
//writing pointcut 

pointcut xss_printlnFunction(String param1) : 
	execution(* * println(String)) && (within(fredck.FCKeditor.connector.CustomConnectorServlet.java) || within(fredck.FCKeditor.connector.CustomConnectorServlet.java) || within(jada.dao.ContentImageDAO.java) || within(jada.service.SecureImageProvider.java) || within(jada.dao.SiteDAO.java) || within(jada.service.SecureImageProvider.java) || within(jada.admin.AdminBean.java) || within(fredck.FCKeditor.uploader.SimpleUploaderServlet.java) || within(jada.dao.ItemImageDAO.java) || within(jada.service.SecureImageProvider.java) || within(jada.dao.SiteDAO.java) || within(jada.service.ImageProvider.java) || within(jada.dao.ItemImageDAO.java) || within(jada.service.ImageProvider.java) || within(jada.dao.ContentImageDAO.java) || within(jada.service.ImageProvider.java) || within(jada.admin.AdminBean.java) || within(fredck.FCKeditor.uploader.SimpleUploaderServlet.java) || within(fredck.FCKeditor.uploader.SimpleUploaderServlet.java) || within(fredck.FCKeditor.uploader.SimpleUploaderServlet.java) || within(fredck.FCKeditor.uploader.SimpleUploaderServlet.java) || within(fredck.FCKeditor.uploader.SimpleUploaderServlet.java)) && args(param1);
	
before(String param1) : xss_printlnFunction(param1){
	advice logic
}
//writing pointcut 

pointcut xss_sendErrorFunction(String param2) : 
	execution(* * sendError(.., String)) && (within(fredck.FCKeditor.connector.CustomConnectorServlet.java) || within(fredck.FCKeditor.connector.CustomConnectorServlet.java) || within(jada.dao.ContentImageDAO.java) || within(jada.service.SecureImageProvider.java) || within(jada.dao.SiteDAO.java) || within(jada.service.SecureImageProvider.java) || within(jada.admin.AdminBean.java) || within(fredck.FCKeditor.uploader.SimpleUploaderServlet.java) || within(jada.dao.ItemImageDAO.java) || within(jada.service.SecureImageProvider.java) || within(jada.dao.SiteDAO.java) || within(jada.service.ImageProvider.java) || within(jada.dao.ItemImageDAO.java) || within(jada.service.ImageProvider.java) || within(jada.dao.ContentImageDAO.java) || within(jada.service.ImageProvider.java) || within(jada.admin.AdminBean.java) || within(fredck.FCKeditor.uploader.SimpleUploaderServlet.java) || within(fredck.FCKeditor.uploader.SimpleUploaderServlet.java) || within(fredck.FCKeditor.uploader.SimpleUploaderServlet.java) || within(fredck.FCKeditor.uploader.SimpleUploaderServlet.java) || within(fredck.FCKeditor.uploader.SimpleUploaderServlet.java)) && args(param2);
	
before(String param2) : xss_sendErrorFunction(param2){
	advice logic
}
//writing pointcut 

pointcut xss_getParameterFunction(String param1) : 
	execution(* * getParameter(String)) && (within(fredck.FCKeditor.connector.CustomConnectorServlet.java) || within(fredck.FCKeditor.connector.CustomConnectorServlet.java) || within(jada.dao.ContentImageDAO.java) || within(jada.service.SecureImageProvider.java) || within(jada.dao.SiteDAO.java) || within(jada.service.SecureImageProvider.java) || within(jada.admin.AdminBean.java) || within(fredck.FCKeditor.uploader.SimpleUploaderServlet.java) || within(jada.dao.ItemImageDAO.java) || within(jada.service.SecureImageProvider.java) || within(jada.dao.SiteDAO.java) || within(jada.service.ImageProvider.java) || within(jada.dao.ItemImageDAO.java) || within(jada.service.ImageProvider.java) || within(jada.dao.ContentImageDAO.java) || within(jada.service.ImageProvider.java) || within(jada.admin.AdminBean.java) || within(fredck.FCKeditor.uploader.SimpleUploaderServlet.java) || within(fredck.FCKeditor.uploader.SimpleUploaderServlet.java) || within(fredck.FCKeditor.uploader.SimpleUploaderServlet.java) || within(fredck.FCKeditor.uploader.SimpleUploaderServlet.java) || within(fredck.FCKeditor.uploader.SimpleUploaderServlet.java)) && args(param1);
	
before(String param1) : xss_getParameterFunction(param1){
	advice logic
}
//writing pointcut 

pointcut xss_setAttributeFunction(String param2) : 
	execution(* * setAttribute(.., String)) && (within(fredck.FCKeditor.connector.CustomConnectorServlet.java) || within(fredck.FCKeditor.connector.CustomConnectorServlet.java) || within(jada.dao.ContentImageDAO.java) || within(jada.service.SecureImageProvider.java) || within(jada.dao.SiteDAO.java) || within(jada.service.SecureImageProvider.java) || within(jada.admin.AdminBean.java) || within(fredck.FCKeditor.uploader.SimpleUploaderServlet.java) || within(jada.dao.ItemImageDAO.java) || within(jada.service.SecureImageProvider.java) || within(jada.dao.SiteDAO.java) || within(jada.service.ImageProvider.java) || within(jada.dao.ItemImageDAO.java) || within(jada.service.ImageProvider.java) || within(jada.dao.ContentImageDAO.java) || within(jada.service.ImageProvider.java) || within(jada.admin.AdminBean.java) || within(fredck.FCKeditor.uploader.SimpleUploaderServlet.java) || within(fredck.FCKeditor.uploader.SimpleUploaderServlet.java) || within(fredck.FCKeditor.uploader.SimpleUploaderServlet.java) || within(fredck.FCKeditor.uploader.SimpleUploaderServlet.java) || within(fredck.FCKeditor.uploader.SimpleUploaderServlet.java)) && args(param2);
	
before(String param2) : xss_setAttributeFunction(param2){
	advice logic
}
