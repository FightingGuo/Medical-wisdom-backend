package com.ruoyi.project.medicine.service.Impl;

import com.ruoyi.project.medicine.domain.MedicineInfo;
import com.ruoyi.project.medicine.domain.MedicineList;
import com.ruoyi.project.medicine.mapper.MedicineInfoMapper;
import com.ruoyi.project.medicine.service.MedicineInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Date 2023/1/31 /10:34
 * @Author guohc
 * @Description
 */
@Service
public class MedicineInfoServiceImpl implements MedicineInfoService {

    @Autowired
    MedicineInfoMapper medicineInfoMapper;


    /**
     * 根据条件分页查询药品数据
     *
     * @param medicineInfo 药品信息
     * @return 药品数据集合信息
     */
    @Override
    public List<MedicineInfo> selectMedicineInfoList(MedicineInfo medicineInfo) {
        return medicineInfoMapper.selectMedicineInfoList(medicineInfo);
    }

    /**
     * 通过药品ID查询药品
     *
     * @param medicineInfoId 药品ID
     * @return 药品对象信息
     */
    @Override
    public MedicineInfo selectMedicineInfoById(Long medicineInfoId) {
        return medicineInfoMapper.selectMedicineInfoById(medicineInfoId);
    }

    /**
     * 校验药品名称是否唯一
     *
     * @param medicineInfoName 药品名称
     * @return 药品信息
     */
    @Override
    public MedicineInfo checkMedicineInfoNameUnique(String medicineInfoName) {
        return medicineInfoMapper.checkMedicineInfoNameUnique(medicineInfoName);
    }

    /**
     * 校验药品编码是否唯一
     *
     * @param medicineInfoCode 药品编码
     * @return 药品信息
     */
    @Override
    public MedicineInfo checkMedicineInfoCodeUnique(String medicineInfoCode) {
        return medicineInfoMapper.checkMedicineInfoNameUnique(medicineInfoCode);
    }

    /**
     * 修改药品信息
     *
     * @param medicineInfo 药品信息
     * @return 结果
     */
    @Override
    public int updateMedicineInfo(MedicineInfo medicineInfo) {
        return medicineInfoMapper.updateMedicineInfo(medicineInfo);
    }

    /**
     * 修改药品状态
     *
     * @param medicineInfo 药品信息
     * @return
     */
    @Override
    public int updateMedicineInfoStatus(MedicineInfo medicineInfo) {
        return medicineInfoMapper.updateMedicineInfoStatus(medicineInfo);
    }

    /**
     * 新增药品信息
     *
     * @param medicineInfo 药品信息
     * @return 结果
     */
    @Override
    public int insertMedicineInfo(MedicineInfo medicineInfo) {
        return medicineInfoMapper.insertMedicineInfo(medicineInfo);
    }

    /**
     * 通过药品ID删除药品
     *
     * @param medicineInfoId 药品ID
     * @return 结果
     */
    @Override
    public int deleteMedicineInfoById(Long medicineInfoId) {
        return medicineInfoMapper.deleteMedicineInfoById(medicineInfoId);
    }

    /**
     * 批量删除药品信息
     *
     * @param medicineInfoIds 需要删除的药品ID
     * @return 结果
     */
    @Override
    public int deleteMedicineInfoByIds(Long[] medicineInfoIds) {
        return medicineInfoMapper.deleteMedicineInfoByIds(medicineInfoIds);
    }

    /**
     * 获取药品信息下拉列表
     *
     * @return
     */
    public List<MedicineList> selectMedicineList(){
        return medicineInfoMapper.selectMedicineList();
    }
}
