package com.bee.jspproj;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
    final static String URL="localhost:3306/";
    final static String DATABASE="jspdb";
    final static String USER="bee";
    final static String PASS="1234";
    final static String DATA_TABLE="board";

    final static String youtubeUrl="youtube_url";
    final static String idx="idx";
    public static Connection getCon(){
        Connection con=null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://"+URL+DATABASE,USER,PASS);
        }catch(Exception e){
            e.printStackTrace();
        }
        return con;
    }
}