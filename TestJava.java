// Exemple de programme JAVA qui utilise le pilote JDBC OCI8 d'Oracle
// pour insérer une ligne dans la table Client

// Il faut importer le paquetage java.sql pour utiliser JDBC
package ExemplesJDBC;
import java.sql.*;

class ClientInsertJDBC
{
  public static void main (String args [])
       throws SQLException, ClassNotFoundException, java.io.IOException
  {
    // Charger le pilote JDBC d'Oracle
    Class.forName ("oracle.jdbc.driver.OracleDriver");

    // Connection à une BD
    Connection uneConnection =
      DriverManager.getConnection ("jdbc:oracle:thin:@localhost:1521:orcl", "godin", "oracle");

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
  }
}
