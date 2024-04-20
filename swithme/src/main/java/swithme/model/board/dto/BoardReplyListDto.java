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

	private Integer boardReplyid;
	//Integer 이면 null을 넣을 수 있음  => database에서 0 과 null은 다른 개념
	//boardReplyId = null; 이렇게 넣을 수 있고 초기값이 null
	//int 초기값은 0
	private Integer boardId;	
	private String boardReplycontent;
	private String boardReplywriter;	
	private String boardReplywritetime; // java.sql.timestamp
	//java에서 Timestamp 있긴 있는데 안예뻐서 다시 예쁜 모양으로 format 바꾸려하면
	//sql에서 java의 Timestamp 바꾸기 쉽지않아서 그냥 애초에 꺼낼 때 String 모양으로 그냥 꺼냄
	private Integer boardReplylevel;
	private Integer boardReplyref;
	private Integer boardReplystep;
	
	@Override
	public String toString() {
		return "BoardReplyListDto [boardReplyid=" + boardReplyid + ", boardId=" + boardId + ", boardReplycontent="
				+ boardReplycontent + ", boardReplywriter=" + boardReplywriter + ", boardReplywritetime="
				+ boardReplywritetime + ", boardReplylevel=" + boardReplylevel + ", boardReplyref=" + boardReplyref
				+ ", boardReplystep=" + boardReplystep + "]";
	}

	public BoardReplyListDto(Integer boardReplyid, Integer boardId, String boardReplycontent, String boardReplywriter,
			String boardReplywritetime, Integer boardReplylevel, Integer boardReplyref, Integer boardReplystep) {
		super();
		this.boardReplyid = boardReplyid;
		this.boardId = boardId;
		this.boardReplycontent = boardReplycontent;
		this.boardReplywriter = boardReplywriter;
		this.boardReplywritetime = boardReplywritetime;
		this.boardReplylevel = boardReplylevel;
		this.boardReplyref = boardReplyref;
		this.boardReplystep = boardReplystep;
	}

	public Integer getBoardReplyid() {
		return boardReplyid;
	}

	public Integer getBoardId() {
		return boardId;
	}

	public String getBoardReplycontent() {
		return boardReplycontent;
	}

	public String getBoardReplywriter() {
		return boardReplywriter;
	}

	public String getBoardReplywritetime() {
		return boardReplywritetime;
	}

	public Integer getBoardReplylevel() {
		return boardReplylevel;
	}

	public Integer getBoardReplyref() {
		return boardReplyref;
	}

	public Integer getBoardReplystep() {
		return boardReplystep;
	}

	

}