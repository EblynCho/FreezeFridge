package com.bee.jspproj;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

public class PaginationDAO {
    public static String countRecords(){
        String query="select count(*) from board ";
        int count=0;
        JSONObject obj=new JSONObject();
        try{
            Connection con=DBConnection.getCon();
            PreparedStatement ps=con.prepareStatement(query);
            ResultSet rs=ps.executeQuery();
            if(rs.next()){
                count=rs.getInt(1);
                obj.put("count",count);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return obj.toString();
    }
    public static String getRecords(String start,String total){
        String query="select * from "+DBConnection.DATA_TABLE+" limit "+start+","+total;
        JSONObject obj=new JSONObject();
        JSONArray arr=new JSONArray();
        try{
            Connection con=DBConnection.getCon();
            PreparedStatement ps=con.prepareStatement(query);
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                arr.add(rs.getString(DBConnection.idx));
            }
            obj.put("record",arr);
        }catch(Exception e){
            e.printStackTrace();
        }
        return obj.toString();
    }
}