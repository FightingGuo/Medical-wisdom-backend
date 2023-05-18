package com.ghc.project.media.domain;

import com.ghc.framework.aspectj.lang.annotation.Excel;
import com.ghc.framework.web.domain.BaseEntity;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

/**
 * @Date 2023/1/11 /8:58
 * @Author guohc
 * @Description 医疗系统 用户表(医师表)
 */
@Data
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

    @Excel(name = "挂号数")
    private Long count;

    /** 密码 */
    @Excel(name = "密码")
    @NotBlank(message = "密码不能为空")
    @Size(min = 6, max = 20, message = "密码长度不少与6个字符不能超过20个字符")
    private String password;

    /** 手机号码 */
    @Excel(name = "手机号码")
    @NotBlank(message = "手机号码不能为空")
    @Size(min = 0, max = 11, message = "手机号码长度不能超过11个字符")
    private String phoneNumber;

    /** 级别 */
    @Excel(name = "级别")
    @NotBlank(message = "级别不能为空")
    private String grade;

    /** 背景 */
    @Excel(name = "背景")
    @NotBlank(message = "学历不能为空")
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

    /**
     * 判断用户是否为管理员用户
     * @return
     */
    public boolean isAdmin()
    {
        return isAdmin(this.userId);
    }

    public static boolean isAdmin(Long userId)
    {
        return userId != null && 1L == userId;
    }
}
