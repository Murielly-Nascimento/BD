package com.oracle.tutorial.jdbc;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

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
 	MyQueries.populateTable(myConnection);

    } catch (SQLException e) {
      JDBCUtilities.printSQLException(e);
    }catch (IOException e) { 
    	e.printStackTrace(); 
    } finally {
      JDBCUtilities.closeConnection(myConnection);
    }

  }
}