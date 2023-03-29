package com.ghc.project.medicine.service;

import com.ghc.project.medicine.domain.MedicinePurchase;

import java.util.List;

/**
 * @Date 2023/2/3 /13:41
 * @Author guohc
 * @Description
 */
public interface CheckAccessService {

    /**
     * 查询【采购】列表
     *
     * @return 【请填写功能名称】集合
     */
    List<MedicinePurchase> selectMedicinePurchaseList();

    /**
     * 审核通过
     *
     * @param ids
     * @return
     */
    int auditAccess(String[] ids);

    /**
     * 订单作废
     *
     * @param ids
     * @return
     */
    int invalidCheck(String[] ids);

    /**
     * 提交入库
     *
     * @param medicinePurchase
     * @return
     */
    int submitEntryDB(MedicinePurchase medicinePurchase);
}
