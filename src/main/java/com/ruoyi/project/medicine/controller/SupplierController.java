package com.ruoyi.project.medicine.controller;

import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.framework.aspectj.lang.annotation.Log;
import com.ruoyi.framework.aspectj.lang.enums.BusinessType;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.framework.web.page.TableDataInfo;
import com.ruoyi.project.medicine.domain.Supplier;
import com.ruoyi.project.medicine.service.SupplierService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @Date 2023/2/1 /9:43
 * @Author guohc
 * @Description
 */
@RestController
@RequestMapping("/medicine/supplier")
public class SupplierController extends BaseController {
    
    @Autowired
    private SupplierService supplierService;
    
    
    /**
     * 查询供应商列表
     *
     * @param supplier
     * @return
     */
    @PreAuthorize("@ss.hasPermi('medicine:supplier:list')")
    @GetMapping("/list")
    public TableDataInfo list(Supplier supplier) {
        startPage();
        List<Supplier> list = supplierService.selectSupplierList(supplier);
        return getDataTable(list);
    }

    /**
     * 根据供应商编号获取详细信息
     */
    @PreAuthorize("@ss.hasPermi('medicine:supplier:query')")
    @GetMapping(value = "/{supplierId}")
    public AjaxResult getInfo(@PathVariable Long supplierId) {

        return AjaxResult.success(supplierService.selectSupplierById(supplierId));
    }

    /**
     * 新增供应商
     */
    @PreAuthorize("@ss.hasPermi('medicine:supplier:add')")
    @Log(title = "供应商管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@Validated @RequestBody Supplier supplier) {
        if (null != supplierService.checkSupplierNameUnique(supplier.getSupplierName())) {
            return AjaxResult.error("新增药品'" + supplier.getSupplierName() + "'失败，药品名称已存在");
        }
        supplier.setCreateBy(SecurityUtils.getUsername());
        return toAjax(supplierService.insertSupplier(supplier));
    }

    /**
     * 修改保存供应商
     */
    @PreAuthorize("@ss.hasPermi('medicine:supplier:edit')")
    @Log(title = "供应商管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@Validated @RequestBody Supplier supplier) {
        supplier.setUpdateBy(SecurityUtils.getUsername());

        if (supplierService.updateSupplier(supplier) > 0) {
            return AjaxResult.success();
        }
        return AjaxResult.error("修改供应商'" + supplier.getSupplierName() + "'失败，请联系管理员");
    }


    /**
     * 状态修改
     */
    @PreAuthorize("@ss.hasPermi('medicine:supplier:edit')")
    @Log(title = "供应商管理", businessType = BusinessType.UPDATE)
    @PutMapping("/changeStatus")
    public AjaxResult changeStatus(@RequestBody Supplier supplier) {
        supplier.setUpdateBy(SecurityUtils.getUsername());
        return toAjax(supplierService.updateSupplierStatus(supplier));
    }

    /**
     * 删除供应商
     */
    @PreAuthorize("@ss.hasPermi('medicine:supplier:remove')")
    @Log(title = "供应商管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{supplierIds}")
    public AjaxResult remove(@PathVariable Long[] supplierIds) {
        return toAjax(supplierService.deleteSupplierByIds(supplierIds));
    }

    /**
     * 供应商下拉列表
     */
    @Log(title = "供应商管理")
    @GetMapping("/getSupplierList")
    public AjaxResult getSupplierList() {
        return AjaxResult.success(supplierService.getSupplierList());
    }
}
