package com.ruoyi.project.media.controller;

import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.framework.aspectj.lang.annotation.Log;
import com.ruoyi.framework.aspectj.lang.enums.BusinessType;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.framework.web.page.TableDataInfo;
import com.ruoyi.project.media.service.IMediaNoticeService;
import com.ruoyi.project.media.domain.MediaNotice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @Date 2023/1/29 /11:01
 * @Author guohc
 * @Description 公告模块
 */
@RequestMapping("/media/notice")
@RestController
public class MediaNoticeController extends BaseController {

    @Autowired
    private IMediaNoticeService mediaNoticeService;

    /**
     * 获取通知公告列表
     */
    @PreAuthorize("@ss.hasPermi('media:notice:list')")
    @GetMapping("/list")
    public TableDataInfo list(MediaNotice notice) {
        startPage();
        List<MediaNotice> list = mediaNoticeService.selectNoticeList(notice);
        return getDataTable(list);
    }

    /**
     * 根据通知公告编号获取详细信息
     */
    @PreAuthorize("@ss.hasPermi('media:notice:query')")
    @GetMapping(value = "/{noticeId}")
    public AjaxResult getInfo(@PathVariable Long noticeId) {
        return AjaxResult.success(mediaNoticeService.selectNoticeById(noticeId));
    }

    /**
     * 新增通知公告
     */
    @PreAuthorize("@ss.hasPermi('media:notice:add')")
    @Log(title = "通知公告", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@Validated @RequestBody MediaNotice notice) {
        notice.setCreateBy(SecurityUtils.getUsername());
        return toAjax(mediaNoticeService.insertNotice(notice));
    }

    /**
     * 修改通知公告
     */
    @PreAuthorize("@ss.hasPermi('media:notice:edit')")
    @Log(title = "通知公告", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@Validated @RequestBody MediaNotice notice) {
        notice.setUpdateBy(SecurityUtils.getUsername());
        return toAjax(mediaNoticeService.updateNotice(notice));
    }

    /**
     * 删除通知公告
     */
    @PreAuthorize("@ss.hasPermi('media:notice:remove')")
    @Log(title = "通知公告", businessType = BusinessType.DELETE)
    @DeleteMapping("/{noticeIds}")
    public AjaxResult remove(@PathVariable Long[] noticeIds) {
        return toAjax(mediaNoticeService.deleteNoticeByIds(noticeIds));
    }

}
