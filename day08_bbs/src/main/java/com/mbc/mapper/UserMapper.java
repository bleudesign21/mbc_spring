package com.mbc.mapper;

import java.util.List;

import com.mbc.model.UserDTO;

// DAO 대신 사용하는 인터페이스
public interface UserMapper {

	public List<UserDTO> userList();
	public int userInsert(UserDTO dto);
	public int deleteUser(int uno);
	public UserDTO userInfo(int uno);
	public int userUpdate(UserDTO dto);
	public UserDTO idCheck(String uid);
}
