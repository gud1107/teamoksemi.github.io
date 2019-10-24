package board.model.vo;

import java.sql.Date;

public class Board implements java.io.Serializable{
	private static final long serialVersionUID = -1784038607090445364L;
	
	private int articleNo; // 게시판글번호
	private int memberNo; // 회원번호
	private int articleViews; // 게시판조회수
	private int articleLikes; // 게시판찜수
	private String articleContents; // 게시판글 내용
	private Date articleDate; // 게시판글 등록날짜
	private String status; // 게시판글 삭제여부
	
	public Board() {}

	public Board(int articleNo, int memberNo, int articleViews, int articleLikes, String articleContents,
			Date articleDate, String status) {
		super();
		this.articleNo = articleNo;
		this.memberNo = memberNo;
		this.articleViews = articleViews;
		this.articleLikes = articleLikes;
		this.articleContents = articleContents;
		this.articleDate = articleDate;
		this.status = status;
	}

	public int getArticleNo() {
		return articleNo;
	}

	public void setArticleNo(int articleNo) {
		this.articleNo = articleNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getArticleViews() {
		return articleViews;
	}

	public void setArticleViews(int articleViews) {
		this.articleViews = articleViews;
	}

	public int getArticleLikes() {
		return articleLikes;
	}

	public void setArticleLikes(int articleLikes) {
		this.articleLikes = articleLikes;
	}

	public String getArticleContents() {
		return articleContents;
	}

	public void setArticleContents(String articleContents) {
		this.articleContents = articleContents;
	}

	public Date getArticleDate() {
		return articleDate;
	}

	public void setArticleDate(Date articleDate) {
		this.articleDate = articleDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Board [articleNo=" + articleNo + ", memberNo=" + memberNo + ", articleViews=" + articleViews
				+ ", articleLikes=" + articleLikes + ", articleContents=" + articleContents + ", articleDate="
				+ articleDate + ", status=" + status + "]";
	}
}