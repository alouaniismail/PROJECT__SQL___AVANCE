import java.sql.*;
import oracle.jdbc.pool.OracleDataSource;
import java.util.*;
import java.lang.*;
import java.io.*;

public class interfaceJDBC{

    public static void main(String args[])
 	throws SQLException, ClassNotFoundException, java.io.IOException{
	OracleDataSource ods=new OracleDataSource();
        ods.setUser("ialouani"); 
        ods.setPassword("ialouani");
	ods.setURL("jdbc:oracle:thin:@localhost:1521/oracle");
	Scanner scanner1=new Scanner(System.in);
	System.out.println("Veuillez choisir parmi le menu suivant");
	System.out.println("1.Insertions(incluant des mises à jou)");
	System.out.println("2.Consultations(incluant les vues de statistiques)");
	int choix=scanner1.nextInt();
	if(choix==1){
	System.out.println("Veuillez suivre les instructions suivantes:");
	System.out.println("1.Communes");
	System.out.println("2.Parkings");
	System.out.println("3.Positions");
	System.out.println("4.Stationnement");
	System.out.println("5.Vehicules");
	Scanner scanner =new Scanner(System.in);
	if(scanner.nextInt()==1){
	    Connection conn=null;
	    PreparedStatement stmt=null;
	    try{
		Scanner scanner2=new Scanner(System.in);
		System.out.println("Entrez le code postal:");
		int one=scanner2.nextInt();
		System.out.println("Entrez le numero de la commune:");
		Scanner scanner3=new Scanner(System.in);
		String two=scanner3.nextLine();
		conn=ods.getConnection();
		stmt=conn.prepareStatement("insert into COMMUNES "
					   +" (CODE_POSTAL, NOM_COMMUNE)" + " values (?,?)");
	    
		stmt.setInt(1,one);
		stmt.setString(2,two);
		stmt.executeUpdate();
	    }
	    finally{
		if(stmt!=null){
		    stmt.close();
		}
		if(conn!=null){
		    conn.close();
		}
}
}
}
}
}

