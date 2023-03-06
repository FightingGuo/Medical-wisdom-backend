package com.ruoyi.project.media.controller;

import com.ruoyi.common.constant.UserConstants;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.aspectj.lang.annotation.Log;
import com.ruoyi.framework.aspectj.lang.enums.BusinessType;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.framework.web.page.TableDataInfo;
import com.ruoyi.project.media.domain.MediaRole;
import com.ruoyi.project.media.service.MediaRoleService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @Date 2023/1/28 /15:55
 * @Author guohc
 * @Description 角色管理
 */
@RequestMapping("/media/role")
@RestController
@Api(tags = "角色管理控制层")
public class MediaRoleController extends BaseController {

    @Autowired
    MediaRoleService mediaRoleService;

    /**
     * 查询角色列表
     *
     * @param role
     * @return
     */
    @PreAuthorize("@ss.hasPermi('media:role:list')")
    @GetMapping("/list")
    @ApiOperation("查询角色列表")
    public TableDataInfo list(MediaRole role) {
        startPage();
        List<MediaRole> list = mediaRoleService.selectRoleList(role);
        return getDataTable(list);
    }

    /**
     * 导出角色
     *
     * @param role
     * @return
     */
    @Log(title = "角色管理", businessType = BusinessType.EXPORT)
    @PreAuthorize("@ss.hasPermi('media:role:export')")
    @GetMapping("/export")
    @ApiOperation("导出角色")
    public AjaxResult export(MediaRole role) {
        List<MediaRole> list = mediaRoleService.selectRoleList(role);
        ExcelUtil<MediaRole> util = new ExcelUtil<MediaRole>(MediaRole.class);
        return util.exportExcel(list, "角色数据");
    }

    /**
     * 根据角色编号获取详细信息
     */
    @PreAuthorize("@ss.hasPermi('media:role:query')")
    @GetMapping(value = "/{roleId}")
    @ApiOperation("根据角色编号获取详细信息")
    public AjaxResult getInfo(@PathVariable Long roleId) {
        return AjaxResult.success(mediaRoleService.selectRoleById(roleId));
    }

    /**
     * 新增角色
     */
    @PreAuthorize("@ss.hasPermi('media:role:add')")
    @Log(title = "角色管理", businessType = BusinessType.INSERT)
    @PostMapping
    @ApiOperation("新增角色")
    public AjaxResult add(@Validated @RequestBody MediaRole role) {
        if (null != mediaRoleService.checkRoleNameUnique(role.getRoleName())) {
            return AjaxResult.error("新增角色'" + role.getRoleName() + "'失败，角色名称已存在");
        } else if (null != mediaRoleService.checkRoleAuthUnique(role.getRoleAuth())) {
            return AjaxResult.error("新增角色'" + role.getRoleName() + "'失败，角色权限已存在");
        }
        role.setCreateBy(SecurityUtils.getUsername());
        return toAjax(mediaRoleService.insertRole(role));

    }

    /**
     * 修改保存角色
     */
    @PreAuthorize("@ss.hasPermi('media:role:edit')")
    @Log(title = "角色管理", businessType = BusinessType.UPDATE)
    @PutMapping
    @ApiOperation("修改保存角色")
    public AjaxResult edit(@Validated @RequestBody MediaRole role) {
        mediaRoleService.checkRoleAllowed(role);
        if (UserConstants.NOT_UNIQUE.equals(mediaRoleService.checkRoleNameUnique(role.getRoleName()))) {
            return AjaxResult.error("修改角色'" + role.getRoleName() + "'失败，角色名称已存在");
        } else if (UserConstants.NOT_UNIQUE.equals(mediaRoleService.checkRoleAuthUnique(role.getRoleAuth()))) {
            return AjaxResult.error("修改角色'" + role.getRoleName() + "'失败，角色权限已存在");
        }
        role.setUpdateBy(SecurityUtils.getUsername());

        if (mediaRoleService.updateRole(role) > 0) {
            return AjaxResult.success();
        }
        return AjaxResult.error("修改角色'" + role.getRoleName() + "'失败，请联系管理员");
    }


    /**
     * 状态修改
     */
    @PreAuthorize("@ss.hasPermi('media:role:edit')")
    @Log(title = "角色管理", businessType = BusinessType.UPDATE)
    @PutMapping("/changeStatus")
    @ApiOperation("状态修改")
    public AjaxResult changeStatus(@RequestBody MediaRole role) {
        mediaRoleService.checkRoleAllowed(role);
        role.setUpdateBy(SecurityUtils.getUsername());
        return toAjax(mediaRoleService.updateRoleStatus(role));
    }

    /**
     * 删除角色
     */
    @PreAuthorize("@ss.hasPermi('media:role:remove')")
    @Log(title = "角色管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{roleIds}")
    @ApiOperation("删除角色")
    public AjaxResult remove(@PathVariable Long[] roleIds) {
        return toAjax(mediaRoleService.deleteRoleByIds(roleIds));
    }
}
