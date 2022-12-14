import java.sql.*;
import oracle.jdbc.pool.OracleDataSource;
import java.util.Scanner;
import java.lang.*;
import java.io.*;
import java.text.*;

import javax.swing.*;
import java.awt.*;
import java.awt.event.*;




public class interfaceJDBC{
    
    public static void main(String[] args) throws SQLException, ClassNotFoundException, java.io.IOException, java.text.ParseException
    {

	Scanner scanner100=new Scanner(System.in);
	while(scanner100.nextInt()==0){
	    insertions1();
	    insertions2();
	    insertions3();
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
	System.out.println("1.Insertions(incluant des mises à jour) --Communes/Parkings");
	System.out.println("2.Consultations(incluant les vues de statistiques)");
	int choix=scanner1.nextInt();
	if(choix==1){
	System.out.println("Veuillez suivre les instructions suivantes:");
	System.out.println("1.Communes");
	System.out.println("2.Parkings");
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
		System.out.println("Opération faite avec succès !");
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
		System.out.println("Opération faite avec succès !");
	}}
	else{
	    
	    consultations();
	}
    }

     public static void consultations()
 	throws SQLException, ClassNotFoundException, java.io.IOException{
 System.out.println("Choisissez quelle vue consulter:");
	    System.out.println("1.Liste des véhicules dans toutes les communes disponibles");
	    System.out.println("2.Liste des communes dans lesquelles l'étude de parkings se fera");
	    	OracleDataSource ods=new OracleDataSource();
        ods.setUser("ialouani"); 
        ods.setPassword("ialouani");
	ods.setURL("jdbc:oracle:thin:@localhost:1521/oracle");
	  	Scanner scanner200=new Scanner(System.in);
		Connection conn = null;
    Statement stmt = null;
 conn = ods.getConnection();
      stmt = conn.createStatement();
      if(scanner200.nextInt()==1){
      ResultSet rset = stmt.executeQuery("select * from VEHICULES");

      while (rset.next()) {
	  System.out.println(rset.getString(1)+rset.getString(2)+rset.getString(3)+rset.getString(4)+rset.getString(5)+rset.getString(6));
			   }
      }

      else{
 ResultSet rset = stmt.executeQuery("select * from COMMUNES");
 while(rset.next()){
     System.out.println(rset.getString(1)+rset.getString(2));

 }
 insertions1();
      }
     }

 public static void consultations2()
     throws SQLException, ClassNotFoundException, java.io.IOException, java.text.ParseException{
 System.out.println("Choisissez quelle vue consulter:");
	    System.out.println("1.Liste des parkings réparties dans toutes les communes:");
	    System.out.println("2.Liste des places reliees à un numéro de parking précis:");
	    	OracleDataSource ods=new OracleDataSource();
        ods.setUser("ialouani"); 
        ods.setPassword("ialouani");
	ods.setURL("jdbc:oracle:thin:@localhost:1521/oracle");
	  	Scanner scanner200=new Scanner(System.in);
		Connection conn = null;
    Statement stmt = null;
 conn = ods.getConnection();
      stmt = conn.createStatement();
      if(scanner200.nextInt()==1){
      ResultSet rset = stmt.executeQuery("select * from PARKINGS");

      while (rset.next()) {
	  System.out.println(rset.getString(1)+rset.getString(2)+rset.getString(3)+rset.getString(4)+rset.getString(5)+rset.getString(6));
			   }
      }
 
      else{
 ResultSet rset = stmt.executeQuery("select * from POSITIONS");
 while(rset.next()){
     System.out.println(rset.getString(1)+rset.getString(2)+rset.getString(3));

 }
 insertions2();
      }
 }

     public static void consultations3()
	 throws SQLException, ClassNotFoundException, java.io.IOException{
 System.out.println("Choisissez quelle vue consulter:");
	    System.out.println("1.Liste des stationnements courants à cet instant reliant une vraie numero de place à une place d'immatriculation:");
	    	OracleDataSource ods=new OracleDataSource();
        ods.setUser("ialouani"); 
        ods.setPassword("ialouani");
	ods.setURL("jdbc:oracle:thin:@localhost:1521/oracle");
	  	Scanner scanner200=new Scanner(System.in);
		Connection conn = null;
    Statement stmt = null;
 conn = ods.getConnection();
      stmt = conn.createStatement();
      if(scanner200.nextInt()==1){
      ResultSet rset = stmt.executeQuery("select * from STATIONNEMENTS");

      while (rset.next()) {
	  System.out.println(rset.getString(1)+rset.getString(2)+rset.getString(3)+rset.getString(4)+rset.getString(5));
      }
      }
     }
    
     public static void insertions2()
	 throws SQLException, ClassNotFoundException, java.io.IOException, java.text.ParseException{
	 	OracleDataSource ods=new OracleDataSource();
        ods.setUser("ialouani"); 
        ods.setPassword("ialouani");
	ods.setURL("jdbc:oracle:thin:@localhost:1521/oracle");
	  	Scanner scanner13=new Scanner(System.in);
	System.out.println("Veuillez choisir parmi le menu suivant");
	System.out.println("1.Insertions(incluant des mises à jour) --Positions/Stationnements");
	System.out.println("2.Consultations(incluant les vues de statistiques)");
	int choix=scanner13.nextInt();
	if(choix==1){
	    System.out.println("Veuillez suivre les instructions suivantes:");
	System.out.println("3.Positions");
	System.out.println("4.Stationnement");
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
		int nine=scanner12.nextInt();
		conn=ods.getConnection();
		stmt=conn.prepareStatement("insert into POSITIONS "
					   +" (NUMERO_PLACE, NOM_PLACE, NOM_POSITION, NUMERO_PARKING)"
                                              + " values (?,?,?)");
	    
		stmt.setInt(1,seven);
		stmt.setString(2,eight);
		stmt.setString(3,nine2);
		stmt.setInt(4,nine);
		stmt.executeUpdate();
		System.out.println("Opération faite avec succès !");
	}
	else{
	    /*conn=ods.getConnection();
	    Statement stat = conn.createStatement();
	    stat.execute("alter session set NLS_DATE_FORMAT='yyyyy-mm-dd hh:mm:ss'");*/
	    System.out.println("Entrez un id de stationnement");
	Scanner scanner14=new Scanner(System.in);
		int ten=scanner14.nextInt();
		
	   System.out.println("Entrez la date de stationnement");
	   	Scanner scanner15=new Scanner(System.in);
		String str1=scanner15.nextLine();

		Date date1 = new java.sql.Date(
					       ((java.util.Date) new SimpleDateFormat("yyyyy-mm-dd hh:mm:ss").parse(str1)).getTime());
		
		System.out.println("Entrez l'horaire de sortie");
		Scanner scanner16=new Scanner(System.in);

		String str2=scanner16.nextLine();
	Date date2 = new java.sql.Date(((java.util.Date) new SimpleDateFormat("yyyyy-mm-dd hh:mm:ss").parse(str2)).getTime());
	
			System.out.println("Entrez le numéro de la place");
		Scanner scanner17=new Scanner(System.in);
		int eleven=scanner17.nextInt();
			System.out.println("Entrez le num d'immatriculation");
		Scanner scanner18=new Scanner(System.in);
		int tweleve=scanner18.nextInt();

		
		
		stmt=conn.prepareStatement("insert into STATIONNEMENTS "
					   +" (ID_STATIONNEMENT, DATE_STATIONNEMENT, HORAIRE_SORTIE,NUMERO_PLACE,NUMERO_IMMATRICULATION)"
                                              + " values (?,?,?,?,?)");
	    
		stmt.setInt(1,ten);
		stmt.setDate(2,date1);
		stmt.setDate(3,date2);
		stmt.setInt(4,eleven);
		stmt.setInt(5,tweleve);
		stmt.executeUpdate();
		System.out.println("Opération faite avec succès !");
	}}
	else{
	    
	    consultations2();
	}
     }

     public static void insertions3()
	 throws SQLException, ClassNotFoundException, java.io.IOException, java.text.ParseException{
	 	OracleDataSource ods=new OracleDataSource();
        ods.setUser("ialouani"); 
        ods.setPassword("ialouani");
	ods.setURL("jdbc:oracle:thin:@localhost:1521/oracle");
	  	Scanner scanner19=new Scanner(System.in);
	System.out.println("Veuillez choisir parmi le menu suivant");
	System.out.println("1.Insertions(incluant des mises à jour) --Vehicules");
	System.out.println("2.Consultations(incluant les vues de statistiques)");
	int choix=scanner19.nextInt();
	if(choix==1){
	    System.out.println("Veuillez suivre les instructions suivantes:");
	    System.out.println("5.Vehicules");
	Scanner scanner101 =new Scanner(System.in);
	Connection conn=null;
	PreparedStatement stmt=null;
	if(scanner101.nextInt()==5){
	    System.out.println("Entrez le num d'immatriculation: ");
	    Scanner scanner20=new Scanner(System.in);
	    String thirteen=scanner20.nextLine();

	    System.out.println("Entrez la marque ");
	    Scanner scanner21=new Scanner(System.in);
	    String fourtheen=scanner21.nextLine();

	    System.out.println("Entrez la date de mise en circulation");
		Scanner scanner22=new Scanner(System.in);

		String str3=scanner22.nextLine();
	Date date3 = new java.sql.Date(((java.util.Date) new SimpleDateFormat("yyyyy-mm-dd hh:mm:ss").parse(str3)).getTime());

	System.out.println("Entrez le type de ce véhicule: ");
	Scanner scanner300=new Scanner(System.in);
	String seventeen=scanner300.nextLine();

	
	System.out.println("Entrez le kilometrage jusqu'a maintenant:");
		Scanner scanner23=new Scanner(System.in);
		int fivetheen=scanner23.nextInt();

		System.out.println("Entrez l'etat general de la voiture:");
		Scanner scanner24=new Scanner(System.in);
		String sixtheen=scanner24.nextLine();

	stmt=conn.prepareStatement("insert into VEHICULES "
					   +" (NUMERO_IMMATRICULATION, MARQUE, DATE_DE_MISE_EN_CIRCULATION,TYPE_VEHICULE,KILOMETRAGE,ETAT)"
                                              + " values (?,?,?,?,?,?)");
	    
		stmt.setString(1,thirteen);
		stmt.setString(2,fourtheen);
		stmt.setDate(3,date3);
		stmt.setString(4,seventeen);
		stmt.setInt(5,fivetheen);
		stmt.setString(6,sixtheen);
		stmt.executeUpdate();
		System.out.println("Opération faite avec succès !");
	}
	}
	else{
	    
	    consultations3();
	}
     }
}
