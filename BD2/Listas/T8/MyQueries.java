package com.oracle.tutorial.jdbc;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.Date;

import java.io.FileReader; 
import java.io.BufferedReader; 
import java.io.IOException; 
import java.util.Scanner; 

public class MyQueries {
  
  Connection con;
  JDBCUtilities settings;  
  
  public MyQueries(Connection connArg, JDBCUtilities settingsArg) {
    this.con = connArg;
    this.settings = settingsArg;
  }
  
    public static void insertMyData1000(Connection con) throws SQLException { 
	 long startTime = System.currentTimeMillis();
	 Statement stmt = null; 
	 String query = null; 

	 for(int numdeb = 3002; numdeb < 4002; numdeb++){
	 	query = "insert into debito (numero_debito, valor_debito, motivo_debito, data_debito, numero_conta, nome_agencia, nome_cliente) " + 
	 "values ("+Integer.toString(numdeb)+","+Integer.toString(numdeb)+",5,'2014-02-06',36593,'UFU','Pedro Alvares Sousa');" ;  
  	 	 try { 
		 	stmt = con.createStatement(); 
	 		stmt.executeUpdate("truncate table debito;");
		 	stmt.executeUpdate(query); 
		 	if (stmt != null) { stmt.close(); } 
		 	if((numdeb%50)==0){ 
				long endTime = System.currentTimeMillis(); 
				System.out.println(numdeb-3000 + "\t" + (endTime - startTime)); 
			} 
		 } catch (SQLException e) { 
		 	JDBCUtilities.printSQLException(e); 
		 }
  	 }
}
 
    public static void insertMyData2000(Connection con) throws SQLException { 
   	 long startTime = System.currentTimeMillis();
	 PreparedStatement stmt = null; 
	 String query = null; 
	 
	 for(int numdeb = 5002; numdeb < 6002; numdeb++){
	 	 query = "insert into debito (numero_debito, valor_debito, motivo_debito, data_debito, numero_conta, nome_agencia, 			nome_cliente) " + 
	 	"values (?,?,?,?,?,?,?);" ; 
	 	try { 
		 	stmt = con.prepareStatement(query); 
		 	stmt.setInt(1, numdeb); stmt.setDouble(2, numdeb);  stmt.setInt(3, 4); 
			stmt.setDate(4, Date.valueOf("2014-02-06") ); stmt.setInt(5, 36593); 
			stmt.setString(6, "UFU"); stmt.setString(7, "Pedro Alvares Sousa"); 
			stmt.executeUpdate(); 
		 	if (stmt != null) { stmt.close(); } 
		 	if((numdeb%50)==0){ 
				long endTime = System.currentTimeMillis(); 
				System.out.println(numdeb-5000 + "\t" + (endTime - startTime)); 
			} 
		 } catch (SQLException e) { 
		 	JDBCUtilities.printSQLException(e); 
		 }
	 
	 }
	}
	 
     public static void insertMyData3000(Connection con) throws SQLException { 
   	 long startTime = System.currentTimeMillis();
	 PreparedStatement stmt = null; 
	 String query = null; 
	 query = "insert into debito (numero_debito, valor_debito, motivo_debito, data_debito, numero_conta, nome_agencia, 			nome_cliente) " + 
	 	"values (?,?,?,?,?,?,?);" ; 
	  try { 
		con.setAutoCommit(false); 
		stmt = con.prepareStatement(query); 
		
	 } catch (SQLException e) { 
		 JDBCUtilities.printSQLException(e); 
	 }
	 
	 for(int numdeb = 5002; numdeb < 6002; numdeb++){
	 	stmt.setInt(1, numdeb); stmt.setDouble(2, numdeb);  stmt.setInt(3, 4); 
		stmt.setDate(4, Date.valueOf("2014-02-06") ); stmt.setInt(5, 36593); 
		stmt.setString(6, "UFU"); stmt.setString(7, "Pedro Alvares Sousa"); 
	 	if((numdeb%50)==0){ 
			long endTime = System.currentTimeMillis(); 
			System.out.println(numdeb-5000 + "\t" + (endTime - startTime)); 
		} 
	 }
	 try { 
		con.commit(); 
	 	if (stmt != null) { stmt.close(); } 
	 } catch (SQLException e) { 
	 	JDBCUtilities.printSQLException(e); 
	 }
	 
 }
  
  public static void insertMyData1(Connection con) throws SQLException { 
	 long startTime = System.currentTimeMillis();
	 Statement stmt = null; 
	 String query = null; 
	 query = "insert into debito (numero_debito, valor_debito, motivo_debito, data_debito, numero_conta, nome_agencia, nome_cliente) " + 
	 "values (3000,3000,5,'2014-02-06',36593,'UFU','Pedro Alvares Sousa');" ; 
	 try { 
	 	stmt = con.createStatement(); 
	 	//con.setAutoCommit(false); 
	 	stmt.executeUpdate(query); 
	 	if (stmt != null) { stmt.close(); } 
	 	System.out.println("Debitos da Instituicao Bancaria atualizados."); 
	 } catch (SQLException e) { 
	 	JDBCUtilities.printSQLException(e); 
	 }
	 long endTime = System.currentTimeMillis();
	 System.out.println("Um debito em IB2 inserido em " + (endTime - startTime) + " milisegundos");
 }
 
   public static void insertMyData2(Connection con) throws SQLException { 
   	 long startTime = System.currentTimeMillis();
	 PreparedStatement stmt = null; 
	 String query = null; 
	 query = "insert into debito (numero_debito, valor_debito, motivo_debito, data_debito, numero_conta, nome_agencia, nome_cliente) " + 
	 "values (?,?,?,?,?,?,?);" ; 
	 try { 
	 	stmt = con.prepareStatement(query); 
	 	stmt.setInt(1, 3001); stmt.setDouble(2, 3001); stmt.setInt(3, 4); 
		stmt.setDate(4, Date.valueOf("2014-02-06") ); stmt.setInt(5, 36593); 
		stmt.setString(6, "UFU"); stmt.setString(7, "Pedro Alvares Sousa"); 
		stmt.executeUpdate(); 
	 	if (stmt != null) { stmt.close(); } 
	 	System.out.println("Debitos da Instituicao Bancaria atualizados."); 
	 } catch (SQLException e) { 
	 	JDBCUtilities.printSQLException(e); 
	 }
	 long endTime = System.currentTimeMillis();
	 System.out.println("Um debito em IB2 inserido em " + (endTime - startTime) + " milisegundos"); 
 }
  
  public static void populateTable(Connection con) throws SQLException, IOException{ 
      Statement stmt = null;     
      String create = "";     
	try {    
		BufferedReader inputStream = null; 
		Scanner scanned_line = null; 
		String line; 
		String[] value; 
		value = new String[7]; 
		int countv;    
		
		inputStream = new BufferedReader(new FileReader("/home/mury/JDBCTutorial/debito-populate-table.txt")); 
		stmt = con.createStatement();    
		stmt.executeUpdate("truncate table debito;");
	while ((line = inputStream.readLine()) != null) { 
		countv=0; 
		System.out.println("<<"); //split fields separated by tab delimiters 
		scanned_line = new Scanner(line); 
		scanned_line.useDelimiter("\t"); 
		while (scanned_line.hasNext()) { 
			System.out.println(value[countv++]=scanned_line.next()); 
		} //while
		if (scanned_line != null) { scanned_line.close(); }        
		System.out.println(">>");        
		String query = "insert into debito (numero_debito, valor_debito,  motivo_debito, data_debito, numero_conta, nome_agencia, nome_cliente) " + "values (" + value[0] +", "+ value[1] +", "+ value[2] +", '"+ value[3] +"', "+ value[4] +", '"+ value[5] +"', '"+ value[6] + "');";    
      		System.out.println("Executando DDL/DML:");       
      		stmt.executeUpdate(query);  
		} //while
		if (inputStream != null) { inputStream.close(); }
		
   
	} catch (SQLException e) {       
		JDBCUtilities.printSQLException(e);     
	} catch (IOException e) { 
		e.printStackTrace(); 
	} 
	finally {       
		if (stmt != null) { 
			stmt.close(); 
		}     
	}   
  } 

  public static void getMyData(Connection con) throws SQLException {
    Statement stmt = null;
    String query =
      "SELECT SUPPLIERS.SUP_NAME, COUNT(COFFEES.COF_NAME) FROM COFFEES INNER JOIN SUPPLIERS ON SUPPLIERS.SUP_ID = COFFEES.SUP_ID GROUP BY  SUPPLIERS.SUP_NAME";

    try {
      stmt = con.createStatement();
      ResultSet rs = stmt.executeQuery(query);
      System.out.println("Supplier : ");
      while (rs.next()) {
        String supplierName = rs.getString(1);
        System.out.print("     " + supplierName);
        String qtd = rs.getString(2);
        System.out.println("     " + qtd);
      }
    } catch (SQLException e) {
      JDBCUtilities.printSQLException(e);
    } 
    finally {
      if (stmt != null) { stmt.close(); }
    }
  }


  public static void main(String[] args) {
    JDBCUtilities myJDBCUtilities;
    Connection myConnection = null;
    if (args[0] == null) {
      System.err.println("Properties file not specified at command line");
      return;
    } else {
      try {
        myJDBCUtilities = new JDBCUtilities(args[0]);
      } catch (Exception e) {
        System.err.println("Problem reading properties file " + args[0]);
        e.printStackTrace();
        return;
      }
    }

    try {
      myConnection = myJDBCUtilities.getConnection();
      
 	//MyQueries.populateTable(myConnection);
 	insertMyData1(myConnection);
 	//System.out.println("Prepare Statement:"); 
 	//insertMyData2000(myConnection);
 	//insertMyData3000(myConnection);

    } catch (SQLException e) {
      JDBCUtilities.printSQLException(e);
    }//catch (IOException e) { 
    	//e.printStackTrace(); 
    //} 
    finally {
      JDBCUtilities.closeConnection(myConnection);
    }

  }
}