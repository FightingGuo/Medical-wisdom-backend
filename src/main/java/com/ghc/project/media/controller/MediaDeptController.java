package com.ghc.project.media.controller;

/**
 * @Date 2023/1/4 /17:24
 * @Author guohc
 * @Description 科室模块
 */

import com.ghc.common.utils.SecurityUtils;
import com.ghc.common.utils.poi.ExcelUtil;
import com.ghc.framework.aspectj.lang.annotation.Log;
import com.ghc.framework.aspectj.lang.enums.BusinessType;
import com.ghc.framework.web.controller.BaseController;
import com.ghc.framework.web.domain.AjaxResult;
import com.ghc.framework.web.page.TableDataInfo;
import com.ghc.project.media.domain.MediaDept;
import com.ghc.project.media.domain.MediaUserDTO;
import com.ghc.project.media.service.MediaDeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/media/dept")
public class MediaDeptController extends BaseController {
    @Autowired
    private MediaDeptService mediaDeptService;

    @PreAuthorize("@ss.hasPermi('media:dept:list')")
    @GetMapping("/list")
    public TableDataInfo list(MediaDept mediaDept) {
        // 不调用这个方法，分页无效
        startPage();
        List<MediaDept> list = mediaDeptService.selectDeptList(mediaDept);
        return getDataTable(list);
    }

    /**
     * 新增科室
     * @param mediaDept
     * @return
     */
    @PreAuthorize("@ss.hasPermi('media:dept:add')")
    @Log(title = "科室管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@Validated @RequestBody MediaDept mediaDept) {
        mediaDept.setCreateBy(SecurityUtils.getUsername());
        return toAjax(mediaDeptService.insertDept(mediaDept));
    }

    /**
     * 删除科室
     * @param deptIds
     * @return
     */
    @PreAuthorize("@ss.hasPermi('media:dept:remove')")
    @Log(title = "科室管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{deptIds}")
    public AjaxResult remove(@PathVariable Long[] deptIds) {
        return toAjax(mediaDeptService.deleteDeptByIds(deptIds));
    }

    /**
     * 导出科室数据
     * @param mediaDept
     * @return
     */
    @Log(title = "科室管理", businessType = BusinessType.EXPORT)
//    @PreAuthorize("@ss.hasPermi('media:dept:export')")
    @GetMapping("/export")
    public AjaxResult export(MediaDept mediaDept) {
        List<MediaDept> list = mediaDeptService.selectDeptList(mediaDept);
        ExcelUtil<MediaDept> util = new ExcelUtil<MediaDept>(MediaDept.class);
        return util.exportExcel(list, "科室数据");
    }

    @PreAuthorize("@ss.hasPermi('media:dept:edit')")
    @Log(title = "科室管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@Validated @RequestBody MediaDept dept) {
        dept.setUpdateBy(SecurityUtils.getUsername());
        return toAjax(mediaDeptService.updateDept(dept));
    }

    @PreAuthorize("@ss.hasPermi('media:dept:query')")
    @GetMapping(value = "/{deptId}")
    public AjaxResult getInfo(@PathVariable Long deptId) {
        return AjaxResult.success(mediaDeptService.selectDeptById(deptId));
    }

    /**
     * 获取科室下拉数据
     * @return
     */
    @GetMapping("/getDeptList")
    public AjaxResult getDeptList() {
        return AjaxResult.success(mediaDeptService.getDeptList());
    }

    /**
     * 获取医生/科室数据
     * @return
     */
    @GetMapping("/getDeptAndUserList")
    public AjaxResult getDeptAndUserList(MediaUserDTO mediaUser){
        return AjaxResult.success(mediaDeptService.getDeptAndUserList(mediaUser));
    }
}

