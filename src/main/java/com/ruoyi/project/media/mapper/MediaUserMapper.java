package com.ruoyi.project.media.mapper;

import com.ruoyi.project.media.domain.MediaUser;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @Date 2023/1/11 /10:33
 * @Author guohc
 * @Description
 */
public interface MediaUserMapper {
    /**
     * 根据条件分页查询用户列表
     *
     * @param mediaUser 用户信息
     * @return 用户信息集合信息
     */
    List<MediaUser> selectUserList(MediaUser mediaUser);

    /**
     * 通过用户名查询用户
     *
     * @param userName 用户名
     * @return 用户对象信息
     */
    MediaUser selectUserByUserName(String userName);

    /**
     * 通过用户ID查询用户
     *
     * @param userId 用户ID
     * @return 用户对象信息
     */
    MediaUser selectUserById(Long userId);

    /**
     * 新增用户信息
     *
     * @param mediaUser 用户信息
     * @return 结果
     */
    int insertUser(MediaUser mediaUser);

    /**
     * 修改用户信息
     *
     * @param mediaUser 用户信息
     * @return 结果
     */
    int updateUser(MediaUser mediaUser);


    /**
     * 修改用户状态
     *
     * @param mediaUser 用户信息
     * @return 结果
     */
    public int updateUserStatus(MediaUser mediaUser);


    /**
     * 重置用户密码
     *
     * @param userIds 需要重置密码的用户id
     * @param password 密码
     * @return 结果
     */
    public int resetUserPwd(@Param("password") String password,@Param("userIds") Long[] userIds);

    /**
     * 通过用户ID删除用户
     *
     * @param userId 用户ID
     * @return 结果
     */
    int deleteUserById(Long userId);

    /**
     * 批量删除用户信息
     *
     * @param userIds 需要删除的用户ID
     * @return 结果
     */
    int deleteUserByIds(Long[] userIds);

    /**
     * 校验用户名称是否唯一
     *
     * @param userName 用户名称
     * @return 结果
     */
    int checkUserNameUnique(String userName);

    /**
     * 校验手机号码是否唯一
     *
     * @param phonenumber 手机号码
     * @return 结果
     */
    MediaUser checkPhoneUnique(String phonenumber);
}
