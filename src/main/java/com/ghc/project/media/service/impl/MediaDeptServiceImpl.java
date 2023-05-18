package com.ghc.project.media.service.impl;


import com.ghc.project.media.domain.*;
import com.ghc.project.media.mapper.MediaDeptMapper;
import com.ghc.project.media.mapper.MediaUserMapper;
import com.ghc.project.media.service.MediaDeptService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class MediaDeptServiceImpl implements MediaDeptService {
    /**
     * 编程规范：
     * 在团队开发中，如果希望调用自己模块的表，直接注入自己的mapper
     *
     * 如果希望调用其他人开发的模块，只能注入其他人写的service。
     */
    @Resource
    private MediaDeptMapper mediaDeptMapper;

    @Resource
    private MediaUserMapper mediaUserMapper;

    @Override
    public List<MediaDept> selectDeptList(MediaDept mediaDept) {
        return mediaDeptMapper.selectDeptList(mediaDept);
    }

    @Override
    public int insertDept(MediaDept mediaDept) {
        return mediaDeptMapper.insertDept(mediaDept);
    }

    @Override
    public int deleteDeptByIds(Long[] ids) {
        return mediaDeptMapper.deleteByIds(ids);
    }

    @Override
    public MediaDept selectDeptById(Long id) {
        return mediaDeptMapper.selectDeptById(id);
    }

    @Override
    public int updateDept(MediaDept mediaDept) {
        return mediaDeptMapper.updateDept(mediaDept);
    }

    /**
     * 获取科室的id和name  查询科室 及 科室下的医师  二级联动返回数据
     * @return
     */
    @Override
    public List<MediaUserDTO> getDeptAndUserList(MediaUserDTO mediaUser) {

        List<MediaUserDTO> mediaUserDTOS = mediaUserMapper.queryMediaUserList(mediaUser.getDeptId());

        return mediaUserDTOS;
    }

    /**
     * 获取科室名称:科室id
     * @return
     */
    public List<MediaDeptList> getDeptList() {
        return mediaDeptMapper.getDeptList();
    }
}
