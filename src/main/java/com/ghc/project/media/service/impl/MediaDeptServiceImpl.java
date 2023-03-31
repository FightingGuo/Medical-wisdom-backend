package com.ghc.project.media.service.impl;


import com.ghc.project.media.domain.*;
import com.ghc.project.media.mapper.MediaDeptMapper;
import com.ghc.project.media.mapper.MediaUserMapper;
import com.ghc.project.media.service.MediaDeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
public class MediaDeptServiceImpl implements MediaDeptService {
    /**
     * 编程规范：
     * 在团队开发中，如果希望调用自己模块的表，直接注入自己的mapper
     *
     * 如果希望调用其他人开发的模块，只能注入其他人写的service。
     */
    @Autowired
    private MediaDeptMapper mediaDeptMapper;

    @Autowired
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
    public List<MediaDeptAndUser> getDeptList() {
        //查出所有科室  id:name
        List<MediaDeptAndUser> mediaDeptMapperDeptList = mediaDeptMapper.getDeptList();

        //把科室根据科室id放map里
        Map<Long, MediaDeptAndUser> map = mediaDeptMapperDeptList.stream().collect(Collectors.toMap(MediaDeptAndUser::getDeptId, MediaDeptAndUser -> MediaDeptAndUser));


        //查询所有医师  user_id:user_name:dept_id
        List<MediaUserList> mediaUserLists = mediaUserMapper.queryMediaUserList();

        //把医师对应的dept_id 挂入对应科室
        for (MediaUserList item:mediaUserLists){
            if (null != map.get(item.getDeptId())){
                MediaDeptAndUser mediaDeptAndUser = map.get(item.getDeptId());
                mediaDeptAndUser.getMediaUserLists().add(item);
                map.put(item.getDeptId(),mediaDeptAndUser);
            }
        }

        return mediaDeptMapperDeptList;
    }
}
