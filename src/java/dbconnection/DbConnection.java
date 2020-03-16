/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dbconnection;

import java.sql.Statement;
import java.sql.Connection;
import java.sql.DriverManager;


public class DbConnection {
    
    private Connection con;
    private Statement stm;
    
    public DbConnection()
    {
        try{
           
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            con = DriverManager.getConnection("jdbc:derby://localhost:1527/onlineexam", "root", "root");
            stm = con.createStatement();
            
            System.out.println("Connection success......................");
            
        }catch(Exception ex){
            ex.printStackTrace();
        }
    }

    public Statement getStm() {
        return stm;
    }
    
    
    
}
