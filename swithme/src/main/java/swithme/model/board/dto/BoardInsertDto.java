package swithme.model.board.dto;


public class BoardInsertDto {

	private String boardWriter;
	private String title;
	private String content;
	


	@Override
	public String toString() {
		return "BoardInsertDto [boardWriter=" + boardWriter + ", title=" + title + ", content=" + content + "]";
	}

	public BoardInsertDto(String boardWriter, String title, String content) {
		super();
		this.boardWriter = boardWriter;
		this.title = title;
		this.content = content;
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
