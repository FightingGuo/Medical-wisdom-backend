package com.ruoyi.project.medicine.controller;

import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.framework.aspectj.lang.annotation.Log;
import com.ruoyi.framework.aspectj.lang.enums.BusinessType;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.framework.web.page.TableDataInfo;
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
        if (medicinePurchase.getPurStatus().equals("6")) {
            return AjaxResult.error("审核已入库,请问重复提交~");
        }

        if (    medicinePurchase.getPurStatus() .equals("1")   ||
                medicinePurchase.getPurStatus() .equals("2")  ||
                medicinePurchase.getPurStatus() .equals("4")
        ) {
            return AjaxResult.error("审核未通过或未提交,请重新提交审核后重试~");
        }
        if (medicinePurchase.getPurStatus() .equals("5") ) {
            return AjaxResult.error("审核已作废,请问重新提交审核~");
        }
        medicinePurchase.setUpdateBy(SecurityUtils.getUsername());
        return AjaxResult.success("提交入库成功", checkAccessService.submitEntryDB(medicinePurchase));
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
