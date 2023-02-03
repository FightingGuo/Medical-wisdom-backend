package com.ruoyi.project.medicine.mapper;

import com.ruoyi.project.medicine.domain.MedicinePurchase;

import java.util.List;

/**
 * @Date 2023/2/3 /13:39
 * @Author guohc
 * @Description
 */
public interface CheckAccessMapper {

    /**
     * 查询【采购】列表
     *
     * @return 【请填写功能名称】集合
     */
    List<MedicinePurchase> selectMedicinePurchaseList();

    /**
     * 审核通过
     *
     * @param purIds 订单id
     * @return
     */
    int auditAccess(String[] purIds);

    /**
     * 订单作废
     *
     * @param purIds 订单id
     * @return
     */
    int invalidCheck(String[] purIds);

    /**
     * 提交入库
     *
     * @param medicinePurchase
     * @return
     */
    int submitEntryDB(MedicinePurchase medicinePurchase);
}
