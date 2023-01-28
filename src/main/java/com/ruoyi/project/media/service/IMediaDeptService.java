package com.ruoyi.project.media.service;

import com.ruoyi.project.media.domain.MediaDeptList;
import com.ruoyi.project.media.domain.MediaDept;

import java.util.List;

public interface IMediaDeptService {
    List<MediaDept> selectDeptList(MediaDept mediaDept);

    int insertDept(MediaDept mediaDept);

    int deleteDeptByIds(Long [] ids);

    MediaDept selectDeptById(Long id);

    int updateDept(MediaDept mediaDept);

    /**
     * 获取科室的id和name
     * @return
     */
    List<MediaDeptList> getDeptList();

}
