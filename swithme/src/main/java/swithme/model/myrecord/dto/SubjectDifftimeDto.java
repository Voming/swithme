package swithme.model.myrecord.dto;

public class SubjectDifftimeDto {
		private int SubjectId;
		private String subjectName;
		private String difftime;
		@Override
		public String toString() {
			return "SubjectDifftimeDto [SubjectId=" + SubjectId + ", subjectName=" + subjectName + ", difftime="
					+ difftime + "]";
		}
		public SubjectDifftimeDto(int subjectId, String subjectName, String difftime) {
			super();
			SubjectId = subjectId;
			this.subjectName = subjectName;
			this.difftime = difftime;
		}
		public int getSubjectId() {
			return SubjectId;
		}
		public String getSubjectName() {
			return subjectName;
		}
		public String getDifftime() {
			return difftime;
		}

		
		

}
