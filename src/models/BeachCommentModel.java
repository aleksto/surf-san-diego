package models;

public class BeachCommentModel {
	
	private int beachId;
	private String comment;
	private UserInfoModel userInfoModel;


	public BeachCommentModel(int beachId, UserInfoModel userInfoModel, String comment){
		this.beachId = beachId;
		this.userInfoModel = userInfoModel;
		this.comment = comment;	
	}

	public void setBeachId(int beachId) {
		this.beachId = beachId;
	}

	public int getBeachId() {
		return beachId;
	}
	

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getComment() {
		return comment;
	}

	public void setUserInfoModel(UserInfoModel userInfoModel) {
		this.userInfoModel = userInfoModel;
	}

	public UserInfoModel getUserInfoModel() {
		return userInfoModel;
	}

}

