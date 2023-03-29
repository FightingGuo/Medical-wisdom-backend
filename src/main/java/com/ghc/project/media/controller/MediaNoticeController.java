package com.ghc.project.media.controller;

import com.ghc.common.utils.SecurityUtils;
import com.ghc.framework.aspectj.lang.annotation.Log;
import com.ghc.framework.aspectj.lang.enums.BusinessType;
import com.ghc.framework.web.controller.BaseController;
import com.ghc.framework.web.domain.AjaxResult;
import com.ghc.framework.web.page.TableDataInfo;
import com.ghc.project.media.service.MediaNoticeService;
import com.ghc.project.media.domain.MediaNotice;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
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
@Api(tags = "公告模块控制层")
public class MediaNoticeController extends BaseController {

    @Autowired
    private MediaNoticeService mediaNoticeService;

    /**
     * 获取通知公告列表
     */
    @PreAuthorize("@ss.hasPermi('media:notice:list')")
    @GetMapping("/list")
    @ApiOperation("获取通知公告列表")
    public TableDataInfo list(MediaNotice notice) {
        startPage();
        List<MediaNotice> list = mediaNoticeService.selectNoticeList(notice);
        return getDataTable(list);
    }

    /**
     * 根据通知公告编号获取详细信息
     */
    @ApiOperation("根据通知公告编号获取详细信息")
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
    @ApiOperation("新增通知公告")
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
    @ApiOperation("修改通知公告")
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
    @ApiOperation("删除通知公告")
    public AjaxResult remove(@PathVariable Long[] noticeIds) {
        return toAjax(mediaNoticeService.deleteNoticeByIds(noticeIds));
    }

}
