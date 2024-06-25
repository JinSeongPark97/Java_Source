package pack;

import java.util.List;

public class Main {

	public static void main(String[] args) {
		ProcessDao dao = ProcessDao.getInstance(); 
		try {
			// MyBatis Framework 사용
			/*
			System.out.println("sangdata 추가");
			DataDto dataDto = new DataDto();
			dataDto.setCode("100");
			dataDto.setSang("바나나");
			dataDto.setSu("5");
			dataDto.setDan("2000");
			
			dao.insData(dataDto); // 데이터 추가 -> commit이 되지 않았으므로 데이터가 추가되지 않음.
			*/
			
			/*
			System.out.println("sangdata 수정");
			DataDto dataDto = new DataDto();
			dataDto.setCode("100");
			dataDto.setSang("바나나우유");
			dataDto.setSu("7");
			
			dao.upData(dataDto); // 데이터 추가 -> commit이 되지 않았으므로 데이터가 추가되지 않음.
			*/
			
			System.out.println("sangdata 레코드 삭제");
			boolean b = dao.delData(100); // 100번 데이터 삭제
			
			if(b) {
				System.out.println("삭제 성공");
			}else {
				System.out.println("삭제 실패");
			}
									
			System.out.println("sangdata 전체 자료 읽기");
			List<DataDto> list = dao.selectAll();
			System.out.println(list.size());
			
			for(DataDto s : list) {
				System.out.println(s.getCode() + " " + s.getSang() + " " + s.getSu() + " " + s.getDan());
			} 
			
			
			System.out.println("\nsangdata 자료 한개 읽기");
			DataDto dto = dao.selectPart("1");
			System.out.println(dto.getCode() + " " + dto.getSang() + " " + dto.getSu() + " " + dto.getDan());

		} catch (Exception e) {
			System.out.println("err : " + e.getMessage());
		}
		
		
	}

}
