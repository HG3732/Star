package education.model.dto;

public class EduListDto {
//	EDU_ID          NOT NULL NUMBER        
//	EDU_SUBJECT     NOT NULL VARCHAR2(100) 
//	EDU_PARTICIPANT NOT NULL VARCHAR2(30)  
//	EDU_MONTH       NOT NULL VARCHAR2(7)   
//	EDU_BOOK_PERIOD NOT NULL VARCHAR2(25)  
//	EDU_PERIOD      NOT NULL VARCHAR2(25)  
//	EDU_WRITE_TIME  NOT NULL TIMESTAMP(6) 
	private int eduId;
	private String eduSubject;
	private String eduParticipant;
	private String eduMonth;
	private String eduBookPeriod;
	private String eduPeriod;
	private String eduWriteTime;

	@Override
	public String toString() {
		return "EduListDto [eduId=" + eduId + ", eduSubject=" + eduSubject + ", eduParticipant=" + eduParticipant
				+ ", eduMonth=" + eduMonth + ", eduBookPeriod=" + eduBookPeriod + ", eduPeriod=" + eduPeriod
				+ ", eduWriteTime=" + eduWriteTime + "]";
	}

	public EduListDto(int eduId, String eduSubject, String eduParticipant, String eduMonth, String eduBookPeriod,
			String eduPeriod, String eduWriteTime) {
		super();
		this.eduId = eduId;
		this.eduSubject = eduSubject;
		this.eduParticipant = eduParticipant;
		this.eduMonth = eduMonth;
		this.eduBookPeriod = eduBookPeriod;
		this.eduPeriod = eduPeriod;
		this.eduWriteTime = eduWriteTime;
	}

	public int getEduId() {
		return eduId;
	}

	public String getEduSubject() {
		return eduSubject;
	}

	public String getEduParticipant() {
		return eduParticipant;
	}

	public String getEduMonth() {
		return eduMonth;
	}

	public String getEduBookPeriod() {
		return eduBookPeriod;
	}

	public String getEduPeriod() {
		return eduPeriod;
	}

	public String getEduWriteTime() {
		return eduWriteTime;
	}

}
