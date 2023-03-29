package com.ghc.project.media.mapper;

import com.ghc.project.media.domain.MediaNotice;

import java.util.List;

/**
 * @Date 2023/1/29 /10:45
 * @Author guohc
 * @Description
 */
public interface MediaNoticeMapper {

    /**
     * 查询公告信息
     *
     * @param noticeId 公告ID
     * @return 公告信息
     */
    MediaNotice selectNoticeById(Long noticeId);

    /**
     * 查询公告列表（条件查询）
     * @param mediaNotice
     * @return
     */
    List<MediaNotice> selectNoticeList(MediaNotice mediaNotice);

    /**
     * 新增公告
     * @param mediaNotice
     * @return
     */
    int insertNotice(MediaNotice mediaNotice);

    /**
     * 更行公告
     * @param mediaNotice
     * @return
     */
    int updateNotice(MediaNotice mediaNotice);

    /**
     * 删除公告信息
     * @param noticeId
     * @return
     */
    int deleteNoticeById(Long noticeId);

    /**
     * 批量删除公告信息
     * @param noticeIds
     * @return
     */
    int deleteNoticeByIds(Long[] noticeIds);
}
