package cn.ssm.bean;

import java.util.Date;

public class Customer {
    private Integer custId;

    private String custName;

    private String custAge;

    private String custGender;

    private Integer custUserId;

    private String custSource;

    private String custIndustry;

    private String custLevel;

    private String custPhone;

    private String custEmail;

    private String custAddress;

    private Date custCreatetime;
    private Integer start;
    private Integer rows;
    private String startTime;
    private String endTime;
    

    public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public Integer getStart() {
		return start;
	}

	public void setStart(Integer start) {
		this.start = start;
	}
	

	public Integer getRows() {
		return rows;
	}

	public void setRows(Integer rows) {
		this.rows = rows;
	}

	public Integer getCustId() {
        return custId;
    }

    public void setCustId(Integer custId) {
        this.custId = custId;
    }

    public String getCustName() {
        return custName;
    }

    public void setCustName(String custName) {
        this.custName = custName == null ? null : custName.trim();
    }

    public String getCustAge() {
        return custAge;
    }

    public void setCustAge(String custAge) {
        this.custAge = custAge == null ? null : custAge.trim();
    }

    public String getCustGender() {
        return custGender;
    }

    public void setCustGender(String custGender) {
        this.custGender = custGender == null ? null : custGender.trim();
    }

    public Integer getCustUserId() {
        return custUserId;
    }

    public void setCustUserId(Integer custUserId) {
        this.custUserId = custUserId;
    }

    public String getCustSource() {
        return custSource;
    }

    public void setCustSource(String custSource) {
        this.custSource = custSource == null ? null : custSource.trim();
    }

    public String getCustIndustry() {
        return custIndustry;
    }

    public void setCustIndustry(String custIndustry) {
        this.custIndustry = custIndustry == null ? null : custIndustry.trim();
    }

    public String getCustLevel() {
        return custLevel;
    }

    public void setCustLevel(String custLevel) {
        this.custLevel = custLevel == null ? null : custLevel.trim();
    }

    public String getCustPhone() {
        return custPhone;
    }

    public void setCustPhone(String custPhone) {
        this.custPhone = custPhone == null ? null : custPhone.trim();
    }

    public String getCustEmail() {
        return custEmail;
    }

    public void setCustEmail(String custEmail) {
        this.custEmail = custEmail == null ? null : custEmail.trim();
    }

    public String getCustAddress() {
        return custAddress;
    }

    public void setCustAddress(String custAddress) {
        this.custAddress = custAddress == null ? null : custAddress.trim();
    }

    public Date getCustCreatetime() {
        return custCreatetime;
    }

    public void setCustCreatetime(Date custCreatetime) {
        this.custCreatetime = custCreatetime;
    }
}