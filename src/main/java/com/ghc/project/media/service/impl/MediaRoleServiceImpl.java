package com.ghc.project.media.service.impl;

import com.ghc.common.exception.CustomException;
import com.ghc.common.utils.StringUtils;
import com.ghc.project.media.domain.MediaRole;
import com.ghc.project.media.mapper.MediaRoleMapper;
import com.ghc.project.media.service.MediaRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Date 2023/1/28 /15:39
 * @Author guohc
 * @Description
 */
@Service
public class MediaRoleServiceImpl implements MediaRoleService {

    @Autowired
    MediaRoleMapper mediaRoleMapper;

    /**
     * 根据条件分页查询角色数据
     *
     * @param role 角色信息
     * @return 角色数据集合信息
     */
    @Override
    public List<MediaRole> selectRoleList(MediaRole role) {
        return mediaRoleMapper.selectRoleList(role);
    }

    /**
     * 通过角色ID查询角色
     *
     * @param roleId 角色ID
     * @return 角色对象信息
     */
    @Override
    public MediaRole selectRoleById(Long roleId) {
        return mediaRoleMapper.selectRoleById(roleId);
    }

    /**
     * 根据角色名查询角色
     *
     * @param roleName 角色名
     * @return 角色列表
     */
    @Override
    public List<MediaRole> selectRolesByRoleName(String roleName) {
        return mediaRoleMapper.selectRolesByRoleName(roleName);
    }


    /**
     * 修改角色状态
     *
     * @param role 角色信息
     * @return 结果
     */
    @Override
    public int updateRoleStatus(MediaRole role)
    {
        return mediaRoleMapper.updateRole(role);
    }

    /**
     * 校验角色名称是否唯一
     *
     * @param roleName 角色名称
     * @return 角色信息
     */
    @Override
    public MediaRole checkRoleNameUnique(String roleName) {
        return mediaRoleMapper.checkRoleNameUnique(roleName);
    }

    /**
     * 校验角色权限是否唯一
     *
     * @param roleAuth 角色权限
     * @return 角色信息
     */
    @Override
    public MediaRole checkRoleAuthUnique(String roleAuth) {
        return mediaRoleMapper.checkRoleAuthUnique(roleAuth);
    }
    /**
     * 校验角色是否允许操作
     *
     * @param role 角色信息
     */
    @Override
    public void checkRoleAllowed(MediaRole role)
    {
        if (StringUtils.isNotNull(role.getRoleId()) && role.isAdmin())
        {
            throw new CustomException("不允许操作超级管理员角色");
        }
    }

    /**
     * 修改角色信息
     *
     * @param role 角色信息
     * @return 结果
     */
    @Override
    public int updateRole(MediaRole role) {
        return mediaRoleMapper.updateRole(role);
    }

    /**
     * 新增角色信息
     *
     * @param role 角色信息
     * @return 结果
     */
    @Override
    public int insertRole(MediaRole role) {
        return mediaRoleMapper.insertRole(role);
    }

    /**
     * 通过角色ID删除角色
     *
     * @param roleId 角色ID
     * @return 结果
     */
    @Override
    public int deleteRoleById(Long roleId) {
        return mediaRoleMapper.deleteRoleById(roleId);
    }

    /**
     * 批量删除角色信息
     *
     * @param roleIds 需要删除的角色ID
     * @return 结果
     */
    @Override
    public int deleteRoleByIds(Long[] roleIds) {
        return mediaRoleMapper.deleteRoleByIds(roleIds);
    }
}
