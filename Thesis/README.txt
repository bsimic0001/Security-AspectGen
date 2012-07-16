Copyright stuff: 
 
  Copyright (c) 2012 Bojan Simic.
  All rights reserved. This program and the accompanying materials
  are made available under the terms of the GNU Lesser Public License v2.1
  which accompanies this distribution, and is available at
  http://www.gnu.org/licenses/old-licenses/gpl-2.0.html
  
  Contributors:
      Bojan Simic - initial API and implementation

This is written by me (Bojan Simic). 

If you have questions please email me at bsimic0001@gmail.com

HOW TO - Generate Aspects

1. Export the Fortify SCA results as XML in the OWASP top 10 Format using the audit workbench.

2. Create a JAR file out of this project.
    - This can be done by using the eclipse wizard or using the java command line. 
    
3. Run the generator using "java -jar XSS-SQLI-Mitigator.jar <sca_report_xml_file>".
    - This will vary depending on what you name the JAR file from step 2. 
    
4. For each vulnerability in the SCA result, you will be prompted to specify the type of fix you'd like implemented.
    - Tip: for testing purposes, putting in 99 for an input will engage an automatic feature where a random 
    solution is picked for each vulnerability.

5. After step 4, two files will be generated. XSSAspect.aj and SQLInjectionAspect.aj.

HOW TO - Compile a Project with the Aspects. 

1. You will need the JAR file from step 2 above and the 2 .aj files from step 5. 

    ECLIPSE INSTRUCTIONS:

    2. If you have an eclipse project that you use eclipse to build, download http://www.eclipse.org/ajdt/ plugin for eclipse.

    3. Right click your project > Configure > Convert to AspectJ Project
    
    4. Copy the .aj files into your applications source folder and the .JAR file into the lib folder. 
    
    5. build your project and you will see that the weaver is weaving in the aspect code.
    
    6. Run your project as normal. 
    
    PROJECTS USING AT BUILDS INSTRUCTIONS
    
    2. Download and install AspectJ from eclipse.org/aspectj/downloads.php
    
    3. Convert your build.xml file by using the AspectJ ant tasks from http://www.eclipse.org/aspectj/doc/released/devguide/antTasks.html

    4. Build your application and run it as normal. 
    
