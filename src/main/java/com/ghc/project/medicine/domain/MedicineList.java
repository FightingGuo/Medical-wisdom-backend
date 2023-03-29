package com.ghc.project.medicine.domain;

import lombok.Data;

/**
 * @Date 2023/2/9 /13:44
 * @Author guohc
 * @Description 药品信息下拉列表实体
 */
@Data
public class MedicineList {
    private Long medicineId;

    private String medicineName;
}
