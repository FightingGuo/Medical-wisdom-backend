package com.ghc.project.media.domain;

import com.ghc.framework.aspectj.lang.annotation.Excel;
import com.ghc.framework.web.domain.BaseEntity;
import lombok.Data;

import javax.validation.constraints.NotBlank;

/**
 * @Date 2023/1/11 /8:58
 * @Author guohc
 * @Description 医疗系统 部门表(科室表)
 */
@Data
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
}
