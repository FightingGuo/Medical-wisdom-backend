package com.ruoyi.project.medicine.controller;

import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.common.utils.SnowId;
import com.ruoyi.framework.aspectj.lang.annotation.Log;
import com.ruoyi.framework.aspectj.lang.enums.BusinessType;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.framework.web.page.TableDataInfo;
import com.ruoyi.project.medicine.domain.MedicineInfo;
import com.ruoyi.project.medicine.domain.MedicinePurchase;
import com.ruoyi.project.medicine.service.MedicineInfoService;
import com.ruoyi.project.medicine.service.MedicinePurchaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;

/**
 * @Date 2023/2/2 /10:09
 * @Author guohc
 * @Description
 */
@RestController
@RequestMapping("/medicine/purchase")
public class MedicinePurchaseController extends BaseController {

    @Autowired
    private MedicinePurchaseService medicinePurchaseService;

    @Autowired
    private MedicineInfoService medicineInfoService;

    /**
     * 查询采购列表
     *
     * @param medicinePurchase
     * @return
     */
    @PreAuthorize("@ss.hasPermi('medicine:purchase:list')")
    @GetMapping("/list")
    public TableDataInfo list(MedicinePurchase medicinePurchase) {
        startPage();
        List<MedicinePurchase> list = medicinePurchaseService.selectMedicinePurchaseList(medicinePurchase);
        return getDataTable(list);
    }

    /**
     * 根据采购编号获取详细信息
     */
    @PreAuthorize("@ss.hasPermi('medicine:purchase:query')")
    @GetMapping(value = "/{purchaseId}")
    public AjaxResult getInfo(@PathVariable String purchaseId) {

        return AjaxResult.success(medicinePurchaseService.selectMedicinePurchaseById(purchaseId));
    }

    /**
     * 新增采购
     */
    @PreAuthorize("@ss.hasPermi('medicine:purchase:add')")
    @Log(title = "采购管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@Validated @RequestBody MedicinePurchase medicinePurchase) {

        SnowId snowId = new SnowId(medicinePurchase.getMedicineId(), medicinePurchase.getSupplierId(), 2);
        String purId = (String) "CG" + snowId.nextId();
        medicinePurchase.setPurId(purId);
        medicinePurchase.setCreateBy(SecurityUtils.getUsername());

        //关联药品信息表增加库存数据  先查出库存数据
        MedicineInfo medicineInfo = medicineInfoService.selectMedicineInfoById(medicinePurchase.getMedicineId());

        medicineInfo.setStock(medicinePurchase.getPurCount()+medicineInfo.getStock());
        medicineInfo.setMedicineId(medicinePurchase.getMedicineId());
        medicineInfoService.updateMedicineInfo(medicineInfo);

        return toAjax(medicinePurchaseService.insertMedicinePurchase(medicinePurchase));
    }

    /**
     * 修改保存采购
     */
    @PreAuthorize("@ss.hasPermi('medicine:purchase:edit')")
    @Log(title = "采购管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@Validated @RequestBody MedicinePurchase medicinePurchase) {
        medicinePurchase.setUpdateBy(SecurityUtils.getUsername());

        if (medicinePurchaseService.updateMedicinePurchase(medicinePurchase) > 0) {
            return AjaxResult.success();
        }
        return AjaxResult.error("修改采购'" + medicinePurchase.getPurName() + "'失败，请联系管理员");
    }


    /**
     * 提交审核
     */
    @Log(title = "采购管理", businessType = BusinessType.UPDATE)
    @PutMapping("/submitAudit")
    public AjaxResult submitAudit(@RequestBody MedicinePurchase medicinePurchase) {
        if (medicinePurchase.getPurStatus().equals("2")) {
            return AjaxResult.error("已处于提交状态！");
        }
        if (medicinePurchase.getPurStatus().equals("3") || medicinePurchase.getPurStatus().equals("6")) {
            return AjaxResult.error("审核已通过请勿重复提交");
        }
        medicinePurchase.setUpdateBy(SecurityUtils.getUsername());
        return AjaxResult.success("提交审核成功", medicinePurchaseService.submitAudit(medicinePurchase));
    }

    /**
     * 删除采购
     */
    @PreAuthorize("@ss.hasPermi('medicine:purchase:remove')")
    @Log(title = "采购管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{purchaseIds}")
    public AjaxResult remove(@PathVariable String[] purchaseIds) {
        return toAjax(medicinePurchaseService.deleteMedicinePurchaseByIds(purchaseIds));
    }
}
