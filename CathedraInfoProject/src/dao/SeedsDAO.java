package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import entity.Seeds;
import util.DBHelper;

public class SeedsDAO {
	
	//�������ж���   ��sql���
	public String getSQL(){
		String sql="select * from seeds ";
		return sql;
	}

	public ArrayList<Seeds> getAllSeeds() {

		ArrayList<Seeds> list = new ArrayList<Seeds>();
		String sql = getSQL();
		return getResourceBySQL(sql, list);	

	}
	
	
	//ֱ��ͨ��sql����ò�ѯ�Ľ��
	public ArrayList<Seeds> getResourceBySQL(String sql,ArrayList<Seeds> list){
		
		Connection conn = null;  //���Ӷ���
		PreparedStatement stmt = null;//������
		ResultSet rs = null;//��ݼ�����

		try {
			conn = DBHelper.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.execute("set Names utf8");
			rs = stmt.executeQuery();
			while (rs.next()) {
				Seeds seed = new Seeds();
				seed.setCollege(rs.getString("college"));
				seed.setStart_url(rs.getString("start_url"));
				seed.setUrl_xpath(rs.getString("url_xpath"));
				seed.setWord(rs.getString("word"));
				seed.setTitle(rs.getString("title"));
				seed.setSpeaker(rs.getString("speaker"));
				seed.setVenue(rs.getString("venue"));
				seed.setTime(rs.getString("time"));
				seed.setText_xpath(rs.getString("text_xpath"));

				list.add(seed);

			}
			return list;
		} catch (Exception e) {
			return null;
		} finally {
			// �ͷ���ݼ�����
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
			// �ͷ�������
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
