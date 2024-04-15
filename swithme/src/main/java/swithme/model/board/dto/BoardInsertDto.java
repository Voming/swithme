package swithme.model.board.dto;

public class BoardInsertDto {


	private String title;
	private String content;
	private String boardWriter;
	
	@Override
	public String toString() {
		return "BoardInsertDto [title=" + title + ", content=" + content + ", boardWriter=" + boardWriter + "]";
	}

	public BoardInsertDto(String title, String content, String boardWriter) {
		super();
		this.title = title;
		this.content = content;
		this.boardWriter = boardWriter;
	}

	public String getTitle() {
		return title;
	}

	public String getContent() {
		return content;
	}

	public String getBoardWriter() {
		return boardWriter;
	}

	
	
}
