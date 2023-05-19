package kh.member.model.service;

import java.sql.Connection;
import java.sql.SQLException;

import static kh.common.jdbc.JDBCTemplate.*;
import kh.member.model.dao.MemberDao;
import kh.member.model.vo.MemberVo;

public class EnrollService {
	
//	public int enroll(MemberVo vo) {
//		int result = -1;
//		Connection conn = getConnection();
//		result = new MemberDao().enroll(conn, vo);
//		close(conn);
//		return result;
//	}
	
	public int enroll(MemberVo vo) {
        int result = -1;
        Connection conn = null;
        
        try {
            conn = getConnection();
            MemberDao memberDao = new MemberDao();
            
            // 중복된 이메일인지 확인
            int isEmailDuplicate = memberDao.checkEmailDuplicate(conn, vo.getEmail());
            if (isEmailDuplicate < 0) {
                System.out.println("중복된 이메일입니다.");
                return -1; // 실패를 나타내는 값 반환
            }
            
            // 회원 가입
            result = memberDao.enroll(conn, vo);
            
            if (result < 1) {
                System.out.println("회원가입 실패");
            } else {
                System.out.println("회원가입 성공");
            }
        } finally {
            close(conn);
        }
        
        return result;
    }


}
