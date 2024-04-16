package swithme.model.member.dao;



import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import static swithme.jdbc.common.JdbcTemplate.close;
import swithme.model.member.dto.MemberDto;



public class MemberDao {


	//select list - all
		public List<MemberDto> selectAllList(Connection conn) {
			List<MemberDto> result= null;
			String sql="SELECT MEM_ID, MEM_PWD FROM MEMBER";
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
			try {
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
				if(rs.next()) {
					result=new ArrayList<MemberDto>();
					do {
						MemberDto dto = new MemberDto(rs.getString("MEM_ID"),rs.getString("MEM_PWD"),rs.getString("MEM_EMAIL"));
						result.add(dto);
					}while(rs.next());	
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			close(rs);
			close(pstmt);
			
			return result;
		}
		
		//select one
		public MemberDto selectOne(Connection conn, String memId) {
			MemberDto result= null;
			String sql="SELECT MEM_ID, MEM_PWD, MEM_EMAIL FROM MEMBER WHERE MEM_ID=?";
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, memId);
				
				rs=pstmt.executeQuery();

				if(rs.next()) {
					result = new MemberDto(rs.getString("MEM_ID"),rs.getString("MEM_PWD"),rs.getString("MEM_EMAIL"));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			close(rs);
			close(pstmt);
			return result;
		}
		
		//insert
		public int insert (Connection conn, MemberDto dto) {
			int result= 0;
			String sql="INSERT INTO MEMBER (MEM_ID, MEM_PWD, MEM_EMAIL) VALUES(?,?,?)";
			PreparedStatement pstmt=null;
			
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, dto.getMemId());
				pstmt.setString(2, dto.getMemPwd());
				pstmt.setString(3, dto.getMemEmail());
				result=pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			close(pstmt);
			return result;
		}
		
		//update
		public int update (Connection conn, MemberDto dto) {
			int result= 0;
			String sql=""; 
			PreparedStatement pstmt=null;
			
			try {
				pstmt=conn.prepareStatement(sql);
	
				result=pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			close(pstmt);
			return result;
		}
		
		//delete
		public int delete (Connection conn, String memId) {
			int result= 0;
			String sql="DELETE FROM MEMBER WHERE MEM_ID=?";
			PreparedStatement pstmt=null;

			try {
				pstmt=conn.prepareStatement(sql);

				pstmt.setString(1, memId);
				
				result=pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			close(pstmt);
			
			return result;
		}

}
