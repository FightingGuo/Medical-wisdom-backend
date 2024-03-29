package com.ghc.project.medicine.controller;

import com.ghc.common.utils.DateUtils;
import com.ghc.common.utils.SecurityUtils;
import com.ghc.common.utils.SnowId;
import com.ghc.framework.aspectj.lang.annotation.Log;
import com.ghc.framework.aspectj.lang.enums.BusinessType;
import com.ghc.framework.web.controller.BaseController;
import com.ghc.framework.web.domain.AjaxResult;
import com.ghc.framework.web.page.TableDataInfo;
import com.ghc.project.medicine.domain.MedicineInfo;
import com.ghc.project.medicine.domain.MedicinePurchase;
import com.ghc.project.medicine.service.MedicineInfoService;
import com.ghc.project.medicine.service.MedicinePurchaseService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
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
@Api(tags = "采购列表控制层")
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
    @ApiOperation("查询采购列表")
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
    @ApiOperation("根据采购编号获取详细信息")
    public AjaxResult getInfo(@PathVariable String purchaseId) {

        return AjaxResult.success(medicinePurchaseService.selectMedicinePurchaseById(purchaseId));
    }

    /**
     * 新增采购
     */
    @PreAuthorize("@ss.hasPermi('medicine:purchase:add')")
    @Log(title = "采购管理", businessType = BusinessType.INSERT)
    @PostMapping
    @ApiOperation("新增采购")
    public AjaxResult add(@Validated @RequestBody MedicinePurchase medicinePurchase) {

        SnowId snowId = new SnowId(medicinePurchase.getMedicineId(), medicinePurchase.getSupplierId(), 2);
        String purId = "CG" + snowId.nextId();
        medicinePurchase.setPurId(purId);
        medicinePurchase.setCreateBy(SecurityUtils.getUsername());

        //关联药品信息表增加库存数据  先查出库存数据
        MedicineInfo medicineInfo = medicineInfoService.selectMedicineInfoById(medicinePurchase.getMedicineId());

        medicineInfo.setStock(medicinePurchase.getPurCount()+medicineInfo.getStock());
        medicineInfo.setMedicineId(medicinePurchase.getMedicineId());
        medicineInfoService.updateMedicineInfo(medicineInfo);
        //新增采购  采购状态默认为1  在数据库设置了默认值

        return toAjax(medicinePurchaseService.insertMedicinePurchase(medicinePurchase));
    }

    /**
     * 修改保存采购
     */
    @PreAuthorize("@ss.hasPermi('medicine:purchase:edit')")
    @Log(title = "采购管理", businessType = BusinessType.UPDATE)
    @PutMapping
    @ApiOperation("修改保存采购")
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
    @ApiOperation("提交审核")
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
    @ApiOperation("删除采购")
    public AjaxResult remove(@PathVariable String[] purchaseIds) {
        return toAjax(medicinePurchaseService.deleteMedicinePurchaseByIds(purchaseIds));
    }
}
