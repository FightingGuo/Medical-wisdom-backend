package com.ruoyi.project.media.service.impl;

import com.ruoyi.project.media.domain.MediaNotice;
import com.ruoyi.project.media.mapper.MediaNoticeMapper;
import com.ruoyi.project.media.service.MediaNoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Date 2023/1/29 /10:56
 * @Author guohc
 * @Description
 */
@Service
public class MediaNoticeServiceImpl implements MediaNoticeService {
    @Autowired
    private MediaNoticeMapper mediaNoticeMapper;


    /**
     * 查询公告信息
     *
     * @param noticeId 公告ID
     * @return 公告信息
     */
    @Override
    public MediaNotice selectNoticeById(Long noticeId) {
        return mediaNoticeMapper.selectNoticeById(noticeId);
    }

    /**
     * 查询公告列表（条件查询）
     *
     * @param mediaNotice
     * @return
     */
    @Override
    public List<MediaNotice> selectNoticeList(MediaNotice mediaNotice) {
        return mediaNoticeMapper.selectNoticeList(mediaNotice);
    }

    /**
     * 新增公告
     *
     * @param mediaNotice
     * @return
     */
    @Override
    public int insertNotice(MediaNotice mediaNotice) {
        return mediaNoticeMapper.insertNotice(mediaNotice);
    }

    /**
     * 更行公告
     *
     * @param mediaNotice
     * @return
     */
    @Override
    public int updateNotice(MediaNotice mediaNotice) {
        return mediaNoticeMapper.updateNotice(mediaNotice);
    }

    /**
     * 删除公告信息
     *
     * @param noticeId
     * @return
     */
    @Override
    public int deleteNoticeById(Long noticeId) {
        return mediaNoticeMapper.deleteNoticeById(noticeId);
    }

    /**
     * 批量删除公告信息
     *
     * @param noticeIds
     * @return
     */
    @Override
    public int deleteNoticeByIds(Long[] noticeIds) {
        return mediaNoticeMapper.deleteNoticeByIds(noticeIds);
    }
}
