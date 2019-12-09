// Programme JAVA qui utilise le pilote JDBC OCI8 d'Oracle

// Il faut importer le paquetage java.sql pour utiliser JDBC
//package ExemplesJDBC;
import java.sql.*;
//import oracle.jdbc.driver.OracleDriver;

public class Main {
// JDBC driver name and database URL
   static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
   static final String DB_URL = "jdbc:oracle:thin:@zeta2.labunix.uqam.ca:1521:baclab";

   //  Database credentials
   static final String USER = "gj391249";
   static final String PASS = "NAN75614";

   public static void main(String[] args) throws SQLException, ClassNotFoundException, java.io.IOException
   {
                 
     Connection uneConnection = null; 
    // Charger le pilote JDBC d'Oracle
    //Class.forName ("oracle.jdbc.driver.OracleDriver");
    //DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
   Class.forName("com.mysql.jdbc.Driver");
    // Connection à une BD
    uneConnection = DriverManager.getConnection(DB_URL,USER,PASS);

    // Création d'un énoncé associé à la Connection
    Statement unEnoncéSQL = uneConnection.createStatement ();
    
    // Insertion d'une ligne dans la table Client
    int n = unEnoncéSQL.executeUpdate
      ("INSERT INTO tp1Client" +
       "VALUES (0,'VISA')");
    System.out.println ("Nombre de lignes inserees:" + n);
    
     // Fermeture de énoncé et de la connexion
    unEnoncéSQL.close();
    uneConnection.close();
    
    // Exécution d'un SELECT
    ResultSet résultatSelect = unEnoncéSQL.executeQuery
     ("SELECT CCOMPAGNIE, NCAMION "+
     "FROM tp1compagnie ");
    
    // Itérer sur les lignes du résultat du SELECT et extraire les valeurs
    // des colonnes dans des variables JAVA
    
    while (résultatSelect.next ()){
      int NCAMION = résultatSelect.getInt ("NCAMION");
      String CCOMPAGNIE = résultatSelect.getString ("CCOMPAGNIE");
      System.out.println ("Total Camions:" + NCAMION);
      System.out.println ("Nom de la compagnie:" + CCOMPAGNIE);
    }

    
    // Fermeture de énoncé et de la connexion
    unEnoncéSQL.close();
    uneConnection.close();
    
}//end main
}//end Main
