package com.ruoyi.project.media.service.impl;


import com.ruoyi.project.media.domain.MediaDeptList;
import com.ruoyi.project.media.domain.MediaDept;
import com.ruoyi.project.media.mapper.MediaDeptMapper;
import com.ruoyi.project.media.service.MediaDeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MediaDeptServiceImpl implements MediaDeptService {
    /**
     * 编程规范：
     * 在团队开发中，如果希望调用自己模块的表，直接直接注入自己的mapper
     *
     * 如果希望调用其他人开发的模块，只能注入其他人写的service。
     */
    @Autowired
    private MediaDeptMapper mediaDeptMapper;

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
     * 获取科室的id和name
     * @return
     */
    @Override
    public List<MediaDeptList> getDeptList() {

        return mediaDeptMapper.getDeptList();
    }
}
