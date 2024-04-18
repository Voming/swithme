package swithme.model.myrecord.dto;

public class SubjectDifftimeDto {
		private int recordSubjectId;
		private String subjectName;
		private String difftime;
		@Override
		public String toString() {
			return "SubjectDifftimeDto [recordSubjectId=" + recordSubjectId + ", subjectName=" + subjectName
					+ ", difftime=" + difftime + "]";
		}
		
		public SubjectDifftimeDto(int recordSubjectId, String subjectName, String difftime) {
			super();
			this.recordSubjectId = recordSubjectId;
			this.subjectName = subjectName;
			this.difftime = difftime;
		}

		public int getRecordSubjectId() {
			return recordSubjectId;
		}
		public String getSubjectName() {
			return subjectName;
		}
		public String getDifftime() {
			return difftime;
		}
		
		

}
