package com.bee.jspproj.dao;
import com.bee.jspproj.beans.Emp;
import com.bee.jspproj.beans.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
public class EmpDao {

	public static Connection getConnection(){
		Connection con=null;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jspdb","bee","1234");
		}catch(Exception e){System.out.println(e);}
		return con;
	}

	public static List<Emp> getRecords(int start, int total){
		List<Emp> list=new ArrayList<Emp>();
		try{
			Connection con=getConnection();
			PreparedStatement ps=con.prepareStatement("select * from board where deleted_yn = 'N' limit "+(start-1)+","+total);
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				Emp e=new Emp();
				e.setIdx(rs.getInt(1));
				e.setTitle(rs.getString(2));
				e.setKeyword(rs.getString(3));
				e.setYoutubeUrl(rs.getString(4));
				list.add(e);
			}
			con.close();
		}catch(Exception e){System.out.println(e);}
		return list;
	}
}
