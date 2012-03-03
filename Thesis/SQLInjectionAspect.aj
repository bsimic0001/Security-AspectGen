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
		logger = Logger.getRootLogger(); 
		logger.info("SQL Injection Aspect Created"); 
		watch = new StopWatch(); 
		 
		fixes.put("SectionDAO.java_30", "SQL-ENCODE-ORACLE");
		fixes.put("ShippingMethodDAO.java_30", "SQL-ENCODE-MYSQL");
		fixes.put("TaxMaintAction.java_126", "SQL-ENCODE-ORACLE");
		fixes.put("ItemMaintAction.java_308", "SQL-ENCODE-MYSQL");
		fixes.put("ItemListingAction.java_243", "SQL-ENCODE-MYSQL");
		fixes.put("ContactUsMaintAction.java_115", "SQL-ENCODE-ORACLE");
		fixes.put("SiteMaintAction.java_137", "SQL-ENCODE-ORACLE");
		fixes.put("ItemMaintAction.java_301", "SQL-ENCODE-MYSQL");
		fixes.put("TaxDAO.java_30", "SQL-ENCODE-ORACLE");
		fixes.put("CustomerMaintAction.java_94", "SQL-ENCODE-ORACLE");
		fixes.put("TemplateDAO.java_48", "SQL-ENCODE-ORACLE");
		fixes.put("ContentMaintAction.java_722", "SQL-ENCODE-MYSQL");
		fixes.put("OrderEngine.java_358", "SQL-ENCODE-MYSQL");
		fixes.put("ItemListingAction.java_238", "SQL-ENCODE-ORACLE");
		fixes.put("PollListingAction.java_169", "SQL-ENCODE-MYSQL");
		fixes.put("OrderEngine.java_355", "SQL-ENCODE-ORACLE");
		fixes.put("CountryDAO.java_33", "SQL-ENCODE-ORACLE");
		fixes.put("SiteLoader.java_193", "SQL-ENCODE-ORACLE");
		fixes.put("DatabaseLoadAction.java_199", "SQL-ENCODE-ORACLE");
		fixes.put("ContentMaintAction.java_596", "SQL-ENCODE-MYSQL");
		fixes.put("TemplateListingAction.java_183", "SQL-ENCODE-ORACLE");
		fixes.put("ShippingRegionMaintAction.java_121", "SQL-ENCODE-MYSQL");
		fixes.put("SiteLoader.java_199", "SQL-ENCODE-MYSQL");
		fixes.put("DatabaseLoadAction.java_240", "SQL-ENCODE-ORACLE");
		fixes.put("ShippingRegionDAO.java_30", "SQL-ENCODE-ORACLE");
		fixes.put("ContactUsListingAction.java_147", "SQL-ENCODE-ORACLE");
		fixes.put("UserDAO.java_38", "SQL-ENCODE-ORACLE");
		fixes.put("PollHeaderDAO.java_34", "SQL-ENCODE-ORACLE");
		fixes.put("ShippingRegionListingAction.java_166", "SQL-ENCODE-ORACLE");
		fixes.put("ItemMaintAction.java_265", "SQL-ENCODE-ORACLE");
		fixes.put("ShippingRegionListingAction.java_168", "SQL-ENCODE-ORACLE");
		fixes.put("MenuMaintAction1.java_525", "SQL-ENCODE-ORACLE");
		fixes.put("ItemListingAction.java_268", "SQL-ENCODE-MYSQL");
		fixes.put("CreditHeaderDAO.java_30", "SQL-ENCODE-ORACLE");
		fixes.put("ShippingTypeMaintAction.java_110", "SQL-ENCODE-MYSQL");
		fixes.put("DatabaseLoadAction.java_217", "SQL-ENCODE-ORACLE");
		fixes.put("OrderListingAction.java_195", "SQL-ENCODE-MYSQL");
		fixes.put("ItemDAO.java_33", "SQL-ENCODE-MYSQL");
		fixes.put("ShippingTypeMaintAction.java_108", "SQL-ENCODE-MYSQL");
		fixes.put("ShippingTypeMaintAction.java_107", "SQL-ENCODE-ORACLE");
		fixes.put("ContentMaintAction.java_601", "SQL-ENCODE-MYSQL");
		fixes.put("CountryMaintAction.java_111", "SQL-ENCODE-MYSQL");
		fixes.put("ShippingTypeListingAction.java_149", "SQL-ENCODE-ORACLE");
		fixes.put("SiteDAO.java_44", "SQL-ENCODE-ORACLE");
		fixes.put("ItemMaintAction.java_296", "SQL-ENCODE-MYSQL");
		fixes.put("ShippingTypeListingAction.java_147", "SQL-ENCODE-MYSQL");
		fixes.put("ShippingTypeListingAction.java_146", "SQL-ENCODE-ORACLE");
		fixes.put("ShippingTypeDAO.java_30", "SQL-ENCODE-ORACLE");
		fixes.put("DatabaseLoadAction.java_179", "SQL-ENCODE-MYSQL");
		fixes.put("ContentMaintAction.java_254", "SQL-ENCODE-ORACLE");
		fixes.put("SiteListingAction.java_169", "SQL-ENCODE-MYSQL");
		fixes.put("ShippingMethodMaintAction.java_160", "SQL-ENCODE-MYSQL");
		fixes.put("ItemListingAction.java_250", "SQL-ENCODE-ORACLE");
		fixes.put("ItemMaintAction.java_890", "SQL-ENCODE-MYSQL");
		fixes.put("OrderHeaderDAO.java_30", "SQL-ENCODE-MYSQL");
		fixes.put("CountryMaintAction.java_205", "SQL-ENCODE-ORACLE");
		fixes.put("SyndicationDAO.java_34", "SQL-ENCODE-MYSQL");
		fixes.put("SiteLoader.java_166", "SQL-ENCODE-ORACLE");
		fixes.put("SiteLoader.java_162", "SQL-ENCODE-ORACLE");
		fixes.put("ContentDAO.java_33", "SQL-ENCODE-MYSQL");
		fixes.put("ContentListingAction.java_100", "SQL-ENCODE-ORACLE");
		fixes.put("HomePageMaintAction.java_97", "SQL-ENCODE-ORACLE");
		fixes.put("ContentBean.java_62", "SQL-ENCODE-ORACLE");
		fixes.put("ItemMaintAction.java_750", "SQL-ENCODE-ORACLE");
		fixes.put("SiteMaintAction.java_242", "SQL-ENCODE-MYSQL");
		fixes.put("StateDAO.java_33", "SQL-ENCODE-MYSQL");
		fixes.put("ItemImageDAO.java_30", "SQL-ENCODE-MYSQL");
		fixes.put("Installer.java_107", "SQL-ENCODE-MYSQL");
		fixes.put("SiteLoader.java_151", "SQL-ENCODE-MYSQL");
		fixes.put("SiteLoader.java_208", "SQL-ENCODE-ORACLE");
		fixes.put("MenuMaintAction.java_426", "SQL-ENCODE-MYSQL");
		fixes.put("SiteLoader.java_202", "SQL-ENCODE-ORACLE");
		fixes.put("ContentMaintAction.java_242", "SQL-ENCODE-MYSQL");
		fixes.put("ContentMaintAction.java_247", "SQL-ENCODE-MYSQL");
		fixes.put("ContentImageDAO.java_30", "SQL-ENCODE-MYSQL");
		fixes.put("ContactUsDAO.java_30", "SQL-ENCODE-ORACLE");
		fixes.put("PollMaintAction.java_136", "SQL-ENCODE-MYSQL");
		fixes.put("ItemMaintAction.java_745", "SQL-ENCODE-MYSQL");
		fixes.put("SectionMaintAction1.java_347", "SQL-ENCODE-ORACLE");
		fixes.put("ContentApi.java_609", "SQL-ENCODE-MYSQL");
		fixes.put("TaxListingAction.java_145", "SQL-ENCODE-MYSQL");
		fixes.put("ContentListingAction.java_223", "SQL-ENCODE-ORACLE");
		fixes.put("CustomerDAO.java_39", "SQL-ENCODE-ORACLE");
		fixes.put("ItemListingAction.java_107", "SQL-ENCODE-MYSQL");
		fixes.put("TemplateMaintAction.java_305", "SQL-ENCODE-MYSQL");
		fixes.put("SiteLoader.java_181", "SQL-ENCODE-MYSQL");
		fixes.put("SiteLoader.java_184", "SQL-ENCODE-MYSQL");
		fixes.put("SyndicationMaintAction.java_122", "SQL-ENCODE-ORACLE");
		fixes.put("CountryListingAction.java_123", "SQL-ENCODE-ORACLE");
		fixes.put("SiteLoader.java_190", "SQL-ENCODE-ORACLE");
		fixes.put("SiteLoader.java_211", "SQL-ENCODE-MYSQL");
		fixes.put("ContentMaintAction.java_210", "SQL-ENCODE-MYSQL");
		fixes.put("ContentListingAction.java_230", "SQL-ENCODE-ORACLE");
		fixes.put("SiteLoader.java_125", "SQL-ENCODE-MYSQL");
		fixes.put("SectionMaintAction.java_439", "SQL-ENCODE-MYSQL");
		fixes.put("OrderMaintAction.java_117", "SQL-ENCODE-ORACLE");
		fixes.put("MenuDAO.java_30", "SQL-ENCODE-MYSQL");
		fixes.put("PollMaintAction.java_297", "SQL-ENCODE-MYSQL");
		fixes.put("Utility.java_1010", "SQL-ENCODE-ORACLE");
		fixes.put("UserListingAction.java_138", "SQL-ENCODE-MYSQL");
		fixes.put("SiteLoader.java_172", "SQL-ENCODE-ORACLE");
		fixes.put("ShippingMethodListingAction.java_110", "SQL-ENCODE-MYSQL");
		fixes.put("CustomerListingAction.java_131", "SQL-ENCODE-MYSQL");
		fixes.put("ContentListingAction.java_218", "SQL-ENCODE-MYSQL");
		fixes.put("SiteLoader.java_175", "SQL-ENCODE-ORACLE");
		fixes.put("Utility.java_1015", "SQL-ENCODE-ORACLE");
		fixes.put("AdminBean.java_76", "SQL-ENCODE-MYSQL");
		fixes.put("UserMaintAction.java_129", "SQL-ENCODE-ORACLE");
		fixes.put("OrderEngine.java_348", "SQL-ENCODE-ORACLE");
		fixes.put("AdminBean.java_74", "SQL-ENCODE-MYSQL");
	} 
	 

		pointcut sqlInjection_createSQLQueryFunction(String param1) : 
			call(* *.createSQLQuery(String)) && 
			(within(jada.dao.CountryDAO) || 
			within(jada.admin.country.CountryMaintAction) || 
			within(jada.dao.TaxDAO) || 
			within(jada.admin.tax.TaxMaintAction) || 
			within(jada.dao.ContentDAO) || 
			within(jada.admin.content.ContentListingAction) || 
			within(jada.admin.item.ItemMaintAction) || 
			within(jada.dao.ShippingMethodDAO) || 
			within(jada.admin.shipping.ShippingMethodListingAction) || 
			within(jada.dao.SyndicationDAO) || 
			within(jada.admin.syndication.SyndicationMaintAction) || 
			within(jada.install.process.Installer) || 
			within(jada.dao.MenuDAO) || 
			within(jada.admin.menu.MenuMaintAction) || 
			within(jada.dao.PollHeaderDAO) || 
			within(jada.admin.poll.PollMaintAction) || 
			within(jada.dao.CustomerDAO) || 
			within(jada.admin.customer.CustomerListingAction) || 
			within(jada.dao.SiteDAO) || 
			within(jada.admin.site.SiteListingAction) || 
			within(jada.admin.content.ContentMaintAction) || 
			within(jada.admin.customer.CustomerMaintAction) || 
			within(jada.dao.ContactUsDAO) || 
			within(jada.admin.contactus.ContactUsListingAction) || 
			within(jada.install.process.DatabaseLoadAction) || 
			within(jada.util.Utility) || 
			within(jada.dao.ShippingTypeDAO) || 
			within(jada.admin.shipping.ShippingTypeMaintAction) || 
			within(jada.dao.ItemImageDAO) || 
			within(jada.admin.shipping.ShippingTypeListingAction) || 
			within(jada.content.ContentBean) || 
			within(jada.content.data.ContentApi) || 
			within(jada.dao.StateDAO) || 
			within(jada.dao.ContentImageDAO) || 
			within(jada.dao.UserDAO) || 
			within(jada.admin.user.UserMaintAction) || 
			within(jada.admin.site.SiteLoader) || 
			within(jada.admin.country.CountryListingAction) || 
			within(jada.dao.ItemDAO) || 
			within(jada.admin.item.ItemListingAction) || 
			within(jada.admin.AdminBean) || 
			within(jada.admin.homePage.HomePageMaintAction) || 
			within(jada.admin.shipping.ShippingMethodMaintAction) || 
			within(jada.dao.ShippingRegionDAO) || 
			within(jada.admin.shipping.ShippingRegionListingAction) || 
			within(jada.dao.SectionDAO) || 
			within(jada.admin.section.SectionMaintAction) || 
			within(jada.dao.CreditHeaderDAO) || 
			within(jada.content.payment.OrderEngine) || 
			within(jada.admin.user.UserListingAction) || 
			within(jada.admin.shipping.ShippingRegionMaintAction) || 
			within(jada.admin.menu.MenuMaintAction1) || 
			within(jada.admin.site.SiteMaintAction) || 
			within(jada.admin.poll.PollListingAction) || 
			within(jada.dao.TemplateDAO) || 
			within(jada.admin.template.TemplateListingAction) || 
			within(jada.admin.tax.TaxListingAction) || 
			within(jada.dao.OrderHeaderDAO) || 
			within(jada.admin.inventory.OrderListingAction) || 
			within(jada.admin.section.SectionMaintAction1) || 
			within(jada.admin.template.TemplateMaintAction) || 
			within(jada.admin.inventory.OrderMaintAction) || 
			within(jada.admin.contactus.ContactUsMaintAction)) && 
			args(param1);
			
		Object around(String param1) : sqlInjection_createSQLQueryFunction(param1){
			watch.start();
			if(fixes.containsKey(thisJoinPoint.getSourceLocation().getFileName() + "_" + 
				thisJoinPoint.getSourceLocation().getLine())){
				try{
					proceed(ThesisUtil.doSQLInjectionFix(param1, fixes.get(thisJoinPoint.getSourceLocation().getFileName() + "_" + 
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

		pointcut sqlInjection_executeUpdateFunction(String param1) : 
			call(* *.executeUpdate(String)) && 
			(within(jada.dao.CountryDAO) || 
			within(jada.admin.country.CountryMaintAction) || 
			within(jada.dao.TaxDAO) || 
			within(jada.admin.tax.TaxMaintAction) || 
			within(jada.dao.ContentDAO) || 
			within(jada.admin.content.ContentListingAction) || 
			within(jada.admin.item.ItemMaintAction) || 
			within(jada.dao.ShippingMethodDAO) || 
			within(jada.admin.shipping.ShippingMethodListingAction) || 
			within(jada.dao.SyndicationDAO) || 
			within(jada.admin.syndication.SyndicationMaintAction) || 
			within(jada.install.process.Installer) || 
			within(jada.dao.MenuDAO) || 
			within(jada.admin.menu.MenuMaintAction) || 
			within(jada.dao.PollHeaderDAO) || 
			within(jada.admin.poll.PollMaintAction) || 
			within(jada.dao.CustomerDAO) || 
			within(jada.admin.customer.CustomerListingAction) || 
			within(jada.dao.SiteDAO) || 
			within(jada.admin.site.SiteListingAction) || 
			within(jada.admin.content.ContentMaintAction) || 
			within(jada.admin.customer.CustomerMaintAction) || 
			within(jada.dao.ContactUsDAO) || 
			within(jada.admin.contactus.ContactUsListingAction) || 
			within(jada.install.process.DatabaseLoadAction) || 
			within(jada.util.Utility) || 
			within(jada.dao.ShippingTypeDAO) || 
			within(jada.admin.shipping.ShippingTypeMaintAction) || 
			within(jada.dao.ItemImageDAO) || 
			within(jada.admin.shipping.ShippingTypeListingAction) || 
			within(jada.content.ContentBean) || 
			within(jada.content.data.ContentApi) || 
			within(jada.dao.StateDAO) || 
			within(jada.dao.ContentImageDAO) || 
			within(jada.dao.UserDAO) || 
			within(jada.admin.user.UserMaintAction) || 
			within(jada.admin.site.SiteLoader) || 
			within(jada.admin.country.CountryListingAction) || 
			within(jada.dao.ItemDAO) || 
			within(jada.admin.item.ItemListingAction) || 
			within(jada.admin.AdminBean) || 
			within(jada.admin.homePage.HomePageMaintAction) || 
			within(jada.admin.shipping.ShippingMethodMaintAction) || 
			within(jada.dao.ShippingRegionDAO) || 
			within(jada.admin.shipping.ShippingRegionListingAction) || 
			within(jada.dao.SectionDAO) || 
			within(jada.admin.section.SectionMaintAction) || 
			within(jada.dao.CreditHeaderDAO) || 
			within(jada.content.payment.OrderEngine) || 
			within(jada.admin.user.UserListingAction) || 
			within(jada.admin.shipping.ShippingRegionMaintAction) || 
			within(jada.admin.menu.MenuMaintAction1) || 
			within(jada.admin.site.SiteMaintAction) || 
			within(jada.admin.poll.PollListingAction) || 
			within(jada.dao.TemplateDAO) || 
			within(jada.admin.template.TemplateListingAction) || 
			within(jada.admin.tax.TaxListingAction) || 
			within(jada.dao.OrderHeaderDAO) || 
			within(jada.admin.inventory.OrderListingAction) || 
			within(jada.admin.section.SectionMaintAction1) || 
			within(jada.admin.template.TemplateMaintAction) || 
			within(jada.admin.inventory.OrderMaintAction) || 
			within(jada.admin.contactus.ContactUsMaintAction)) && 
			args(param1);
			
		Object around(String param1) : sqlInjection_executeUpdateFunction(param1){
			watch.start();
			if(fixes.containsKey(thisJoinPoint.getSourceLocation().getFileName() + "_" + 
				thisJoinPoint.getSourceLocation().getLine())){
				try{
					proceed(ThesisUtil.doSQLInjectionFix(param1, fixes.get(thisJoinPoint.getSourceLocation().getFileName() + "_" + 
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

		pointcut sqlInjection_createQueryFunction(String param1) : 
			call(* *.createQuery(String)) && 
			(within(jada.dao.CountryDAO) || 
			within(jada.admin.country.CountryMaintAction) || 
			within(jada.dao.TaxDAO) || 
			within(jada.admin.tax.TaxMaintAction) || 
			within(jada.dao.ContentDAO) || 
			within(jada.admin.content.ContentListingAction) || 
			within(jada.admin.item.ItemMaintAction) || 
			within(jada.dao.ShippingMethodDAO) || 
			within(jada.admin.shipping.ShippingMethodListingAction) || 
			within(jada.dao.SyndicationDAO) || 
			within(jada.admin.syndication.SyndicationMaintAction) || 
			within(jada.install.process.Installer) || 
			within(jada.dao.MenuDAO) || 
			within(jada.admin.menu.MenuMaintAction) || 
			within(jada.dao.PollHeaderDAO) || 
			within(jada.admin.poll.PollMaintAction) || 
			within(jada.dao.CustomerDAO) || 
			within(jada.admin.customer.CustomerListingAction) || 
			within(jada.dao.SiteDAO) || 
			within(jada.admin.site.SiteListingAction) || 
			within(jada.admin.content.ContentMaintAction) || 
			within(jada.admin.customer.CustomerMaintAction) || 
			within(jada.dao.ContactUsDAO) || 
			within(jada.admin.contactus.ContactUsListingAction) || 
			within(jada.install.process.DatabaseLoadAction) || 
			within(jada.util.Utility) || 
			within(jada.dao.ShippingTypeDAO) || 
			within(jada.admin.shipping.ShippingTypeMaintAction) || 
			within(jada.dao.ItemImageDAO) || 
			within(jada.admin.shipping.ShippingTypeListingAction) || 
			within(jada.content.ContentBean) || 
			within(jada.content.data.ContentApi) || 
			within(jada.dao.StateDAO) || 
			within(jada.dao.ContentImageDAO) || 
			within(jada.dao.UserDAO) || 
			within(jada.admin.user.UserMaintAction) || 
			within(jada.admin.site.SiteLoader) || 
			within(jada.admin.country.CountryListingAction) || 
			within(jada.dao.ItemDAO) || 
			within(jada.admin.item.ItemListingAction) || 
			within(jada.admin.AdminBean) || 
			within(jada.admin.homePage.HomePageMaintAction) || 
			within(jada.admin.shipping.ShippingMethodMaintAction) || 
			within(jada.dao.ShippingRegionDAO) || 
			within(jada.admin.shipping.ShippingRegionListingAction) || 
			within(jada.dao.SectionDAO) || 
			within(jada.admin.section.SectionMaintAction) || 
			within(jada.dao.CreditHeaderDAO) || 
			within(jada.content.payment.OrderEngine) || 
			within(jada.admin.user.UserListingAction) || 
			within(jada.admin.shipping.ShippingRegionMaintAction) || 
			within(jada.admin.menu.MenuMaintAction1) || 
			within(jada.admin.site.SiteMaintAction) || 
			within(jada.admin.poll.PollListingAction) || 
			within(jada.dao.TemplateDAO) || 
			within(jada.admin.template.TemplateListingAction) || 
			within(jada.admin.tax.TaxListingAction) || 
			within(jada.dao.OrderHeaderDAO) || 
			within(jada.admin.inventory.OrderListingAction) || 
			within(jada.admin.section.SectionMaintAction1) || 
			within(jada.admin.template.TemplateMaintAction) || 
			within(jada.admin.inventory.OrderMaintAction) || 
			within(jada.admin.contactus.ContactUsMaintAction)) && 
			args(param1);
			
		Object around(String param1) : sqlInjection_createQueryFunction(param1){
			watch.start();
			if(fixes.containsKey(thisJoinPoint.getSourceLocation().getFileName() + "_" + 
				thisJoinPoint.getSourceLocation().getLine())){
				try{
					proceed(ThesisUtil.doSQLInjectionFix(param1, fixes.get(thisJoinPoint.getSourceLocation().getFileName() + "_" + 
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

		pointcut sqlInjection_prepareStatementFunction(String param1) : 
			call(* *.prepareStatement(String)) && 
			(within(jada.dao.CountryDAO) || 
			within(jada.admin.country.CountryMaintAction) || 
			within(jada.dao.TaxDAO) || 
			within(jada.admin.tax.TaxMaintAction) || 
			within(jada.dao.ContentDAO) || 
			within(jada.admin.content.ContentListingAction) || 
			within(jada.admin.item.ItemMaintAction) || 
			within(jada.dao.ShippingMethodDAO) || 
			within(jada.admin.shipping.ShippingMethodListingAction) || 
			within(jada.dao.SyndicationDAO) || 
			within(jada.admin.syndication.SyndicationMaintAction) || 
			within(jada.install.process.Installer) || 
			within(jada.dao.MenuDAO) || 
			within(jada.admin.menu.MenuMaintAction) || 
			within(jada.dao.PollHeaderDAO) || 
			within(jada.admin.poll.PollMaintAction) || 
			within(jada.dao.CustomerDAO) || 
			within(jada.admin.customer.CustomerListingAction) || 
			within(jada.dao.SiteDAO) || 
			within(jada.admin.site.SiteListingAction) || 
			within(jada.admin.content.ContentMaintAction) || 
			within(jada.admin.customer.CustomerMaintAction) || 
			within(jada.dao.ContactUsDAO) || 
			within(jada.admin.contactus.ContactUsListingAction) || 
			within(jada.install.process.DatabaseLoadAction) || 
			within(jada.util.Utility) || 
			within(jada.dao.ShippingTypeDAO) || 
			within(jada.admin.shipping.ShippingTypeMaintAction) || 
			within(jada.dao.ItemImageDAO) || 
			within(jada.admin.shipping.ShippingTypeListingAction) || 
			within(jada.content.ContentBean) || 
			within(jada.content.data.ContentApi) || 
			within(jada.dao.StateDAO) || 
			within(jada.dao.ContentImageDAO) || 
			within(jada.dao.UserDAO) || 
			within(jada.admin.user.UserMaintAction) || 
			within(jada.admin.site.SiteLoader) || 
			within(jada.admin.country.CountryListingAction) || 
			within(jada.dao.ItemDAO) || 
			within(jada.admin.item.ItemListingAction) || 
			within(jada.admin.AdminBean) || 
			within(jada.admin.homePage.HomePageMaintAction) || 
			within(jada.admin.shipping.ShippingMethodMaintAction) || 
			within(jada.dao.ShippingRegionDAO) || 
			within(jada.admin.shipping.ShippingRegionListingAction) || 
			within(jada.dao.SectionDAO) || 
			within(jada.admin.section.SectionMaintAction) || 
			within(jada.dao.CreditHeaderDAO) || 
			within(jada.content.payment.OrderEngine) || 
			within(jada.admin.user.UserListingAction) || 
			within(jada.admin.shipping.ShippingRegionMaintAction) || 
			within(jada.admin.menu.MenuMaintAction1) || 
			within(jada.admin.site.SiteMaintAction) || 
			within(jada.admin.poll.PollListingAction) || 
			within(jada.dao.TemplateDAO) || 
			within(jada.admin.template.TemplateListingAction) || 
			within(jada.admin.tax.TaxListingAction) || 
			within(jada.dao.OrderHeaderDAO) || 
			within(jada.admin.inventory.OrderListingAction) || 
			within(jada.admin.section.SectionMaintAction1) || 
			within(jada.admin.template.TemplateMaintAction) || 
			within(jada.admin.inventory.OrderMaintAction) || 
			within(jada.admin.contactus.ContactUsMaintAction)) && 
			args(param1);
			
		Object around(String param1) : sqlInjection_prepareStatementFunction(param1){
			watch.start();
			if(fixes.containsKey(thisJoinPoint.getSourceLocation().getFileName() + "_" + 
				thisJoinPoint.getSourceLocation().getLine())){
				try{
					proceed(ThesisUtil.doSQLInjectionFix(param1, fixes.get(thisJoinPoint.getSourceLocation().getFileName() + "_" + 
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
} 
