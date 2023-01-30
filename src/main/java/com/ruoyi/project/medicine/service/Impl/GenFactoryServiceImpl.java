package com.ruoyi.project.medicine.service.Impl;

import com.ruoyi.project.medicine.domain.GenFactory;
import com.ruoyi.project.medicine.mapper.GenFactoryMapper;
import com.ruoyi.project.medicine.service.GenFactoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Date 2023/1/30 /8:54
 * @Author guohc
 * @Description
 */
@Service
public class GenFactoryServiceImpl implements GenFactoryService {

    @Autowired
    private GenFactoryMapper genFactoryMapper;

    /**
     * 根据条件分页查询厂家数据
     *
     * @param factory 厂家信息
     * @return 厂家数据集合信息
     */
    @Override
    public List<GenFactory> selectFactoryList(GenFactory factory) {
        return genFactoryMapper.selectFactoryList(factory);
    }

    /**
     * 通过厂家ID查询厂家
     *
     * @param factoryId 厂家ID
     * @return 厂家对象信息
     */
    @Override
    public GenFactory selectFactoryById(Long factoryId) {
        return genFactoryMapper.selectFactoryById(factoryId);
    }

    /**
     * 修改厂家状态
     *
     * @param factory 厂家信息
     * @return
     */
    @Override
    public int updateFactoryStatus(GenFactory factory) {
        return genFactoryMapper.updateFactoryStatus(factory);
    }

    /**
     * 校验厂家名称是否唯一
     *
     * @param factoryName 厂家名称
     * @return 厂家信息
     */
    @Override
    public GenFactory checkFactoryNameUnique(String factoryName) {
        return genFactoryMapper.checkFactoryNameUnique(factoryName);
    }

    /**
     * 校验厂家编码是否唯一
     *
     * @param factoryCode 厂家编码
     * @return 厂家信息
     */
    @Override
    public GenFactory checkFactoryCodeUnique(String factoryCode) {
        return genFactoryMapper.checkFactoryCodeUnique(factoryCode);
    }

    /**
     * 修改厂家信息
     *
     * @param factory 厂家信息
     * @return 结果
     */
    @Override
    public int updateFactory(GenFactory factory) {
        return genFactoryMapper.updateFactory(factory);
    }

    /**
     * 新增厂家信息
     *
     * @param factory 厂家信息
     * @return 结果
     */
    @Override
    public int insertFactory(GenFactory factory) {
        return genFactoryMapper.insertFactory(factory);
    }

    /**
     * 通过厂家ID删除厂家
     *
     * @param factoryId 厂家ID
     * @return 结果
     */
    @Override
    public int deleteFactoryById(Long factoryId) {
        return genFactoryMapper.deleteFactoryById(factoryId);
    }

    /**
     * 批量删除厂家信息
     *
     * @param factoryIds 需要删除的厂家ID
     * @return 结果
     */
    @Override
    public int deleteFactoryByIds(Long[] factoryIds) {
        return genFactoryMapper.deleteFactoryByIds(factoryIds);
    }
}
