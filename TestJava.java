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
    
    // Création d'un appel de fonction associé à la Connection
    CallableStatement uneFonction = uneConnection.prepareCall("{ ? = call TotalFacture(?)}");

    // Spécification du paramètre d'entrée
    uneFonction.setInt(14);
    // Inscription de la sortie
    uneFonction.registerOutParameter(1, java.sql.Types.INTEGER);
    // Exécution de l'appel
    uneFonction.execute();
    // Récupération de la sortie
    int leprix = unCall.getInt(1);
    
    System.out.println("Montant total:"+leprix);
    uneFonction.close();
    uneConnection.close();
    }

    
  // Création d'un appel de fonction associé à la Connection
    CallableStatement uneProcedure = uneConnection.prepareCall("{call ProduireFacture(?)}");

    // Spécification des paramètres d'entrée
    uneProcedure.setInt(16);
    // Exécution de l'appel
    uneProcedure.execute();
    uneProcedure.close();
    uneConnection.close();
    }

  
  }
}
