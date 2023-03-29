package com.ghc.project.medicine.mapper;

import com.ghc.project.medicine.domain.MedicinePurchase;

import java.util.List;

/**
 * @Date 2023/2/1 /17:51
 * @Author guohc
 * @Description
 */
public interface MedicinePurchaseMapper {

    /**
     * 查询【采购】
     *
     * @param purId 【请填写功能名称】ID
     * @return 【请填写功能名称】
     */
    MedicinePurchase selectMedicinePurchaseById(String purId);

    /**
     * 查询【采购】列表
     *
     * @param medicinePurchase 【请填写功能名称】
     * @return 【请填写功能名称】集合
     */
    List<MedicinePurchase> selectMedicinePurchaseList(MedicinePurchase medicinePurchase);

    /**
     * 新增【采购】
     *
     * @param medicinePurchase 【请填写功能名称】
     * @return 结果
     */
    int insertMedicinePurchase(MedicinePurchase medicinePurchase);

    /**
     * 修改【采购】
     *
     * @param medicinePurchase 【请填写功能名称】
     * @return 结果
     */
    int updateMedicinePurchase(MedicinePurchase medicinePurchase);

//    /**
//     * 删除【采购】
//     *
//     * @param purId 【请填写功能名称】ID
//     * @return 结果
//     */
//    int deleteMedicinePurchaseById(String purId);

    /**
     * 批量删除【采购】
     *
     * @param purIds 需要删除的数据ID
     * @return 结果
     */
    int deleteMedicinePurchaseByIds(String[] purIds);


    /**
     * 提交审核
     *
     * @param medicinePurchase
     * @return
     */
    int submitAudit(MedicinePurchase medicinePurchase);
}
