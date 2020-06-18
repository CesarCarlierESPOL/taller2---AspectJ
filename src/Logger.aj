import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public aspect Logger{
		
	/* Aspect a realizar:
	 * Después de cada llamada a una transacción, se debe mostrar en 
	 * pantalla y guardar en un archivo “Log.txt” lo siguiente: 
	 * el tipo de transacción realizada y la hora.
	 */
	pointcut successA() : call(* *.moneyMakeTransaction());
    after() : successA() {
    	DateFormat df = new SimpleDateFormat("dd/MM/yy HH:mm:ss");
    	Date dateobj = new Date();
    	
    	System.out.println("**** Deposito de dinero terminado **** Hora: ");
    	System.out.println(df.format(dateobj));
    }
    
    pointcut successB() : call(* *.moneyWithdrawal());
    after() : successB() { 
    	DateFormat df = new SimpleDateFormat("dd/MM/yy HH:mm:ss");
    	Date dateobj = new Date();
    	
    	System.out.print("**** Retiro de dinero terminado **** Hora: ");
    	System.out.println(df.format(dateobj));
    }
}