/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import dbconnection.DbConnection;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.AppUser;
import model.Question;


/*
create table APP.QUESTION (id INTEGER NOT NULL 
                PRIMARY KEY GENERATED ALWAYS AS IDENTITY 
                (START WITH 1, INCREMENT BY 1), ques varchar(255), a varchar(255), b varchar(255), c varchar(255), d varchar(225), ans varchar(1));

*/


public class Service {
    
    private Statement stm;
    
    public Service()
    {
        try{
        DbConnection dbc = new DbConnection();
        stm = dbc.getStm();
        }catch(Exception ex){
            ex.printStackTrace();
        }
    }
    
    public int loginUser(String email, String password){
    
        int bol = 0;
        String sql = "select password,type from APPUSER where email='"+email+"'";
        try {
            ResultSet rs = stm.executeQuery(sql);
            rs.next();
            String pass = rs.getString(1);
            String type = rs.getString("type");
            
            if(password.equals(pass)){
               if(type.equalsIgnoreCase("USER")){
                   bol = 1;
               }else if(type.equalsIgnoreCase("ADMIN")){
                   bol = 2;
               }
            }else{
                bol = 0;
            }
        } catch (SQLException ex) {
            bol = 0;
            Logger.getLogger(Service.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return bol;
    }
  
    public boolean AppUserRegistration(AppUser appUser)
    {
        boolean bol = true;
        String sql = "insert into  APPUSER (email, password, name, address, type) values ('"+appUser.getEmail()+"','"+appUser.getPasword()+"','"+appUser.getName()+"','"+appUser.getAddress()+"','"+appUser.getType()+"')";
        try {
            stm.execute(sql);
        } catch (SQLException ex) {
            bol = false;
            System.out.println(ex);
            Logger.getLogger(Service.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return bol;
    }
    
    public List<Question> getData()
    {
        List<Question> dataList  = new ArrayList<>();
        
        String sql = "select * from QUESTION";
        try {
            ResultSet rs = stm.executeQuery(sql);
            
            while(rs.next())
            {
                int id = rs.getInt("id");
                String ques = rs.getString("ques");
                String a = rs.getString("a");
                String b = rs.getString("b");
                String c = rs.getString("c");
                String d = rs.getString("d");
                String ans = rs.getString("ans");
                
                Question q = new Question(id, ques, a, b, c, d, ans);
                dataList.add(q);
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(Service.class.getName()).log(Level.SEVERE, null, ex);
        }
        
       // System.out.println("Data : -----------------\n"+dataList.toString());
        
        return dataList;
    }
    
     public List<Question> getExamQuestionSet(int n)
    {
        List<Question> data = getData();
        List<Question> quesList = new ArrayList<>();
        
        if(n<=data.size())
        {
            while(n!=0){
                
                int dataLen = data.size();
                int i = (int) (Math.random()*dataLen);
                quesList.add(data.get(i));
                data.remove(i);
                
                n--;
            }
            
        }
        
        System.out.println("DataList : \n : "+quesList);
        return quesList;
    }
    
    
    
    
    public void addQuestion(Question q)
    {
        String sql = "insert into QUESTION (ques, a, b, c, d, ans) values('"+q.getQues()+"','"+q.getA()+"','"+q.getB()+"','"+q.getC()+"','"+q.getD()+"','"+q.getAns()+"')";
        //String sql = "insert into APP.QUESTION (ques, a, b, c, d, ans) values('jxg','ks','skj','kh','kh','a')"
        System.out.println(q.toString());
        try{
            stm.execute(sql);
        }catch(Exception ex){
            System.out.println(ex.toString());
            ///ex.printStackTrace();
        }
        
        
    }
    
    
    
    
    
    
    
    public void deleteQuestion(int id){
        String sql = "delete from QUESTION where id = "+id;
        try{
            stm.execute(sql);
        }catch(Exception ex){
            ex.printStackTrace();
        }
    }
    
    
    
    public void updateResult(String result, String email)
    {
        String query = "update APPUSER set result = '"+result+"' where email = '"+email+"'";
        try {
            stm.execute(query);
        } catch (SQLException ex) {
            Logger.getLogger(Service.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    
    public List<AppUser> fetchAppUser()
    {
        List<AppUser> list = new ArrayList<>();
          
        
        try{
            String sql = "select * from APPUSER where type = 'USER'";
            ResultSet rs = stm.executeQuery(sql);
            while(rs.next()){
                
                String email = rs.getString("email");
                String name = rs.getString("name");
                String result = rs.getString("result");
                
                AppUser user = new AppUser();
                user.setEmail(email);
                user.setName(name);
                user.setResult(result);
                list.add(user);
            }
        }catch(Exception e){
            e.printStackTrace();
        }

        return list;
    }
    
    
    
}
