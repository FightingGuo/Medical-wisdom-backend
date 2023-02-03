package com.ruoyi.project.medicine.service.Impl;

import com.ruoyi.project.medicine.domain.MedicinePurchase;
import com.ruoyi.project.medicine.mapper.MedicinePurchaseMapper;
import com.ruoyi.project.medicine.service.MedicinePurchaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Date 2023/2/2 /10:06
 * @Author guohc
 * @Description
 */
@Service
public class MedicinePurchaseServiceImpl implements MedicinePurchaseService {

    @Autowired
    private MedicinePurchaseMapper medicinePurchaseMapper;


    /**
     * 查询【采购】
     *
     * @param purId 【请填写功能名称】ID
     * @return 【请填写功能名称】
     */
    @Override
    public MedicinePurchase selectMedicinePurchaseById(String purId) {
        return medicinePurchaseMapper.selectMedicinePurchaseById(purId);
    }

    /**
     * 查询【采购】列表
     *
     * @param medicinePurchase 【请填写功能名称】
     * @return 【请填写功能名称】集合
     */
    @Override
    public List<MedicinePurchase> selectMedicinePurchaseList(MedicinePurchase medicinePurchase) {
        return medicinePurchaseMapper.selectMedicinePurchaseList(medicinePurchase);
    }

    /**
     * 新增【采购】
     *
     * @param medicinePurchase 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int insertMedicinePurchase(MedicinePurchase medicinePurchase) {
        return medicinePurchaseMapper.insertMedicinePurchase(medicinePurchase);
    }

    /**
     * 修改【采购】
     *
     * @param medicinePurchase 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int updateMedicinePurchase(MedicinePurchase medicinePurchase) {
        return medicinePurchaseMapper.updateMedicinePurchase(medicinePurchase);
    }

    /**
     * 批量删除【采购】
     *
     * @param purIds 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteMedicinePurchaseByIds(String[] purIds) {
        return medicinePurchaseMapper.deleteMedicinePurchaseByIds(purIds);
    }

    /**
     * 提交审核
     *
     * @param medicinePurchase
     * @return
     */
    @Override
    public int submitAudit(MedicinePurchase medicinePurchase) {
        return medicinePurchaseMapper.submitAudit(medicinePurchase);
    }

    /**
     * 提交入库
     *
     * @param medicinePurchase
     * @return
     */
    @Override
    public int submitEntryDB(MedicinePurchase medicinePurchase) {
        return medicinePurchaseMapper.submitEntryDB(medicinePurchase);
    }

    /**
     * 审核通过
     *
     * @param medicinePurchase
     * @return
     */
    @Override
    public int auditAccess(MedicinePurchase medicinePurchase) {
        return medicinePurchaseMapper.AuditAccess(medicinePurchase);
    }


}
