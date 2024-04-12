package swithme.model.group.dao;

import static swithme.jdbc.common.JdbcTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import swithme.model.group.dto.GroupDto;

public class GroupDao {
		public int selectOne(Connection conn, String groupName) {
			int result = 0;
			String sql = "SELECT COUNT(*) FROM SGROUP WHERE SGROUP_NAME=?";
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, groupName);
				rs = pstmt.executeQuery();

				if (rs.next()) {
					result = rs.getInt(1);
					System.out.println(result);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			close(rs);
			close(pstmt);
			return result;
		}

		public List<GroupDto> selectAllList(Connection conn) {
			List<GroupDto> result = null;
			String sql = "SELECT * FROM SGROUP";
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			try {
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				// ResetSet처리
				if (rs.next()) {
					result = new ArrayList<GroupDto>();
					do {
						GroupDto dto = new GroupDto(rs.getInt("SGROUP_ID"), rs.getString("SGROUP_NAME"), rs.getString("SGROUP_OPEN"),
								rs.getInt("SGROUP_PWD"), rs.getString("SGROUP_EXPLAIN"), rs.getString("SGROUP_IMG_PATH"), rs.getString("SGROUP_IMG_NAME"));
						result.add(dto);
					} while (rs.next());
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			close(rs);
			close(pstmt);
			return result;
		}


		public int insert(Connection conn, GroupDto dto) {
			int result = 0;
			String sql = "INSERT INTO SGROUP (SGROUP_NAME,SGROUP_PWD,SGROUP_EXPLAIN) VALUES (?, ?, ?)";
			PreparedStatement pstmt = null;
			try {
				pstmt = conn.prepareStatement(sql);

				if (dto.getGroupName() != null && dto.getGroupPwd() != null & dto.getGroupEx() != null) {
					// ? 처리
					pstmt.setString(1, dto.getGroupName());
					pstmt.setInt(2, dto.getGroupPwd());
					pstmt.setString(3, dto.getGroupEx());

					result = pstmt.executeUpdate();
				}

			} catch (SQLException e) {
				e.printStackTrace();
			}
			close(pstmt);
			return result;
		}

		public int update(Connection conn, String newgroupId, String groupId) {
			int result = 0;
			String sql = "UPDATE SGROUP SET MEM_ID=? WHERE SGROUP_ID=?";
			PreparedStatement pstmt = null;
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, newgroupId);
				pstmt.setString(2, groupId);

				result = pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}
			close(pstmt);
			return result;
		}

		public int delete(Connection conn, String groupId) {
			int result = 0;
			String sql = "DELETE FROM SGROUP WHERE SGROUP_ID=?";
			PreparedStatement pstmt = null;
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, groupId);

				result = pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}
			close(pstmt);
			return result;
		}

}
