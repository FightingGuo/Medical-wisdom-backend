package com.ghc.project.medicine.domain;

import com.ghc.framework.web.domain.BaseEntity;
import lombok.Data;

import javax.validation.constraints.NotBlank;

/**
 * @Date 2023/1/31 /17:51
 * @Author guohc
 * @Description 供应商实体
 */
@Data
public class Supplier extends BaseEntity {

    /**
     * 供应商id
     */
    private Long supplierId;

    /**
     * 供应商名称
     */
    @NotBlank
    private String supplierName;

    /**
     * 联系人
     */
    private String contact;

    /**
     * 联系人电话
     */
    private String telephoneNum;

    /**
     * 供应商收款账号
     */
    private String bankCount;

    /**
     * 供应商地址
     */
    private String address;

    /**
     * 删除标志
     */
    private String delFlag;

    /**
     * 状态
     */
    private String status;

}
