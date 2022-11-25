import java.sql.*;
import oracle.jdbc.pool.OracleDataSource;
import java.util.*;
import java.lang.*;
import java.io.*;

public class interfaceJDBC{
    public static void main(String args[]){
	Scanner scanner=new Scanner(System.in);
	print("Veuillez choisir parmi le menu suivant");
	print("1.Insertions(incluant des mises à jour");
	print("2.Consultations(incluant les vues de statistiques");
	int a=scanner.nextInt();
	if(a==1)
	    insertions();
	else
	    return;
    }

    public static void print(String s){
	    System.out.println(s);
	}

    public static void insertions(){
	print("Veuillez suivre les instructions suivantes:");
	print("1.Communes");
	print("2.Parkings");
	print("3.Positions");
	print("4.Stationnement");
	print("5.Vehicules");
	Scanner scanner =new Scanner(System.in);
	if(scanner.nextLine()==1){
	    OracleDataSource ods=new OracleDataSource();
	    ods.setUser("ialouani");
	    ods.setPassword("ialouani");
	    ods.setURL("jdbc:oracle:thin:@localhost:1521/oracle");
	    Connection conn=null;
	    PreparedStatement stmt=null;
	    try{
		Scanner scanner=new Scanner(System.in);
		System.out.println("Entrez le code postal:");
		String one=scanner.nextLine();
		System.out.println("Entrez le numero de la commune:");
		int two=scanner.nextInt();
		conn=ods.getConnection();
		stmt=conn.prepareStatement("insert into COMMUNES "
					   +" (CODE_POSTAL, NOM_COMMUNE)" + " values (?,?)");
	    
		stmt.setString(1,one);
		stmt.setInt(2,two);
		stmt.executeUpdate();
		insertions();
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
