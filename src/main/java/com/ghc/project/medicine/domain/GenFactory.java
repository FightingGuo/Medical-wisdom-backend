package com.ghc.project.medicine.domain;

import com.ghc.framework.aspectj.lang.annotation.Excel;
import com.ghc.framework.web.domain.BaseEntity;
import lombok.Data;

import javax.validation.constraints.NotBlank;

/**
 * @Date 2023/1/30 /8:35
 * @Author guohc
 * @Description 生产厂家实体
 */
@Data
public class GenFactory extends BaseEntity {
    /**
     * 厂家ID
     */
    @Excel(name = "厂家ID")
    private Long factoryId;

    /**
     * 厂家名称
     */
    @NotBlank
    @Excel(name = "厂家名称")
    private String factoryName;

    /**
     * 厂家编码
     */
    @Excel(name = "厂家编码")
    private String factoryCode;

    /**
     * 联系人
     */
    @Excel(name = "联系人")
    private String contact;

    /**
     * 厂家电话
     */
    @NotBlank(message = "厂家电话不能为空")
    @Excel(name = "厂家电话")
    private String telephoneNum;

    /**
     * 关键字
     */
    @Excel(name = "关键字")
    private String key;

    /**
     * 状态(0正常 1停用)
     */
    @Excel(name = "状态")
    private String status;

    /**
     * 删除标志
     */
    private String delFlag;

    /**
     * 地址
     */
    @Excel(name = "地址")
    private String address;
}
