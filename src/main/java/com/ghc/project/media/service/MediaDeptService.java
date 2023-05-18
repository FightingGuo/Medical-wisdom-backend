package com.ghc.project.media.service;

import com.ghc.project.media.domain.MediaDeptList;
import com.ghc.project.media.domain.MediaDept;
import com.ghc.project.media.domain.MediaUserDTO;

import java.util.List;

public interface MediaDeptService {
    List<MediaDept> selectDeptList(MediaDept mediaDept);

    int insertDept(MediaDept mediaDept);

    int deleteDeptByIds(Long [] ids);

    MediaDept selectDeptById(Long id);

    int updateDept(MediaDept mediaDept);

    /**
     * 科室  医生  信息
     * @return
     */
    List<MediaUserDTO> getDeptAndUserList(MediaUserDTO mediaUser);

    /**
     * 获取科室的id和name
     * @return
     */
    List<MediaDeptList> getDeptList();
}
