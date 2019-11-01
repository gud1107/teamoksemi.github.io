package member.model.service;

import java.sql.*;
import member.model.dao.MemberDao;
import member.model.vo.Member;
import static common.JDBCTemplate.*;

public class MemberService {

	public Member loginMember(String id, String pwd) {
		Connection conn = getConnection();
		
		Member loginUser = new MemberDao().loginMember(conn, id, pwd);
		
		close(conn);
		
		return loginUser;
	}

	public int insertMember(Member m) {
		Connection conn = getConnection();
		
		int result = new MemberDao().insertMember(conn, m);
		
		if(result > 0) {
			commit(conn);
			
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public Member updateMember(Member m) {
		Connection conn = getConnection();
		Member updateMem = null;
		
		int result = new MemberDao().updateMember(conn, m);
		
		if(result > 0) {
			updateMem = new MemberDao().selectMember(conn, m.getMemberId());
			commit(conn);
			
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return updateMem;
	}

	public int withdrawMember(int memberNo) {
		Connection conn = getConnection();

		int result = new MemberDao().withdrawMember(conn, memberNo);

		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);

		return result;
	}

	public int nickcheck(String nickname) {
		Connection conn = getConnection();
		
		int result = new MemberDao().nickcheck(conn, nickname);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);

		return result;
	}

}
