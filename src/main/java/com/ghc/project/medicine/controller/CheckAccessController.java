package com.ghc.project.medicine.controller;

import com.ghc.common.utils.SecurityUtils;
import com.ghc.framework.aspectj.lang.annotation.Log;
import com.ghc.framework.aspectj.lang.enums.BusinessType;
import com.ghc.framework.web.controller.BaseController;
import com.ghc.framework.web.domain.AjaxResult;
import com.ghc.framework.web.page.TableDataInfo;
import com.ghc.project.medicine.constant.MedicineEum;
import com.ghc.project.medicine.constant.MedicineConstant;
import com.ghc.project.medicine.domain.MedicinePurchase;
import com.ghc.project.medicine.service.CheckAccessService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
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
@Api(tags = "订单审核控制层")
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
    @ApiOperation("查询采购列表")
    public TableDataInfo list() {
        startPage();
        List<MedicinePurchase> list = checkAccessService.selectMedicinePurchaseList();
        return getDataTable(list);
    }

    /**
     * 审核通过
     */
    @ApiOperation("审核通过")
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
    @ApiOperation("提交入库")
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
    @ApiOperation("订单作废")
    public AjaxResult invalidCheck(@PathVariable String[] purIds) {
        return AjaxResult.success(checkAccessService.auditAccess(purIds));
    }
}
