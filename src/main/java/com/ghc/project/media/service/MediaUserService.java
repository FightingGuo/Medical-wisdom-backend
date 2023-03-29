package com.ghc.project.media.service;

import com.ghc.project.media.domain.MediaUser;

import java.util.List;

/**
 * @Date 2023/1/11 /16:41
 * @Author guohc
 * @Description
 */
public interface MediaUserService {
    /**
     * 根据条件分页查询用户列表
     *
     * @param mediaUser 用户信息
     * @return 用户信息集合信息
     */
    public List<MediaUser> selectUserList(MediaUser mediaUser);

    /**
     * 通过用户名查询用户
     *
     * @param userName 用户名
     * @return 用户对象信息
     */
    public MediaUser selectUserByUserName(String userName);

    /**
     * 通过用户ID查询用户
     *
     * @param userId 用户ID
     * @return 用户对象信息
     */
    public MediaUser selectUserById(Long userId);

    /**
     * 校验用户名称是否唯一
     *
     * @param userName 用户名称
     * @return 结果
     */
    public String checkUserNameUnique(String userName);

    /**
     * 校验手机号码是否唯一
     *
     * @param mediaUser 用户信息
     * @return 结果
     */
    public String checkPhoneUnique(MediaUser mediaUser);

    /**
     * 新增用户信息
     *
     * @param mediaUser 用户信息
     * @return 结果
     */
    public int insertUser(MediaUser mediaUser);

    /**
     * 修改用户信息
     *
     * @param mediaUser 用户信息
     * @return 结果
     */
    public int updateUser(MediaUser mediaUser);

    /**
     * 修改用户状态
     *
     * @param mediaUser 用户信息
     * @return 结果
     */
    public int updateUserStatus(MediaUser mediaUser);


    /**
     * 校验用户是否允许操作
     *
     * @param mediaUser 用户信息
     */
    public void checkUserAllowed(MediaUser mediaUser);

    /**
     * 重置用户密码
     *
     * @param userIds 需要重置密码的用户id
     * @param password 密码
     * @return 结果
     */
    public int resetUserPwd(String password,Long[] userIds);


    /**
     * 通过用户ID删除用户
     *
     * @param userId 用户ID
     * @return 结果
     */
    public int deleteUserById(Long userId);

    /**
     * 批量删除用户信息
     *
     * @param userIds 需要删除的用户ID
     * @return 结果
     */
    public int deleteUserByIds(Long[] userIds);

    /**
     * 导入用户数据
     *
     * @param userList 用户数据列表
     * @param isUpdateSupport 是否更新支持，如果已存在，则进行更新数据
     * @param operName 操作用户
     * @return 结果
     */
    public String importUser(List<MediaUser> userList, Boolean isUpdateSupport, String operName);

}
