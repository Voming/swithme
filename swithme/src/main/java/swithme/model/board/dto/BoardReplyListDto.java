package swithme.model.board.dto;

public class BoardReplyListDto {
	
//	REPLY_ID         NOT NULL NUMBER         
//	BOARD_ID         NOT NULL NUMBER         
//	REPLY_WRITER_ID  NOT NULL VARCHAR2(20)   
//	REPLY_CONTENT    NOT NULL VARCHAR2(4000) 
//	REPLY_WRITE_TIME NOT NULL TIMESTAMP(6)   
//	REPLY_REF                 NUMBER         
//	REPLY_STEP       NOT NULL NUMBER(3)      
//	REPLY_LEVEL      NOT NULL NUMBER(2) 
	
	private Integer replyId;
	//Integer 이면 null을 넣을 수 있음  => database에서 0 과 null은 다른 개념
	//boardReplyId = null; 이렇게 넣을 수 있고 초기값이 null
	//int 초기값은 0
	private Integer boardId;	
	private String replyWriterid;	
	private String replyContent;
	private String replyWritetime; // java.sql.timestamp
	//java에서 Timestamp 있긴 있는데 안예뻐서 다시 예쁜 모양으로 format 바꾸려하면
	//sql에서 java의 Timestamp 바꾸기 쉽지않아서 그냥 애초에 꺼낼 때 String 모양으로 그냥 꺼냄
	private Integer replyLevel;
	private Integer replyRef;
	private Integer replyStep;
	
	@Override
	public String toString() {
		return "BoardReplyListDto [replyId=" + replyId + ", boardId=" + boardId + ", replyWriterid=" + replyWriterid
				+ ", replyContent=" + replyContent + ", replyWritetime=" + replyWritetime + ", replyLevel=" + replyLevel
				+ ", replyRef=" + replyRef + ", replyStep=" + replyStep + "]";
	}

	public BoardReplyListDto(Integer replyId, Integer boardId, String replyWriterid, String replyContent,
			String replyWritetime, Integer replyLevel, Integer replyRef, Integer replyStep) {
		super();
		this.replyId = replyId;
		this.boardId = boardId;
		this.replyWriterid = replyWriterid;
		this.replyContent = replyContent;
		this.replyWritetime = replyWritetime;
		this.replyLevel = replyLevel;
		this.replyRef = replyRef;
		this.replyStep = replyStep;
	}

	public Integer getReplyId() {
		return replyId;
	}

	public void setReplyId(Integer replyId) {
		this.replyId = replyId;
	}

	public Integer getBoardId() {
		return boardId;
	}

	public void setBoardId(Integer boardId) {
		this.boardId = boardId;
	}

	public String getReplyWriterid() {
		return replyWriterid;
	}

	public void setReplyWriterid(String replyWriterid) {
		this.replyWriterid = replyWriterid;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public String getReplyWritetime() {
		return replyWritetime;
	}

	public void setReplyWritetime(String replyWritetime) {
		this.replyWritetime = replyWritetime;
	}

	public Integer getReplyLevel() {
		return replyLevel;
	}

	public void setReplyLevel(Integer replyLevel) {
		this.replyLevel = replyLevel;
	}

	public Integer getReplyRef() {
		return replyRef;
	}

	public void setReplyRef(Integer replyRef) {
		this.replyRef = replyRef;
	}

	public Integer getReplyStep() {
		return replyStep;
	}

	public void setReplyStep(Integer replyStep) {
		this.replyStep = replyStep;
	}

	
	
	
}