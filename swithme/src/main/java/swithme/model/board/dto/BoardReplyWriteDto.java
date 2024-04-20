package swithme.model.board.dto;

public class BoardReplyWriteDto {
	
	private Integer replyId;
	private int boardId;
	private String replyWriterid;
	private String replyContent;
	private String replyWritetime; // java.sql.timestamp
	
	@Override
	public String toString() {
		return "BoardReplyWriteDto [replyId=" + replyId + ", boardId=" + boardId + ", replyWriterId=" + replyWriterid
				+ ", replyContent=" + replyContent + ", replyWritetime=" + replyWritetime + "]";
	}

	public BoardReplyWriteDto(Integer replyId, int boardId, String replyWriterid, String replyContent,
			String replyWritetime) {
		super();
		this.replyId = replyId;
		this.boardId = boardId;
		this.replyWriterid = replyWriterid;
		this.replyContent = replyContent;
		this.replyWritetime = replyWritetime;
	}

	public Integer getReplyId() {
		return replyId;
	}

	public int getBoardId() {
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
	
	
	
}
