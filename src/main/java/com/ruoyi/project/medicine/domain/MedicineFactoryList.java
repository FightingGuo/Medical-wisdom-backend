package com.ruoyi.project.medicine.domain;

import lombok.Data;

/**
 * @Date 2023/1/31 /10:31
 * @Author guohc
 * @Description 生产厂家下拉数据实体
 */
@Data
public class MedicineFactoryList {

    /**
     * 厂家名称
     */
    private String factoryName;

    /**
     * 厂家ID
     */
    private Long factoryId;
}
