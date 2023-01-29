package com.ruoyi.project.media.controller;

import com.ruoyi.common.constant.UserConstants;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.aspectj.lang.annotation.Log;
import com.ruoyi.framework.aspectj.lang.enums.BusinessType;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.framework.web.page.TableDataInfo;
import com.ruoyi.project.media.domain.MediaUser;
import com.ruoyi.project.media.domain.ResetPassword;
import com.ruoyi.project.media.service.IMediaUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @Date 2023/1/10 /16:06
 * @Author guohc
 * @Description  用户模块
 */

@RestController
@RequestMapping("/media/user")
public class MediaUserController extends BaseController {

    @Autowired
    IMediaUserService mediaUserService;

    /**
     * 获取用户列表
     */
    @PreAuthorize("@ss.hasPermi('media:user:list')")
    @GetMapping("/list")
    public TableDataInfo list(MediaUser mediaUser) {
        startPage();
        List<MediaUser> list = mediaUserService.selectUserList(mediaUser);
        return getDataTable(list);
    }

    @Log(title = "用户管理" , businessType = BusinessType.EXPORT)
    @PreAuthorize("@ss.hasPermi('media:user:export')")
    @GetMapping("/export")
    public AjaxResult export(MediaUser mediaUser) {
        List<MediaUser> list = mediaUserService.selectUserList(mediaUser);
        ExcelUtil<MediaUser> util = new ExcelUtil<>(MediaUser.class);
        return util.exportExcel(list, "用户数据");
    }


    /**
     * 新增用户
     */
    @PreAuthorize("@ss.hasPermi('media:user:add')")
    @Log(title = "用户管理" , businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@Validated @RequestBody MediaUser mediaUser) {
        if (UserConstants.NOT_UNIQUE.equals(mediaUserService.checkUserNameUnique(mediaUser.getUserName()))) {
            return AjaxResult.error("新增用户'" + mediaUser.getUserName() + "'失败，登录账号已存在");
        } else if (StringUtils.isNotEmpty(mediaUser.getPhoneNumber())
                && UserConstants.NOT_UNIQUE.equals(mediaUserService.checkPhoneUnique(mediaUser))) {
            return AjaxResult.error("新增用户'" + mediaUser.getUserName() + "'失败，手机号码已存在");
        }

        //新增用户设置初始密码
        mediaUser.setPassword("123456");
        mediaUser.setCreateBy(SecurityUtils.getUsername());
        String s = SecurityUtils.encryptPassword(mediaUser.getPassword());
        //密码加密后存入库中
//        mediaUser.setPassword(SecurityUtils.encryptPassword(mediaUser.getPassword()));
        return toAjax(mediaUserService.insertUser(mediaUser));
    }

    /**
     * 修改用户
     */
    @PreAuthorize("@ss.hasPermi('media:user:edit')")
    @Log(title = "用户管理" , businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@Validated @RequestBody MediaUser mediaUser) {
        mediaUserService.checkUserAllowed(mediaUser);
        if (StringUtils.isNotEmpty(mediaUser.getPhoneNumber())
                && UserConstants.NOT_UNIQUE.equals(mediaUserService.checkPhoneUnique(mediaUser))) {
            return AjaxResult.error("修改用户'" + mediaUser.getUserName() + "'失败，手机号码已存在");
        }
        mediaUser.setUpdateBy(SecurityUtils.getUsername());
        return toAjax(mediaUserService.updateUser(mediaUser));
    }

    /**
     * 删除用户
     */
    @PreAuthorize("@ss.hasPermi('media:user:remove')")
    @Log(title = "用户管理" , businessType = BusinessType.DELETE)
    @DeleteMapping("/{userIds}")
    public AjaxResult remove(@PathVariable Long[] userIds) {
        return toAjax(mediaUserService.deleteUserByIds(userIds));
    }

    /**
     * 重置密码（可批量）
     */
    @PreAuthorize("@ss.hasPermi('system:user:resetUserPwd')")
    @Log(title = "用户管理" , businessType = BusinessType.UPDATE)
    @PutMapping("/resetUserPwd")
    public AjaxResult resetPwd(@Validated @RequestBody ResetPassword resetPassword) {
//        mediaUserService.checkUserAllowed(mediaUser);
//        mediaUser.setPassword(SecurityUtils.encryptPassword(mediaUser.getPassword()));
        return toAjax(mediaUserService.resetUserPwd(resetPassword.getPassword(),resetPassword.getUserIds()));

    }

    /**
     * 状态修改
     */
    @PreAuthorize("@ss.hasPermi('media:user:edit')")
    @Log(title = "用户管理" , businessType = BusinessType.UPDATE)
    @PutMapping("/changeStatus")
    public AjaxResult changeStatus(@RequestBody MediaUser mediaUser) {
        mediaUserService.checkUserAllowed(mediaUser);
        mediaUser.setUpdateBy(SecurityUtils.getUsername());
        return toAjax(mediaUserService.updateUserStatus(mediaUser));
    }

    /**
     * 根据用户编号获取详细信息
     */
    @PreAuthorize("@ss.hasPermi('media:user:query')")
    @GetMapping(value = {"/" , "/{userId}"})
    public AjaxResult getInfo(@PathVariable(value = "userId" , required = false) Long userId) {
        return AjaxResult.success(mediaUserService.selectUserById(userId));
    }

}
