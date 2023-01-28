package com.ruoyi.project.media.domain;

import com.ruoyi.framework.aspectj.lang.annotation.Excel;
import com.ruoyi.framework.web.domain.BaseEntity;
import lombok.Data;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import java.util.List;

/**
 * @Date 2023/1/11 /8:58
 * @Author guohc
 * @Description 医疗系统 用户表(医师表)
 */
public class MediaUser extends BaseEntity {

    /** 用户ID */
    @Excel(name = "用户ID",cellType = Excel.ColumnType.NUMERIC)
    private Long userId;

    /** 用户名 */
    @Excel(name = "用户名")
    private String userName;

    /** 部门 */
    @Excel(name = "部门id")
    private Long deptId;

    /** 密码 */
    @Excel(name = "密码")
    private String password;

    /** 手机号码 */
    @Excel(name = "手机号码")
    private String phoneNumber;

    /** 级别 */
    @Excel(name = "级别")
    private String grade;

    /** 背景 */
    @Excel(name = "背景")
    private String background;

    /** 用户性别 */
    @Excel(name = "用户性别", readConverterExp = "0=男,1=女,2=未知")
    private String sex;

    /** 删除标志（0代表存在 2代表删除） */
    private String delFlag;

    /** 年龄 */
    @Excel(name = "年龄")
    private String age;

    /** 是否排班 */
    @Excel(name = "是否排班",readConverterExp = "是否排班(0是 1否)")
    private String scheduling;

    /** 状态 */
    @Excel(name = "状态", readConverterExp = "状态(0正常 1停用)")
    private String status;

    @Excel(name = "部门")
    private String deptName;

    public void setDeptName(String deptName) {
        this.deptName = deptName;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public boolean isAdmin()
    {
        return isAdmin(this.userId);
    }

    public static boolean isAdmin(Long userId)
    {
        return userId != null && 1L == userId;
    }

    @NotBlank(message = "用户名不能为空")
    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
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

//    public void setDeptName(String deptName) {
//        this.deptName = deptName;
//    }

    @NotBlank(message = "手机号码不能为空")
    @Size(min = 0, max = 11, message = "手机号码长度不能超过11个字符")
    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    @NotBlank(message = "级别不能为空")
    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    @NotBlank(message = "学历不能为空")
    public String getBackground() {
        return background;
    }

    public void setBackground(String background) {
        this.background = background;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public String getScheduling() {
        return scheduling;
    }

    public void setScheduling(String scheduling) {
        this.scheduling = scheduling;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @NotBlank(message = "密码不能为空")
    @Size(min = 6, max = 20, message = "密码长度不少与6个字符不能超过20个字符")
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getDelFlag() {
        return delFlag;
    }

    public void setDelFlag(String delFlag) {
        this.delFlag = delFlag;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("userId", getUserId())
                .append("userName", getUserName())
                .append("password",getPassword())
                .append("phoneNumber", getPhoneNumber())
                .append("grade",getGrade())
                .append("background",getBackground())
                .append("sex",getSex())
                .append("age",getAge())
                .append("delFag",getDelFlag())
                .append("scheduling",getScheduling())
                .append("status", getStatus())
                .append("createBy", getCreateBy())
                .append("createTime", getCreateTime())
                .append("updateBy", getUpdateBy())
                .append("updateTime", getUpdateTime())
                .append("remark", getRemark())
                .toString();
    }
}
