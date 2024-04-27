package swithme.model.board.dto;

public class BoardUpdateDto {

	private int boardId;
	private String boardWriter;
	private String title;
	private String content;
	
	@Override
	public String toString() {
		return "BoardUpdateDto [boardId=" + boardId + ", boardWriter=" + boardWriter + ", title=" + title + ", content="
				+ content + "]";
	}

	public BoardUpdateDto(int boardId, String boardWriter, String title, String content) {
		super();
		this.boardId = boardId;
		this.boardWriter = boardWriter;
		this.title = title;
		this.content = content;
	}

	public int getBoardId() {
		return boardId;
	}
	public String getBoardWriter() {
		return boardWriter;
	}
	public String getTitle() {
		return title;
	}
	public String getContent() {
		return content;
	}
	
	
}
