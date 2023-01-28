package com.ruoyi.project.media.domain;

import com.ruoyi.framework.aspectj.lang.annotation.Excel;
import com.ruoyi.framework.web.domain.BaseEntity;
import lombok.Data;

import javax.validation.constraints.NotBlank;

public class MediaDept extends BaseEntity {
    private static final long serialVersionUID = 1L;

    @Excel(name = "科室编号",cellType = Excel.ColumnType.NUMERIC)
    private Long deptId;
    @Excel(name = "科室名称")
    @NotBlank(message = "科室名称不能为空")
    private String deptName;
    @Excel(name = "科室编码")
    @NotBlank(message = "科室编号不能为空")
    private String deptCode;
    @Excel(name = "挂号总量",cellType = Excel.ColumnType.NUMERIC)
    private Long deptNum;
    @Excel(name = "负责人")
    private String deptLeader;
    @Excel(name = "电话")
    private String deptPhone;
    @Excel(name = "状态", readConverterExp = "0=正常,1=停用")
    private String status;
    @Excel(name = "排序码",cellType = Excel.ColumnType.NUMERIC)
    private Integer deptSort;

    public Integer getDeptSort() {
        return deptSort;
    }

    public void setDeptSort(Integer deptSort) {
        this.deptSort = deptSort;
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Long getDeptId() {
        return deptId;
    }

    public void setDeptId(Long deptId) {
        this.deptId = deptId;
    }

    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName;
    }

    public String getDeptCode() {
        return deptCode;
    }

    public void setDeptCode(String deptCode) {
        this.deptCode = deptCode;
    }

    public Long getDeptNum() {
        return deptNum;
    }

    public void setDeptNum(Long deptNum) {
        this.deptNum = deptNum;
    }

    public String getDeptLeader() {
        return deptLeader;
    }

    public void setDeptLeader(String deptLeader) {
        this.deptLeader = deptLeader;
    }

    public String getDeptPhone() {
        return deptPhone;
    }

    public void setDeptPhone(String deptPhone) {
        this.deptPhone = deptPhone;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

}
