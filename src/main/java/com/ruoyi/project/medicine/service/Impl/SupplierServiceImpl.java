package com.ruoyi.project.medicine.service.Impl;

import com.ruoyi.project.medicine.domain.Supplier;
import com.ruoyi.project.medicine.domain.SupplierList;
import com.ruoyi.project.medicine.mapper.SupplierMapper;
import com.ruoyi.project.medicine.service.SupplierService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Date 2023/2/1 /9:16
 * @Author guohc
 * @Description
 */
@Service
public class SupplierServiceImpl implements SupplierService {

    @Autowired
    private SupplierMapper supplierMapper;


    /**
     * 根据条件分页查询供应商数据
     *
     * @param supplier 供应商信息
     * @return 供应商数据集合信息
     */
    @Override
    public List<Supplier> selectSupplierList(Supplier supplier) {
        return supplierMapper.selectSupplierList(supplier);
    }

    /**
     * 通过供应商ID查询供应商
     *
     * @param supplierId 供应商ID
     * @return 供应商对象信息
     */
    @Override
    public Supplier selectSupplierById(Long supplierId) {
        return supplierMapper.selectSupplierById(supplierId);
    }

    /**
     * 校验供应商名称是否唯一
     *
     * @param supplierName 供应商名称
     * @return 供应商信息
     */
    @Override
    public Supplier checkSupplierNameUnique(String supplierName) {
        return supplierMapper.checkSupplierNameUnique(supplierName);
    }

    /**
     * 修改供应商信息
     *
     * @param supplier 供应商信息
     * @return 结果
     */
    @Override
    public int updateSupplier(Supplier supplier) {
        return supplierMapper.updateSupplier(supplier);
    }

    /**
     * 修改供应商状态
     *
     * @param supplier 供应商信息
     * @return
     */
    @Override
    public int updateSupplierStatus(Supplier supplier) {
        return supplierMapper.updateSupplierStatus(supplier);
    }

    /**
     * 新增供应商信息
     *
     * @param supplier 供应商信息
     * @return 结果
     */
    @Override
    public int insertSupplier(Supplier supplier) {
        return supplierMapper.insertSupplier(supplier);
    }

    /**
     * 批量删除供应商信息
     *
     * @param supplierIds 需要删除的供应商ID
     * @return 结果
     */
    @Override
    public int deleteSupplierByIds(Long[] supplierIds) {
        return supplierMapper.deleteSupplierByIds(supplierIds);
    }

    /**
     * 获取供应商下拉列表
     *
     * @return
     */
    public List<SupplierList> getSupplierList(){
        return supplierMapper.getSupplierList();
    }
}
