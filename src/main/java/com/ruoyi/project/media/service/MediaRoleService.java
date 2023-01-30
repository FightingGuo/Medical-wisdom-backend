package com.ruoyi.project.media.service;

import com.ruoyi.project.media.domain.MediaRole;

import java.util.List;

/**
 * @Date 2023/1/28 /15:34
 * @Author guohc
 * @Description
 */
public interface MediaRoleService {
    /**
     * 根据条件分页查询角色数据
     *
     * @param role 角色信息
     * @return 角色数据集合信息
     */
    public List<MediaRole> selectRoleList(MediaRole role);

    /**
     * 通过角色ID查询角色
     *
     * @param roleId 角色ID
     * @return 角色对象信息
     */
    public MediaRole selectRoleById(Long roleId);

    /**
     * 根据角色名查询角色
     *
     * @param userName 用户名
     * @return 角色列表
     */
    public List<MediaRole> selectRolesByRoleName(String userName);


    /**
     * 修改角色状态
     *
     * @param role 角色信息
     * @return 结果
     */
    public int updateRoleStatus(MediaRole role);

    /**
     * 校验角色名称是否唯一
     *
     * @param roleName 角色名称
     * @return 角色信息
     */
    public MediaRole checkRoleNameUnique(String roleName);

    /**
     * 校验角色权限是否唯一
     *
     * @param roleAuth 角色权限
     * @return 角色信息
     */
    public MediaRole checkRoleAuthUnique(String roleAuth);

    /**
     * 修改角色信息
     *
     * @param role 角色信息
     * @return 结果
     */
    public int updateRole(MediaRole role);

    /**
     * 新增角色信息
     *
     * @param role 角色信息
     * @return 结果
     */
    public int insertRole(MediaRole role);


    /**
     * 校验角色是否允许操作
     *
     * @param role 角色信息
     */
    public void checkRoleAllowed(MediaRole role);


    /**
     * 通过角色ID删除角色
     *
     * @param roleId 角色ID
     * @return 结果
     */
    public int deleteRoleById(Long roleId);

    /**
     * 批量删除角色信息
     *
     * @param roleIds 需要删除的角色ID
     * @return 结果
     */
    public int deleteRoleByIds(Long[] roleIds);
}
