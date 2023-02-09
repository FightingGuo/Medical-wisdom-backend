package com.ruoyi.project.medicine.mapper;

import com.ruoyi.project.medicine.domain.MedicineFactoryList;
import com.ruoyi.project.medicine.domain.MedicineInfo;
import com.ruoyi.project.medicine.domain.MedicineList;

import java.util.List;

/**
 * @Date 2023/1/31 /9:49
 * @Author guohc
 * @Description 药品信息数据层
 */
public interface MedicineInfoMapper {
    
    /**
     * 根据条件分页查询药品数据
     *
     * @param medicineInfo 药品信息
     * @return 药品数据集合信息
     */
    List<MedicineInfo> selectMedicineInfoList(MedicineInfo medicineInfo);

    /**
     * 通过药品ID查询药品
     *
     * @param medicineInfoId 药品ID
     * @return 药品对象信息
     */
    MedicineInfo selectMedicineInfoById(Long medicineInfoId);

    /**
     * 校验药品名称是否唯一
     *
     * @param medicineInfoName 药品名称
     * @return 药品信息
     */
    MedicineInfo checkMedicineInfoNameUnique(String medicineInfoName);

    /**
     * 校验药品编码是否唯一
     *
     * @param medicineInfoCode 药品编码
     * @return 药品信息
     */
    MedicineInfo checkMedicineInfoCodeUnique(String medicineInfoCode);

    /**
     * 修改药品信息
     *
     * @param medicineInfo 药品信息
     * @return 结果
     */
    int updateMedicineInfo(MedicineInfo medicineInfo);

    /**
     * 修改药品状态
     *
     * @param medicineInfo 药品信息
     * @return
     */
    int updateMedicineInfoStatus(MedicineInfo medicineInfo);


    /**
     * 新增药品信息
     *
     * @param medicineInfo 药品信息
     * @return 结果
     */
    int insertMedicineInfo(MedicineInfo medicineInfo);

    /**
     * 通过药品ID删除药品
     *
     * @param medicineInfoId 药品ID
     * @return 结果
     */
    int deleteMedicineInfoById(Long medicineInfoId);

    /**
     * 批量删除药品信息
     *
     * @param medicineInfoIds 需要删除的药品ID
     * @return 结果
     */
    int deleteMedicineInfoByIds(Long[] medicineInfoIds);

    /**
     * 获取药品信息下拉列表
     *
     * @return
     */
    List<MedicineList> selectMedicineList();

}
