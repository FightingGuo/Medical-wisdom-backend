package com.ghc.project.medicine.controller;

import com.ghc.common.utils.SecurityUtils;
import com.ghc.framework.aspectj.lang.annotation.Log;
import com.ghc.framework.aspectj.lang.enums.BusinessType;
import com.ghc.framework.web.controller.BaseController;
import com.ghc.framework.web.domain.AjaxResult;
import com.ghc.framework.web.page.TableDataInfo;
import com.ghc.project.medicine.domain.GenFactory;
import com.ghc.project.medicine.service.GenFactoryService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @Date 2023/1/30 /11:35
 * @Author guohc
 * @Description
 */
@RequestMapping("/medicine/factory")
@RestController
@Api(tags = "生成厂家控制层")
public class GenFactoryController extends BaseController {
    
    @Autowired
    private GenFactoryService genFactoryService;

    /**
     * 查询厂家列表
     *
     * @param factory
     * @return
     */
    @ApiOperation("查询厂家列表")
    @PreAuthorize("@ss.hasPermi('medicine:factory:list')")
    @GetMapping("/list")
    public TableDataInfo list(GenFactory factory) {
        startPage();
        List<GenFactory> list = genFactoryService.selectFactoryList(factory);
        return getDataTable(list);
    }

    /**
     * 根据厂家编号获取详细信息
     */
    @PreAuthorize("@ss.hasPermi('medicine:factory:query')")
    @GetMapping(value = "/{factoryId}")
    @ApiOperation("根据厂家编号获取详细信息")
    public AjaxResult getInfo(@PathVariable Long factoryId) {
        return AjaxResult.success(genFactoryService.selectFactoryById(factoryId));
    }

    /**
     * 新增厂家
     */
    @PreAuthorize("@ss.hasPermi('medicine:factory:add')")
    @Log(title = "厂家管理", businessType = BusinessType.INSERT)
    @PostMapping
    @ApiOperation("新增厂家")
    public AjaxResult add(@Validated @RequestBody GenFactory factory) {
        if (null != genFactoryService.checkFactoryNameUnique(factory.getFactoryName())) {
            return AjaxResult.error("新增厂家'" + factory.getFactoryName() + "'失败，厂家名称已存在");
        } else if (null !=genFactoryService.checkFactoryCodeUnique(factory.getFactoryCode())) {
            return AjaxResult.error("新增厂家'" + factory.getFactoryCode() + "'失败，厂家编码已存在");
        }
        factory.setCreateBy(SecurityUtils.getUsername());
        return toAjax(genFactoryService.insertFactory(factory));
    }

    /**
     * 修改保存厂家
     */
    @PreAuthorize("@ss.hasPermi('medicine:factory:edit')")
    @Log(title = "厂家管理", businessType = BusinessType.UPDATE)
    @PutMapping
    @ApiOperation("修改保存厂家")
    public AjaxResult edit(@Validated @RequestBody GenFactory factory) {
        if (null != genFactoryService.checkFactoryNameUnique(factory.getFactoryName())) {
            return AjaxResult.error("修改厂家'" + factory.getFactoryName() + "'失败，厂家名称已存在");
        } else if (null !=genFactoryService.checkFactoryCodeUnique(factory.getFactoryCode())) {
            return AjaxResult.error("修改厂家'" + factory.getFactoryCode() + "'失败，厂家权限已存在");
        }
        factory.setUpdateBy(SecurityUtils.getUsername());

        if (genFactoryService.updateFactory(factory) > 0) {
            return AjaxResult.success();
        }
        return AjaxResult.error("修改厂家'" + factory.getFactoryName() + "'失败，请联系管理员");
    }


    /**
     * 状态修改
     */
    @PreAuthorize("@ss.hasPermi('medicine:factory:edit')")
    @Log(title = "厂家管理", businessType = BusinessType.UPDATE)
    @PutMapping("/changeStatus")
    @ApiOperation("状态修改")
    public AjaxResult changeStatus(@RequestBody GenFactory factory) {
        factory.setUpdateBy(SecurityUtils.getUsername());
        return toAjax(genFactoryService.updateFactoryStatus(factory));
    }

    /**
     * 删除厂家
     */
    @PreAuthorize("@ss.hasPermi('medicine:factory:remove')")
    @Log(title = "厂家管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{factoryIds}")
    @ApiOperation("删除厂家")
    public AjaxResult remove(@PathVariable Long[] factoryIds) {
        return toAjax(genFactoryService.deleteFactoryByIds(factoryIds));
    }

    /**
     * 获取厂家id 和 name  下拉列表数据
     * @return
     */
    @GetMapping("/getFactoryList")
    @ApiOperation("获取厂家下拉列表数据")
    public AjaxResult getDeptList() {
        return AjaxResult.success(genFactoryService.getFactoryNameList());
    }

}
