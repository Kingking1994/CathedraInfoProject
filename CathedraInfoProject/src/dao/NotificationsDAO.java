package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import util.DBHelper;
import entity.Notifications;

public class NotificationsDAO {
	
	//返回   获得符合发布时间在一个月内的所有对象   的sql语句
	public String getSQL(){
		//String sql="select * from notifications where datediff(now(),notify_time)<=31";
		String sql="select * from notifications";
		return sql;
	}

	public ArrayList<Notifications> getAllNotifications() {

		ArrayList<Notifications> list = new ArrayList<Notifications>();
		String sql = getSQL();
		return getResourceBySQL(sql, list);	

	}
	
	
	//直接通过sql语句获得查询的结果
	public ArrayList<Notifications> getResourceBySQL(String sql,ArrayList<Notifications> list){
		
		Connection conn = null;  //链接对象
		PreparedStatement stmt = null;//语句对象
		ResultSet rs = null;//数据集对象

		try {
			conn = DBHelper.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.execute("set Names utf8");
			rs = stmt.executeQuery();
			while (rs.next()) {
				Notifications notifi = new Notifications();
				notifi.setCollege(rs.getString("college"));
				notifi.setUrl(rs.getString("url"));
				notifi.setTitle(rs.getString("title"));
				notifi.setSpeaker(rs.getString("speaker"));
				notifi.setVenue(rs.getString("venue"));
				notifi.setTime(rs.getTimestamp("time"));
				notifi.setNotify_time(rs.getDate("notify_time"));

				list.add(notifi);

			}
			return list;
		} catch (Exception e) {
			return null;
		} finally {
			// 释放数据集对象
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
			// 释放语句对象
			if (stmt != null) {
				try {
					stmt.close();
					stmt = null;
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
		}
	}
}
