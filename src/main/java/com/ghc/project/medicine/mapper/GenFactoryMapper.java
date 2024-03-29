package com.ghc.project.medicine.mapper;

import com.ghc.project.medicine.domain.GenFactory;
import com.ghc.project.medicine.domain.MedicineFactoryList;

import java.util.List;

/**
 * @Date 2023/1/30 /8:53
 * @Author guohc
 * @Description  生产厂家 数据层
 */
public interface GenFactoryMapper {
    /**
     * 根据条件分页查询厂家数据
     *
     * @param factory 厂家信息
     * @return 厂家数据集合信息
     */
    List<GenFactory> selectFactoryList(GenFactory factory);

    /**
     * 通过厂家ID查询厂家
     *
     * @param factoryId 厂家ID
     * @return 厂家对象信息
     */
    GenFactory selectFactoryById(Long factoryId);

    /**
     * 校验厂家名称是否唯一
     *
     * @param factoryName 厂家名称
     * @return 厂家信息
     */
    GenFactory checkFactoryNameUnique(String factoryName);

    /**
     * 校验厂家编码是否唯一
     *
     * @param factoryCode 厂家编码
     * @return 厂家信息
     */
    GenFactory checkFactoryCodeUnique(String factoryCode);

    /**
     * 修改厂家信息
     *
     * @param factory 厂家信息
     * @return 结果
     */
    int updateFactory(GenFactory factory);

    /**
     * 修改厂家状态
     *
     * @param factory 厂家信息
     * @return
     */
    int updateFactoryStatus(GenFactory factory);


    /**
     * 新增厂家信息
     *
     * @param factory 厂家信息
     * @return 结果
     */
    int insertFactory(GenFactory factory);

    /**
     * 通过厂家ID删除厂家
     *
     * @param factoryId 厂家ID
     * @return 结果
     */
    int deleteFactoryById(Long factoryId);

    /**
     * 批量删除厂家信息
     *
     * @param factoryIds 需要删除的厂家ID
     * @return 结果
     */
    int deleteFactoryByIds(Long[] factoryIds);

    /**
     * 获取厂家名称下拉列表数据
     *
     * @return
     */
    List<MedicineFactoryList> getFactoryNameList();
}
