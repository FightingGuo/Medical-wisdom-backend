package com.ruoyi.project.medicine.controller;

import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.framework.aspectj.lang.annotation.Log;
import com.ruoyi.framework.aspectj.lang.enums.BusinessType;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.framework.web.page.TableDataInfo;
import com.ruoyi.project.medicine.constant.MedicineEum;
import com.ruoyi.project.medicine.constant.MedicineConstant;
import com.ruoyi.project.medicine.domain.MedicinePurchase;
import com.ruoyi.project.medicine.service.CheckAccessService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @Date 2023/2/3 /14:07
 * @Author guohc
 * @Description
 */
@RestController
@RequestMapping("/medicine/check")
public class CheckAccessController extends BaseController {

    @Autowired
    private CheckAccessService checkAccessService;

    /**
     * 查询采购列表
     *
     * @return
     */
    @PreAuthorize("@ss.hasPermi('medicine:check:list')")
    @GetMapping("/list")
    public TableDataInfo list() {
        startPage();
        List<MedicinePurchase> list = checkAccessService.selectMedicinePurchaseList();
        return getDataTable(list);
    }

    /**
     * 审核通过
     */
    @Log(title = "采购管理", businessType = BusinessType.UPDATE)
    @PutMapping("/auditAccess/{purIds}")
    public AjaxResult AuditAccess(@PathVariable String[] purIds) {
        return AjaxResult.success(checkAccessService.auditAccess(purIds));
    }


    /**
     * 提交入库
     */
    @Log(title = "采购管理", businessType = BusinessType.UPDATE)
    @PutMapping("/submitEntryDB")
    public AjaxResult submitEntryDB(@RequestBody MedicinePurchase medicinePurchase) {
        if (medicinePurchase.getPurStatus().equals(MedicineEum.SIX)) {
            return AjaxResult.error(MedicineConstant.SUBMIT_DB_REPEATABLE);
        }

        if (    medicinePurchase.getPurStatus() .equals(MedicineEum.ONE)   ||
                medicinePurchase.getPurStatus() .equals(MedicineEum.TWO)  ||
                medicinePurchase.getPurStatus() .equals(MedicineEum.FOUR)
        ) {
            return AjaxResult.error(MedicineConstant.AUDIT_FAIL);
        }
        if (medicinePurchase.getPurStatus() .equals(MedicineEum.FIVE) ) {
            return AjaxResult.error(MedicineConstant.AUDIT_INVALID);
        }
        medicinePurchase.setUpdateBy(SecurityUtils.getUsername());
        return AjaxResult.success(MedicineConstant.SUBMIT_DB_SUCCESS, checkAccessService.submitEntryDB(medicinePurchase));
    }

    /**
     * 订单作废
     */
    @Log(title = "采购管理", businessType = BusinessType.UPDATE)
    @PutMapping("/invalidCheck/{purIds}")
    public AjaxResult invalidCheck(@PathVariable String[] purIds) {
        return AjaxResult.success(checkAccessService.auditAccess(purIds));
    }
}
