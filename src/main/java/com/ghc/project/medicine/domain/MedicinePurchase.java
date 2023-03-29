package com.ghc.project.medicine.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.ghc.framework.aspectj.lang.annotation.Excel;
import com.ghc.framework.web.domain.BaseEntity;
import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

/**
 * @Date 2023/1/31 /9:36
 * @Author guohc
 * @Description 药品采购实体
 */

@Data
public class MedicinePurchase extends BaseEntity {

    /** 单据ID */
    private String purId;

    /** 供应商ID */
    @Excel(name = "供应商ID")
    private Long supplierId;

    /** 供应商名称 */
    @Excel(name = "供应商名称")
    private String supplierName;

    /** 采购批发总额 */
    @Excel(name = "采购批发总额")
    private BigDecimal purTotal;

    /**
     * 采购数量
     */
    private Long purCount;

    /**
     * 采购单价
     */
    private BigDecimal purPrice;

    /**
     * 采购药品名称
     */
    private String medicineName;

    /**
     * 采购药品id (入库)
     */
    private Long medicineId;

    /** 采购状态； 1未提交2待审核 3审核通过 4审核失败 5作废 6入库成功  */
    @Excel(name = "采购状态； 1未提交2待审核 3审核通过 4审核失败 5作废 6入库成功 ")
    private String purStatus;

    /** 采购者 */
    @Excel(name = "采购者")
    private String purName;

    /**
     * 供应商地址
     */
    private String address;

    /** 入库操作时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "入库操作时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date purTime;

    private String delFlag;

    private Supplier supplier;

}
