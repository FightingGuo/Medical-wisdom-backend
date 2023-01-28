package com.ruoyi.project.media.service.impl;

import com.ruoyi.common.constant.UserConstants;
import com.ruoyi.common.exception.CustomException;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.project.media.domain.MediaUser;
import com.ruoyi.project.media.mapper.MediaUserMapper;
import com.ruoyi.project.media.service.IMediaUserService;
import com.ruoyi.project.system.domain.SysUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Date 2023/1/11 /16:48
 * @Author guohc
 * @Description
 */
@Service
public class MediaUserServiceImpl implements IMediaUserService {

    @Autowired
    MediaUserMapper mediaUserMapper;

    /**
     * 根据条件分页查询用户列表
     *
     * @param mediaUser 用户信息
     * @return 用户信息集合信息
     */
    @Override
    public List<MediaUser> selectUserList(MediaUser mediaUser) {
        return mediaUserMapper.selectUserList(mediaUser);
    }

    /**
     * 通过用户名查询用户
     *
     * @param userName 用户名
     * @return 用户对象信息
     */
    @Override
    public MediaUser selectUserByUserName(String userName) {
        return mediaUserMapper.selectUserByUserName(userName);
    }

    /**
     * 通过用户ID查询用户
     *
     * @param userId 用户ID
     * @return 用户对象信息
     */
    @Override
    public MediaUser selectUserById(Long userId) {
        return mediaUserMapper.selectUserById(userId);
    }

    /**
     * 校验用户名称是否唯一
     *
     * @param userName 用户名称
     * @return 结果
     */
    @Override
    public String checkUserNameUnique(String userName) {
        int count = mediaUserMapper.checkUserNameUnique(userName);
        if (count > 0)
        {
            return UserConstants.NOT_UNIQUE;
        }
        return UserConstants.UNIQUE;
    }


    /**
     * 校验用户是否允许操作
     *
     * @param mediaUser 用户信息
     */
    @Override
    public void checkUserAllowed(MediaUser mediaUser)
    {
        if (StringUtils.isNotNull(mediaUser.getUserId()) && mediaUser.isAdmin())
        {
            throw new CustomException("不允许操作超级管理员用户");
        }
    }

    /**
     * 校验手机号码是否唯一
     *
     * @param mediaUser 用户信息
     * @return 结果
     */
    @Override
    public String checkPhoneUnique(MediaUser mediaUser) {
        Long userId = StringUtils.isNull(mediaUser.getUserId()) ? -1L : mediaUser.getUserId();
        MediaUser info = mediaUserMapper.checkPhoneUnique(mediaUser.getPhoneNumber());
        if (StringUtils.isNotNull(info) && info.getUserId().longValue() != userId.longValue())
        {
            return UserConstants.NOT_UNIQUE;
        }
        return UserConstants.UNIQUE;
    }

    /**
     * 新增用户信息
     *
     * @param mediaUser 用户信息
     * @return 结果
     */
    @Override
    public int insertUser(MediaUser mediaUser) {
        return mediaUserMapper.insertUser(mediaUser);
    }

    /**
     * 修改用户信息
     *
     * @param mediaUser 用户信息
     * @return 结果
     */
    @Override
    public int updateUser(MediaUser mediaUser) {
        return mediaUserMapper.updateUser(mediaUser);
    }

    /**
     * 修改用户状态
     *
     * @param mediaUser 用户信息
     * @return 结果
     */
    @Override
    public int updateUserStatus(MediaUser mediaUser) {
        return mediaUserMapper.updateUserStatus(mediaUser);
    }

    /**
     * 重置用户密码
     *
     * @param userIds 需要重置密码的用户id
     * @param password 密码
     * @return 结果
     */
    @Override
    public int resetUserPwd(String password,Long[] userIds) {
        return mediaUserMapper.resetUserPwd(password,userIds);
    }

    /**
     * 通过用户ID删除用户
     *
     * @param userId 用户ID
     * @return 结果
     */
    @Override
    public int deleteUserById(Long userId) {
        return mediaUserMapper.deleteUserById(userId);
    }

    /**
     * 批量删除用户信息
     *
     * @param userIds 需要删除的用户ID
     * @return 结果
     */
    @Override
    public int deleteUserByIds(Long[] userIds) {
        return mediaUserMapper.deleteUserByIds(userIds);
    }

    /**
     * 导入用户数据
     *
     * @param userList        用户数据列表
     * @param isUpdateSupport 是否更新支持，如果已存在，则进行更新数据
     * @param operName        操作用户
     * @return 结果
     */
    @Override
    public String importUser(List<MediaUser> userList, Boolean isUpdateSupport, String operName) {
        return null;
    }

}
