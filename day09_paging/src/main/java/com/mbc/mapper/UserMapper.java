package com.mbc.mapper;

import java.util.List;

import com.mbc.model.PageDTO;
import com.mbc.model.UserDTO;

// DAO 대신 사용하는 인터페이스
public interface UserMapper {

//	public List<UserDTO> userList();
	// 페이징 처리
	public List<UserDTO> userList(PageDTO pDto);
	public int userInsert(UserDTO dto);
	public int deleteUser(int uno);
	public UserDTO userInfo(int uno);
	public int userUpdate(UserDTO dto);
	public UserDTO idCheck(String uid);
	int totalCnt();
}
