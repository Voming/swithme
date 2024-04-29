package swithme.model.myrecord.dto;

public class SubjectDifftimeDto {
		private Integer subjectId;
		private String subjectName;
		private String difftime;
		private String subjectColor;
		@Override
		public String toString() {
			return "SubjectDifftimeDto [subjectId=" + subjectId + ", subjectName=" + subjectName + ", difftime="
					+ difftime + ", subjectColor=" + subjectColor + "]";
		}
		public SubjectDifftimeDto(Integer subjectId, String subjectName, String difftime, String subjectColor) {
			super();
			this.subjectId = subjectId;
			this.subjectName = subjectName;
			this.difftime = difftime;
			this.subjectColor = subjectColor;
		}
		public Integer getSubjectId() {
			return subjectId;
		}
		public String getSubjectName() {
			return subjectName;
		}
		public String getDifftime() {
			return difftime;
		}
		public String getSubjectColor() {
			return subjectColor;
		}
}
