package swithme.model.board.dto;

public class BoardReplyDto {


//			REPLY_ID         NOT NULL NUMBER         
//			BOARD_ID         NOT NULL NUMBER         
//			REPLY_WRITER_ID  NOT NULL VARCHAR2(20)   
//			REPLY_CONTENT    NOT NULL VARCHAR2(4000) 
//			REPLY_WRITE_TIME NOT NULL TIMESTAMP(6)   
//			REPLY_REF                 NUMBER         
//			REPLY_STEP       NOT NULL NUMBER(3)      
//			REPLY_LEVEL      NOT NULL NUMBER(2) 
	
	private Integer replyId;
	private Integer boardId;
	private String replyWriterid;
	private String replyContent;
	private String replyWritetime;
	private Integer replyRef;
	private Integer replyStep;
	private Integer replyLevel;
	
	@Override
	public String toString() {
		return "BoardReplyDto [replyId=" + replyId + ", boardId=" + boardId + ", replyWriterid=" + replyWriterid
				+ ", replyContent=" + replyContent + ", replyWritetime=" + replyWritetime + ", replyRef=" + replyRef
				+ ", replyStep=" + replyStep + ", replyLevel=" + replyLevel + "]";
	}

	public BoardReplyDto(Integer replyId, Integer boardId, String replyWriterid, String replyContent, String replyWritetime,
			Integer replyRef, Integer replyStep, Integer replyLevel) {
		super();
		this.replyId = replyId;
		this.boardId = boardId;
		this.replyWriterid = replyWriterid;
		this.replyContent = replyContent;
		this.replyWritetime = replyWritetime;
		this.replyRef = replyRef;
		this.replyStep = replyStep;
		this.replyLevel = replyLevel;
	}

	public Integer getReplyId() {
		return replyId;
	}

	public Integer getBoardId() {
		return boardId;
	}

	public String getReplyWriterid() {
		return replyWriterid;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public String getReplyWritetime() {
		return replyWritetime;
	}

	public Integer getReplyRef() {
		return replyRef;
	}

	public Integer getReplyStep() {
		return replyStep;
	}

	public Integer getReplyLevel() {
		return replyLevel;
	}
	
	
	
	
}
