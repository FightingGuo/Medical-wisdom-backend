package com.ruoyi.project.media.domain;

import com.ruoyi.framework.aspectj.lang.annotation.Excel;
import com.ruoyi.framework.web.domain.BaseEntity;
import lombok.Data;

import javax.validation.constraints.NotBlank;

/**
 * @Date 2023/1/28 /10:55
 * @Author guohc
 * @Description 角色表
 */
@Data
public class MediaRole extends BaseEntity {
    /**
     * 角色编号
     */
    @Excel(name = "角色编号",cellType = Excel.ColumnType.NUMERIC)
    private Long roleId;

    /**
     * 角色名称
     */
    @Excel(name = "角色名称")
    @NotBlank(message = "科室名称不能为空")
    private String roleName;

    /**
     * 权限编号
     */
    @Excel(name = "权限编号")
    @NotBlank(message = "权限编号不能为空")
    private String roleAuth;

    /**
     * 显示顺序
     */
    @Excel(name = "显示顺序",cellType = Excel.ColumnType.NUMERIC)
    private Long roleSort;

    /**
     * 状态
     */
    @Excel(name = "状态", readConverterExp = "0=正常,1=停用")
    private String status;

    /**
     * 备注
     */
    @Excel(name = "备注")
    private String remark;

    /**
     * 是否删除
     */
    private String delFlag;

    /**
     * 判断用户是否为管理员用户
     * @return
     */
    public boolean isAdmin()
    {
        return isAdmin(this.roleId);
    }

    public static boolean isAdmin(Long roleId)
    {
        return roleId != null && 1L == roleId;
    }

}
