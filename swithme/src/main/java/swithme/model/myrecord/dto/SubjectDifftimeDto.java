package swithme.model.myrecord.dto;

public class SubjectDifftimeDto {
		private Integer subjectId;
		private String subjectName;
		private String difftime;
		@Override
		public String toString() {
			return "SubjectDifftimeDto [subjectId=" + subjectId + ", subjectName=" + subjectName + ", difftime="
					+ difftime + "]";
		}
		public SubjectDifftimeDto(Integer subjectId, String subjectName, String difftime) {
			super();
			this.subjectId = subjectId;
			this.subjectName = subjectName;
			this.difftime = difftime;
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
		

		
		

}
