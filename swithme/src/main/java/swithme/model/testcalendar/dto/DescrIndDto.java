package swithme.model.testcalendar.dto;

public class DescrIndDto {
//	DESCR_ID    NOT NULL NUMBER       
//	DESCRIPTION NOT NULL VARCHAR2(30) 
	private Integer descrId;
	private String description;

	@Override
	public String toString() {
		return "DescrIndDto [descrId=" + descrId + ", description=" + description + "]";
	}

	public DescrIndDto(Integer descrId, String description) {
		super();
		this.descrId = descrId;
		this.description = description;
	}

	public Integer getDescrId() {
		return descrId;
	}

	public String getDescription() {
		return description;
	}
}
