import java.sql.*;
import oracle.jdbc.pool.OracleDataSource;
import java.util.*;
import java.lang.*;
import java.io.*;
//les deux avant-derneirs de plus.

public class formatDeDate{
    public static void main(String[] args)
	throws SQLException, ClassNotFoundException{
	OracleDataSource ods=new OracleDataSource();
	ods.setUser("ialouani");
	ods.setPassword("ialouani");
	ods.setURL("jdbc:oracle:thin:@localhost:1521/oracle");
	Connection conn=null;
	PreparedStatement stmt=null;//au lieu de Statement stmt=null.
	try{
	    Scanner scanner=new Scanner(System.in);
	    System.out.println("Enter your first name: ");
	    String firstName=scanner.nextLine();
	    System.out.println("Enter your last name: ");
	    String lastName=scanner.nextLine();
	    System.out.println("Enter your birthday's date: ");
	    String dN=scanner.nextLine();
	    conn=ods.getConnection();//preparation de la connexion..
	    //base en cours connue..(..)  .
	    stmt=conn.prepareStatement("insert into IDENTITEE "
				       +" (NOM, PRENOM, DATE_DE_NAISSANCE)" + " values (?, ?, ?)");
	    
	    stmt.setString(1,firstName);
	    stmt.setString(2,lastName);
	    stmt.setString(3,dN);
	    //avec des types VARCHAR(20).
	    stmt.executeUpdate();//pour l'execution de la requete avec les
	    //bonnes valeurs maintenues à cette étape.
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
