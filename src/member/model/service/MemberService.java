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
	public int updateMember(int memberNo, String memberPwd, int birthYear, String memberNick, String likeStyle) {
		Connection conn = getConnection(); 
		
		int result = new MemberDao().updateMember(conn, memberNo, memberPwd, birthYear, memberNick, likeStyle);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	// 닉네임 중복 확인
	public int checkDuplicate(String memberNick) {
		Connection conn = getConnection();
		
		int result = new MemberDao().checkDuplicate(conn, memberNick);
		
		close(conn);
		
		return result;
	}
	public int nickcheck(String nickname) {
		Connection conn = getConnection();
		
		int result = new MemberDao().nickcheck(conn, nickname);
		
		close(conn);

		return result;
	}

	public int emailcheck(String userId) {
		Connection conn = getConnection();
		
		int result = new MemberDao().emailcheck(conn , userId);
		close(conn);
		return result;
	}

	public Member updatePwd(String memberId, String newPwd) {
		Connection conn = getConnection();
		
		int result = new MemberDao().updatePwd(conn , memberId, newPwd);
		
		Member updateMember = null;
		
		if(result > 0 ) {
			updateMember = new MemberDao().selectMember(conn , memberId);
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return updateMember;
	}

	   public Member resetPwd(Member m) {
		      Connection conn = getConnection();
		      Member updateMember = null;
		      
		      int result = new MemberDao().resetPwd(conn, m);
		      
		      if(result > 0 ) {
		         updateMember = new MemberDao().selectemail(conn , m.getMemberId());
		         commit(conn);
		      }else {
		         rollback(conn);
		      }
		      close(conn);
		      
		      return updateMember;
		   }
}
