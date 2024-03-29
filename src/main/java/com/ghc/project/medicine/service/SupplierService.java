package com.ghc.project.medicine.service;

import com.ghc.project.medicine.domain.Supplier;
import com.ghc.project.medicine.domain.SupplierList;

import java.util.List;

/**
 * @Date 2023/2/1 /9:16
 * @Author guohc
 * @Description
 */
public interface SupplierService {

    /**
     * 根据条件分页查询供应商数据
     *
     * @param supplier 供应商信息
     * @return 供应商数据集合信息
     */
    List<Supplier> selectSupplierList(Supplier supplier);

    /**
     * 通过供应商ID查询供应商
     *
     * @param supplierId 供应商ID
     * @return 供应商对象信息
     */
    Supplier selectSupplierById(Long supplierId);

    /**
     * 校验供应商名称是否唯一
     *
     * @param supplierName 供应商名称
     * @return 供应商信息
     */
    Supplier checkSupplierNameUnique(String supplierName);

    /**
     * 修改供应商信息
     *
     * @param supplier 供应商信息
     * @return 结果
     */
    int updateSupplier(Supplier supplier);

    /**
     * 修改供应商状态
     *
     * @param supplier 供应商信息
     * @return
     */
    int updateSupplierStatus(Supplier supplier);


    /**
     * 新增供应商信息
     *
     * @param supplier 供应商信息
     * @return 结果
     */
    int insertSupplier(Supplier supplier);

    /**
     * 批量删除供应商信息
     *
     * @param supplierIds 需要删除的供应商ID
     * @return 结果
     */
    int deleteSupplierByIds(Long[] supplierIds);

    /**
     * 获取供应商下拉列表
     *
     * @return
     */
    List<SupplierList> getSupplierList();
}
