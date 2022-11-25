import java.sql.*;
import oracle.jdbc.pool.OracleDataSource;
import java.util.*;
import java.lang.*;
import java.io.*;

public class interfaceJDBC{
public static void main(String[] args) throws SQLException, ClassNotFoundException, java.io.IOException{
    Scanner scanner100=new Scanner(System.in);
    while(scanner100.nextInt()!=0){
insertions1();
insertions2();
    }
}
    public static void insertions1()
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
	Connection conn=null;
	PreparedStatement stmt=null;
	if(scanner.nextInt()==1){
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

	else{
	    System.out.println("Entrez le numero du parking:");
		Scanner scanner8=new Scanner(System.in);
		int one=scanner8.nextInt();
		
		System.out.println("Entrez le nom du parking:");
		Scanner scanner9=new Scanner(System.in);
		String two=scanner9.nextLine();
		
		System.out.println("Entrez l'adresse:");
		Scanner scanner4=new Scanner(System.in);
		String three=scanner4.nextLine();
		
		System.out.println("Entrez le tarif horaire:");
		Scanner scanner5=new Scanner(System.in);
		int four=scanner5.nextInt();
		
		System.out.println("Entrez la capacitee:");
		Scanner scanner6=new Scanner(System.in);
		int five=scanner6.nextInt();

		System.out.println("Entrez le code postal:");
		Scanner scanner7=new Scanner(System.in);
		int six=scanner7.nextInt();

		conn=ods.getConnection();
		stmt=conn.prepareStatement("insert into PARKINGS "
					   +" (NUMERO_PARKING, NOM_PARKING, ADRESSE, TARIF_HORAIRE, CAPACITE, CODE_POSTAL)"
                                              + " values (?,?,?,?,?,?)");
	    
		stmt.setInt(1,one);
		stmt.setString(2,two);
		stmt.setString(3,three);
		stmt.setInt(4,four);
		stmt.setInt(5,five);
		stmt.setInt(6,six);
		stmt.executeUpdate();
	}
	}
    }

     public static void insertions2()
	 throws SQLException, ClassNotFoundException, java.io.IOException{
	 	OracleDataSource ods=new OracleDataSource();
        ods.setUser("ialouani"); 
        ods.setPassword("ialouani");
	ods.setURL("jdbc:oracle:thin:@localhost:1521/oracle");
	  System.out.println("Entrez le numero de la place:");
	  	Scanner scanner13=new Scanner(System.in);
	System.out.println("Veuillez choisir parmi le menu suivant");
	System.out.println("1.Insertions(incluant des mises à jou)");
	System.out.println("2.Consultations(incluant les vues de statistiques)");
	int choix=scanner13.nextInt();
	if(choix==1){
	    System.out.println("Veuillez suivre les instructions suivantes:");
	System.out.println("1.Communes");
	System.out.println("2.Parkings");
	System.out.println("3.Positions");
	System.out.println("4.Stationnement");
	System.out.println("5.Vehicules");
	Scanner scanner19 =new Scanner(System.in);
	Connection conn=null;
	PreparedStatement stmt=null;
	if(scanner19.nextInt()==3){
	    System.out.println("Entrez le numero de la place: ");
		Scanner scanner10=new Scanner(System.in);
		int seven=scanner10.nextInt();
		
		System.out.println("Entrez le nom de la place:");
		Scanner scanner11=new Scanner(System.in);
		String eight=scanner11.nextLine();


		System.out.println("Entrez le type de la place");
		Scanner scanner20=new Scanner(System.in);
		String nine2=scanner20.nextLine();
		System.out.println("Entrez le numero du parking");
		Scanner scanner12=new Scanner(System.in);
		String nine=scanner12.nextInt();
		conn=ods.getConnection();
		stmt=conn.prepareStatement("insert into POSITIONS "
					   +" (NUMERO_PLACE, NOM_PLACE, TYPE_PLACE, NUMERO_PARKING)"
                                              + " values (?,?,?)");
	    
		stmt.setInt(1,seven);
		stmt.setString(2,eight);
		stmt.setString(3,nine2);
		stmt.setInt(4,nine);
		stmt.executeUpdate();
	}
	else{
	    System.out.println("Entrez un id de stationnement");
	Scanner scanner14=new Scanner(System.in);
		int ten=scanner14.nextInt();
		
		System.out.println("Entrez la date de stationnement");
		Scanner scanner15=new Scanner(System.in);
		String eleven=scanner15.nextDate();
		
		System.out.println("Entrez l'horaire de sortie");
		Scanner scanner16=new Scanner(System.in);
		String tweleve=scanner12.nextDate();

			System.out.println("Entrez le numéro de la place");
		Scanner scanner17=new Scanner(System.in);
		String thirteen=scanner17.nextInt();
			System.out.println("Entrez le num d'immatriculation");
		Scanner scanner18=new Scanner(System.in);
		String fourteen=scanner18.nextDate();

		
		conn=ods.getConnection();
		stmt=conn.prepareStatement("insert into STATIONNEMENTS "
					   +" (ID_STATIONNEMENT, DATE_STATIONNEMENT, HORAIRE_SORTIE,NUMERO_PLACE,NUMERO_IMMATRICULATION)"
                                              + " values (?,?,?,?,?)");
	    
		stmt.setInt(1,ten);
		stmt.setDate(2,eleven);
		stmt.setDate(3,tweleve);
		stmt.setInt(4,thirteen);
		stmt.setInt(5,fourteen);
		stmt.executeUpdate();
	}
	}
     }
}


