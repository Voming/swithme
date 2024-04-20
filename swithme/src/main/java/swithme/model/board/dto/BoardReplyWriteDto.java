package swithme.model.board.dto;

public class BoardReplyWriteDto {

	private Integer boardReplyid;
	private int boardId;
	private String boardReplywriter;
	private String boardReplycontent;
	private String boardReplywritetime; // java.sql.timestamp
	
	@Override
	public String toString() {
		return "BoardReplyWriteDto [boardReplyid=" + boardReplyid + ", boardId=" + boardId + ", boardReplywriter="
				+ boardReplywriter + ", boardReplycontent=" + boardReplycontent + ", boardReplywritetime="
				+ boardReplywritetime + "]";
	}

	public BoardReplyWriteDto(Integer boardReplyid, int boardId, String boardReplywriter, String boardReplycontent,
			String boardReplywritetime) {
		super();
		this.boardReplyid = boardReplyid;
		this.boardId = boardId;
		this.boardReplywriter = boardReplywriter;
		this.boardReplycontent = boardReplycontent;
		this.boardReplywritetime = boardReplywritetime;
	}

	public Integer getBoardReplyid() {
		return boardReplyid;
	}

	public int getBoardId() {
		return boardId;
	}

	public String getBoardReplywriter() {
		return boardReplywriter;
	}

	public String getBoardReplycontent() {
		return boardReplycontent;
	}

	public String getBoardReplywritetime() {
		return boardReplywritetime;
	}
	
	
	
}
