package kh.member.model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import kh.member.model.vo.MemberVo;

public class MemberDao {
	
	// 로그인
	public MemberVo login(Connection conn) {
		MemberVo result = null;
		String sql = "select nickname, pwd, email from member where email=? and pwd=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		pstmt = conn.prepareStatement(sql);
		
		
		return result;
		
	}
}
