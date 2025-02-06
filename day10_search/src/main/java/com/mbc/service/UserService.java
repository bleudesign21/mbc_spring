package com.mbc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mbc.mapper.UserMapper;
import com.mbc.model.PageDTO;
import com.mbc.model.UserDTO;

@Service
public class UserService {
	@Autowired
	private UserMapper mapper;
	
//	public List<UserDTO> userList(){
////		List<UserDTO> dto = mapper.userList();
////		return dto;
//		
//		// 위의 두라인과 같다.
//		return mapper.userList();
//	}
	public List<UserDTO> userList(PageDTO pDto){
		int totalCnt = mapper.totalCnt(pDto);
		
		pDto.setValue(totalCnt, pDto.getCntPerPage());
		// 위의 두라인과 같다.
		return mapper.userList(pDto);
	}
	
	public int registerUser(UserDTO dto) {
		return mapper.userInsert(dto);
	}
	
	public int removeUser(int uno) {
		return mapper.deleteUser(uno);
	}
	
	public UserDTO userInfo(int uno) {
		return mapper.userInfo(uno);
	}
	
	public int modifyUser(UserDTO dto) {
		return mapper.userUpdate(dto);	
	}
	
	public UserDTO idCheck(String uid) {
		return mapper.idCheck(uid);
	}
}
