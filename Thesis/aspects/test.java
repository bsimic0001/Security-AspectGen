package aspects.exceptions;public aspect ExceptionLoggingAspect {

	//Pointcut to catch all exceptions that occur in the program.
	pointcut exceptionHandler(Exception e): handler(Exception+) && args(e);
	
	//Pointcut for defining calls to .toUpperCase
	pointcut upperCall(): call(* *.toUpperCase(..));
	
	//Advice for exceptionHandler
	//This will be executed for any exception in the entire application
    before (Exception e): exceptionHandler(e) {System.err.println("Caught by aspect: " + e.toString());
        e.printStackTrace();
    }
    
    Object around() : upperCall(){
    	try{proceed();
    	}
    	catch (Exception e){System.err.println("Caught by aspect: " + e.toString());
    	}return null;
    }
	declare error : call(public * java.sql.Statement+.execute*(String, ..)) : 
		"You are making a call to a Dynamic SQL LIbrary!!! Can result in SQL injection!!!!!";
}

