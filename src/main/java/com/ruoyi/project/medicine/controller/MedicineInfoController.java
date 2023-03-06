package com.ruoyi.project.medicine.controller;

import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.framework.aspectj.lang.annotation.Log;
import com.ruoyi.framework.aspectj.lang.enums.BusinessType;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.framework.web.page.TableDataInfo;
import com.ruoyi.project.medicine.domain.MedicineInfo;
import com.ruoyi.project.medicine.service.MedicineInfoService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @Date 2023/1/31 /11:51
 * @Author guohc
 * @Description
 */
@RestController
@RequestMapping("/medicine/info")
@Api(tags = "药品信息控制层")
public class MedicineInfoController extends BaseController {

    @Autowired
    private MedicineInfoService medicineInfoService;

    /**
     * 查询药品信息列表
     *
     * @param info
     * @return
     */
    @PreAuthorize("@ss.hasPermi('medicine:info:list')")
    @GetMapping("/list")
    @ApiOperation("查询药品信息列表")
    public TableDataInfo list(MedicineInfo info) {
        startPage();
        List<MedicineInfo> list = medicineInfoService.selectMedicineInfoList(info);
        return getDataTable(list);
    }

    /**
     * 根据药品信息编号获取详细信息
     */
    @PreAuthorize("@ss.hasPermi('medicine:info:query')")
    @GetMapping(value = "/{infoId}")
    @ApiOperation("根据药品信息编号获取详细信息")
    public AjaxResult getInfo(@PathVariable Long infoId) {
        return AjaxResult.success(medicineInfoService.selectMedicineInfoById(infoId));
    }

    /**
     * 新增药品信息
     */
    @PreAuthorize("@ss.hasPermi('medicine:info:add')")
    @Log(title = "药品信息管理", businessType = BusinessType.INSERT)
    @PostMapping
    @ApiOperation("新增药品信息")
    public AjaxResult add(@Validated @RequestBody MedicineInfo info) {
        if (null != medicineInfoService.checkMedicineInfoNameUnique(info.getMedicineName())) {
            return AjaxResult.error("新增药品'" + info.getMedicineName() + "'失败，药品名称已存在");
        } else if (null !=medicineInfoService.checkMedicineInfoCodeUnique(info.getMedicineCode())) {
            return AjaxResult.error("新增药品'" + info.getMedicineCode() + "'失败，药品名称已存在");
        }
        info.setCreateBy(SecurityUtils.getUsername());
        return toAjax(medicineInfoService.insertMedicineInfo(info));
    }

    /**
     * 修改保存药品信息
     */
    @PreAuthorize("@ss.hasPermi('medicine:info:edit')")
    @Log(title = "药品信息管理", businessType = BusinessType.UPDATE)
    @PutMapping
    @ApiOperation("修改保存药品信息")
    public AjaxResult edit(@Validated @RequestBody MedicineInfo info) {
        info.setUpdateBy(SecurityUtils.getUsername());

        if (medicineInfoService.updateMedicineInfo(info) > 0) {
            return AjaxResult.success();
        }
        return AjaxResult.error("修改药品'" + info.getMedicineName() + "'失败，请联系管理员");
    }


    /**
     * 状态修改
     */
    @PreAuthorize("@ss.hasPermi('medicine:info:edit')")
    @Log(title = "药品信息管理", businessType = BusinessType.UPDATE)
    @PutMapping("/changeStatus")
    @ApiOperation("状态修改")
    public AjaxResult changeStatus(@RequestBody MedicineInfo info) {
        info.setUpdateBy(SecurityUtils.getUsername());
        return toAjax(medicineInfoService.updateMedicineInfoStatus(info));
    }

    /**
     * 删除药品信息
     */
    @PreAuthorize("@ss.hasPermi('medicine:info:remove')")
    @Log(title = "药品信息管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{infoIds}")
    @ApiOperation("删除药品信息")
    public AjaxResult remove(@PathVariable Long[] infoIds) {
        return toAjax(medicineInfoService.deleteMedicineInfoByIds(infoIds));
    }

    /**
     * 获取药品信息下拉列表
     *
     * @return
     */
    @GetMapping("/getMedicineList")
    @ApiOperation("获取药品信息下拉列表")
    public AjaxResult getMedicineList(){
        return AjaxResult.success(medicineInfoService.selectMedicineList());
    }

}
