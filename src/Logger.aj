import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.io.FileWriter;
import java.io.IOException;

public aspect Logger{
		
	/* Aspect a realizar:
	 * Despues de cada llamada a una transaccion, se debe mostrar en 
	 * pantalla y guardar en un archivo "Log.txt" lo siguiente: 
	 * el tipo de transaccion realizada y la hora.
	 */
	pointcut successA() : call(* *.moneyMakeTransaction());
    after() : successA() {
    	DateFormat df = new SimpleDateFormat("dd/MM/yy HH:mm:ss");
    	Date dateobj = new Date();
    	
    	System.out.print("**** Deposito de dinero terminado **** Hora: ");
    	System.out.println(df.format(dateobj));
    	
    	try {
            FileWriter writer = new FileWriter("Log.txt", true);
            writer.write("**** Deposito de dinero terminado **** Hora: ");
            writer.write(df.format(dateobj));
            writer.write("\r\n");
            writer.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    
    pointcut successB() : call(* *.moneyWithdrawal());
    after() : successB() { 
    	DateFormat df = new SimpleDateFormat("dd/MM/yy HH:mm:ss");
    	Date dateobj = new Date();
    	
    	System.out.print("**** Retiro de dinero terminado **** Hora: ");
    	System.out.println(df.format(dateobj));
    	
    	try {
            FileWriter writer = new FileWriter("Log.txt", true);
            writer.write("**** Retiro de dinero terminado **** Hora: ");
            writer.write(df.format(dateobj));
            writer.write("\r\n");
            writer.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}