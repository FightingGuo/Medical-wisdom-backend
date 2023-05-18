package com.ghc.project.media.mapper;

import com.ghc.project.media.domain.MediaDeptList;
import com.ghc.project.media.domain.MediaDept;

import java.util.List;

/**
 * @Date 2023/3/28 /17:04
 * @Author guohc
 * @Description
 */
public interface MediaDeptMapper {
    /**
     * 查询科室数据集合
     * @param mediaDept 科室信息
     * @return 科室数据集合
     */
    List<MediaDept> selectDeptList(MediaDept mediaDept);

    /**
     * 增加新的科室
     * @param mediaDept 科室信息
     * @return 返回改变的行数
     */
    int insertDept(MediaDept mediaDept);

    /**
     * 删除科室（可以是多个）
     * @param ids 科室id数组
     * @return
     */
    int deleteByIds(Long [] ids);

    /**
     * 根据id查询科室
     * @param id
     * @return 返回科室信息
     */
    MediaDept selectDeptById(Long id);

    /**
     * 更新科室信息
     * @param mediaDept 科室信息
     * @return 返回修改行数
     */
    int updateDept(MediaDept mediaDept);

    /**
     * 获取科室的id和name
     */
    List<MediaDeptList> getDeptList();
}

