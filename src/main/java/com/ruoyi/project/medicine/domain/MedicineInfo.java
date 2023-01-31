package com.ruoyi.project.medicine.domain;

import com.ruoyi.framework.aspectj.lang.annotation.Excel;
import com.ruoyi.framework.web.domain.BaseEntity;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import java.math.BigDecimal;

/**
 * @Date 2023/1/31 /9:36
 * @Author guohc
 * @Description 药品信息实体
 */
@Data
public class MedicineInfo extends BaseEntity {

    /**
     * 药品ID
     */
    @Excel(name = "药品ID")
    private Long medicineId;

    /**
     * 药品名称
     */
    @Excel(name = "药品名称")
    private String medicineName;

    /**
     * 药品名称
     */
    @Excel(name = "药品编码")
    private String medicineCode;

    /**
     * 生产厂家ID
     */
    @Excel(name = "生产厂家ID")
    private Long factoryId;

    /**
     * 厂家名称
     */
    @Excel(name = "厂家名称")
    private String factoryName;

    /**
     * 药品类型
     */
    @Excel(name = "药品类型")
    private String medicineType;

    /**
     * 处方类型
     */
    @Excel(name = "处方类型")
    private String prescriptionType;

    /**
     * 单位
     */
    @Excel(name = "单位")
    private String unit;

    /**
     * 药品价格
     */
    @Excel(name = "药品价格")
    private BigDecimal medicinePrice;

    /**
     * 商品库存
     */
    @Excel(name = "药品库存")
    private Long stock;

    /**
     * 预警值
     */
    @Excel(name = "预警值")
    private Long warnValue;

    /**
     * 换算量
     */
    @Excel(name = "换算量")
    private String convertQuantity;

    /**
     * 状态
     */
    @Excel(name = "状态")
    private String status;

    /**
     * 删除标志
     */
    private String delFlag;

}
