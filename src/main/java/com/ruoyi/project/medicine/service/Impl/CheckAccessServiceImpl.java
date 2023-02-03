package com.ruoyi.project.medicine.service.Impl;

import com.ruoyi.project.medicine.domain.MedicinePurchase;
import com.ruoyi.project.medicine.mapper.CheckAccessMapper;
import com.ruoyi.project.medicine.service.CheckAccessService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Date 2023/2/3 /13:55
 * @Author guohc
 * @Description
 */

@Service
public class CheckAccessServiceImpl implements CheckAccessService {

    @Autowired
    private CheckAccessMapper checkAccessMapper;


    /**
     * 查询【采购】列表
     *
     * @return 【请填写功能名称】集合
     */
    @Override
    public List<MedicinePurchase> selectMedicinePurchaseList() {
        return checkAccessMapper.selectMedicinePurchaseList();
    }

    /**
     * 审核通过
     *
     * @param ids
     * @return
     */
    @Override
    public int auditAccess(String[] ids){
        return checkAccessMapper.auditAccess(ids);
    }

    /**
     * 审核通过
     *
     * @param ids
     * @return
     */
    @Override
    public int invalidCheck(String[] ids){
        return checkAccessMapper.invalidCheck(ids);
    }

    /**
     * 提交入库
     *
     * @param medicinePurchase
     * @return
     */
    @Override
    public int submitEntryDB(MedicinePurchase medicinePurchase) {
        return checkAccessMapper.submitEntryDB(medicinePurchase);
    }
}
