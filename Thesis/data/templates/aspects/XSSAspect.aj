//writing pointcut 

pointcut xss_writeFunction(String param1) : 
	execution(* * write(String)) && (within(fredck.FCKeditor.connector.CustomConnectorServlet.java) || within(fredck.FCKeditor.connector.CustomConnectorServlet.java) || within(jada.dao.ContentImageDAO.java) || within(jada.service.SecureImageProvider.java) || within(jada.dao.SiteDAO.java) || within(jada.service.SecureImageProvider.java) || within(jada.admin.AdminBean.java) || within(fredck.FCKeditor.uploader.SimpleUploaderServlet.java) || within(jada.dao.ItemImageDAO.java) || within(jada.service.SecureImageProvider.java) || within(jada.dao.SiteDAO.java) || within(jada.service.ImageProvider.java) || within(jada.dao.ItemImageDAO.java) || within(jada.service.ImageProvider.java) || within(jada.dao.ContentImageDAO.java) || within(jada.service.ImageProvider.java) || within(jada.admin.AdminBean.java) || within(fredck.FCKeditor.uploader.SimpleUploaderServlet.java) || within(fredck.FCKeditor.uploader.SimpleUploaderServlet.java) || within(fredck.FCKeditor.uploader.SimpleUploaderServlet.java) || within(fredck.FCKeditor.uploader.SimpleUploaderServlet.java) || within(fredck.FCKeditor.uploader.SimpleUploaderServlet.java)) && args(null);
	
before(String param1) : xss_writeFunction(null){
	advice logic
}
//writing pointcut 

pointcut xss_writeByteArrayFunction(byte[] param1) : 
	execution(* * write(byte[])) && (within(fredck.FCKeditor.connector.CustomConnectorServlet.java) || within(fredck.FCKeditor.connector.CustomConnectorServlet.java) || within(jada.dao.ContentImageDAO.java) || within(jada.service.SecureImageProvider.java) || within(jada.dao.SiteDAO.java) || within(jada.service.SecureImageProvider.java) || within(jada.admin.AdminBean.java) || within(fredck.FCKeditor.uploader.SimpleUploaderServlet.java) || within(jada.dao.ItemImageDAO.java) || within(jada.service.SecureImageProvider.java) || within(jada.dao.SiteDAO.java) || within(jada.service.ImageProvider.java) || within(jada.dao.ItemImageDAO.java) || within(jada.service.ImageProvider.java) || within(jada.dao.ContentImageDAO.java) || within(jada.service.ImageProvider.java) || within(jada.admin.AdminBean.java) || within(fredck.FCKeditor.uploader.SimpleUploaderServlet.java) || within(fredck.FCKeditor.uploader.SimpleUploaderServlet.java) || within(fredck.FCKeditor.uploader.SimpleUploaderServlet.java) || within(fredck.FCKeditor.uploader.SimpleUploaderServlet.java) || within(fredck.FCKeditor.uploader.SimpleUploaderServlet.java)) && args(null);
	
before(byte[] param1) : xss_writeByteArrayFunction(null){
	advice logic
}
//writing pointcut 

pointcut xss_printFunction(String param1) : 
	execution(* * print(String)) && (within(fredck.FCKeditor.connector.CustomConnectorServlet.java) || within(fredck.FCKeditor.connector.CustomConnectorServlet.java) || within(jada.dao.ContentImageDAO.java) || within(jada.service.SecureImageProvider.java) || within(jada.dao.SiteDAO.java) || within(jada.service.SecureImageProvider.java) || within(jada.admin.AdminBean.java) || within(fredck.FCKeditor.uploader.SimpleUploaderServlet.java) || within(jada.dao.ItemImageDAO.java) || within(jada.service.SecureImageProvider.java) || within(jada.dao.SiteDAO.java) || within(jada.service.ImageProvider.java) || within(jada.dao.ItemImageDAO.java) || within(jada.service.ImageProvider.java) || within(jada.dao.ContentImageDAO.java) || within(jada.service.ImageProvider.java) || within(jada.admin.AdminBean.java) || within(fredck.FCKeditor.uploader.SimpleUploaderServlet.java) || within(fredck.FCKeditor.uploader.SimpleUploaderServlet.java) || within(fredck.FCKeditor.uploader.SimpleUploaderServlet.java) || within(fredck.FCKeditor.uploader.SimpleUploaderServlet.java) || within(fredck.FCKeditor.uploader.SimpleUploaderServlet.java)) && args(null);
	
before(String param1) : xss_printFunction(null){
	advice logic
}
//writing pointcut 

pointcut xss_printlnFunction(String param1) : 
	execution(* * println(String)) && (within(fredck.FCKeditor.connector.CustomConnectorServlet.java) || within(fredck.FCKeditor.connector.CustomConnectorServlet.java) || within(jada.dao.ContentImageDAO.java) || within(jada.service.SecureImageProvider.java) || within(jada.dao.SiteDAO.java) || within(jada.service.SecureImageProvider.java) || within(jada.admin.AdminBean.java) || within(fredck.FCKeditor.uploader.SimpleUploaderServlet.java) || within(jada.dao.ItemImageDAO.java) || within(jada.service.SecureImageProvider.java) || within(jada.dao.SiteDAO.java) || within(jada.service.ImageProvider.java) || within(jada.dao.ItemImageDAO.java) || within(jada.service.ImageProvider.java) || within(jada.dao.ContentImageDAO.java) || within(jada.service.ImageProvider.java) || within(jada.admin.AdminBean.java) || within(fredck.FCKeditor.uploader.SimpleUploaderServlet.java) || within(fredck.FCKeditor.uploader.SimpleUploaderServlet.java) || within(fredck.FCKeditor.uploader.SimpleUploaderServlet.java) || within(fredck.FCKeditor.uploader.SimpleUploaderServlet.java) || within(fredck.FCKeditor.uploader.SimpleUploaderServlet.java)) && args(null);
	
before(String param1) : xss_printlnFunction(null){
	advice logic
}
//writing pointcut 

pointcut xss_sendErrorFunction(String param2) : 
	execution(* * sendError(.., String)) && (within(fredck.FCKeditor.connector.CustomConnectorServlet.java) || within(fredck.FCKeditor.connector.CustomConnectorServlet.java) || within(jada.dao.ContentImageDAO.java) || within(jada.service.SecureImageProvider.java) || within(jada.dao.SiteDAO.java) || within(jada.service.SecureImageProvider.java) || within(jada.admin.AdminBean.java) || within(fredck.FCKeditor.uploader.SimpleUploaderServlet.java) || within(jada.dao.ItemImageDAO.java) || within(jada.service.SecureImageProvider.java) || within(jada.dao.SiteDAO.java) || within(jada.service.ImageProvider.java) || within(jada.dao.ItemImageDAO.java) || within(jada.service.ImageProvider.java) || within(jada.dao.ContentImageDAO.java) || within(jada.service.ImageProvider.java) || within(jada.admin.AdminBean.java) || within(fredck.FCKeditor.uploader.SimpleUploaderServlet.java) || within(fredck.FCKeditor.uploader.SimpleUploaderServlet.java) || within(fredck.FCKeditor.uploader.SimpleUploaderServlet.java) || within(fredck.FCKeditor.uploader.SimpleUploaderServlet.java) || within(fredck.FCKeditor.uploader.SimpleUploaderServlet.java)) && args(null);
	
before(String param2) : xss_sendErrorFunction(null){
	advice logic
}
//writing pointcut 

pointcut xss_getParameterFunction(String param1) : 
	execution(* * getParameter(String)) && (within(fredck.FCKeditor.connector.CustomConnectorServlet.java) || within(fredck.FCKeditor.connector.CustomConnectorServlet.java) || within(jada.dao.ContentImageDAO.java) || within(jada.service.SecureImageProvider.java) || within(jada.dao.SiteDAO.java) || within(jada.service.SecureImageProvider.java) || within(jada.admin.AdminBean.java) || within(fredck.FCKeditor.uploader.SimpleUploaderServlet.java) || within(jada.dao.ItemImageDAO.java) || within(jada.service.SecureImageProvider.java) || within(jada.dao.SiteDAO.java) || within(jada.service.ImageProvider.java) || within(jada.dao.ItemImageDAO.java) || within(jada.service.ImageProvider.java) || within(jada.dao.ContentImageDAO.java) || within(jada.service.ImageProvider.java) || within(jada.admin.AdminBean.java) || within(fredck.FCKeditor.uploader.SimpleUploaderServlet.java) || within(fredck.FCKeditor.uploader.SimpleUploaderServlet.java) || within(fredck.FCKeditor.uploader.SimpleUploaderServlet.java) || within(fredck.FCKeditor.uploader.SimpleUploaderServlet.java) || within(fredck.FCKeditor.uploader.SimpleUploaderServlet.java)) && args(null);
	
before(String param1) : xss_getParameterFunction(null){
	advice logic
}
//writing pointcut 

pointcut xss_setAttributeFunction(String param2) : 
	execution(* * setAttribute(.., String)) && (within(fredck.FCKeditor.connector.CustomConnectorServlet.java) || within(fredck.FCKeditor.connector.CustomConnectorServlet.java) || within(jada.dao.ContentImageDAO.java) || within(jada.service.SecureImageProvider.java) || within(jada.dao.SiteDAO.java) || within(jada.service.SecureImageProvider.java) || within(jada.admin.AdminBean.java) || within(fredck.FCKeditor.uploader.SimpleUploaderServlet.java) || within(jada.dao.ItemImageDAO.java) || within(jada.service.SecureImageProvider.java) || within(jada.dao.SiteDAO.java) || within(jada.service.ImageProvider.java) || within(jada.dao.ItemImageDAO.java) || within(jada.service.ImageProvider.java) || within(jada.dao.ContentImageDAO.java) || within(jada.service.ImageProvider.java) || within(jada.admin.AdminBean.java) || within(fredck.FCKeditor.uploader.SimpleUploaderServlet.java) || within(fredck.FCKeditor.uploader.SimpleUploaderServlet.java) || within(fredck.FCKeditor.uploader.SimpleUploaderServlet.java) || within(fredck.FCKeditor.uploader.SimpleUploaderServlet.java) || within(fredck.FCKeditor.uploader.SimpleUploaderServlet.java)) && args(null);
	
before(String param2) : xss_setAttributeFunction(null){
	advice logic
}
