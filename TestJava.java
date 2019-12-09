// Programme JAVA qui utilise le pilote JDBC OCI8 d'Oracle

// Il faut importer le paquetage java.sql pour utiliser JDBC
//package ExemplesJDBC;
import java.sql.*;
//import oracle.*;

public class Main {
// JDBC driver name and database URL 
   static final String DB_URL = "jdbc:oracle:thin:@zeta2.labunix.uqam.ca:1521:baclab";

   //  Database credentials
   static final String USER = "gj391249";
   static final String PASS = "hijMdgyJ";

   public static void main(String[] args) throws SQLException, ClassNotFoundException, java.io.IOException
   {
	// Charger le pilote JDBC d'Oracle
	    Class.forName ("oracle.jdbc.driver.OracleDriver");
    
	 // Connection à une BD
	    Connection uneConnection =
	      DriverManager.getConnection (DB_URL, USER, PASS);

	 // Création d'un énoncé associé à la Connection
	    Statement unEnoncéSQL = uneConnection.createStatement ();
    
	    // Exécution d'un SELECT
	    ResultSet résultatSelect = unEnoncéSQL.executeQuery
	     ("SELECT CCOMPAGNIE, NCAMION "+
	     "FROM tp1compagnie ");
	    
	    // Itérer sur les lignes du résultat du SELECT et extraire les valeurs
	    // des colonnes dans des variables JAVA
	    
	    while (résultatSelect.next ()){
	      int NCAMION = résultatSelect.getInt ("NCAMION");
	      String CCOMPAGNIE = résultatSelect.getString ("CCOMPAGNIE");
	      System.out.println("Exemple d'un SELECT");
	      System.out.println ("Total Camions:" + NCAMION);
	      System.out.println ("Nom de la compagnie:" + CCOMPAGNIE);
	    }

    
     // Fermeture de énoncé et de la connexion
    unEnoncéSQL.close();
    //uneConnection.close();
    
    // Création d'un appel de fonction associé à la Connection
    CallableStatement unCall = uneConnection.prepareCall("{? = call TotalFacture (?)}");

    // Spécification des paramètres d'entrée
    unCall.setInt(2,14);
    // Inscription de la sortie
    unCall.registerOutParameter(1, java.sql.Types.INTEGER);
    // Exécution de l'appel
    unCall.execute();
    
    int leprix = unCall.getInt(1);
    System.out.println(" ");
    System.out.println("Exemple d'une appel fonction");
    System.out.println("Total de la facture($) :"+leprix);
    unCall.close();
    uneConnection.close();
    
    
}//end main
}//end Main
