package com.project.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.project.model.BoardVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class BoardTest {
	private static final Logger log = LoggerFactory.getLogger(BoardTest.class);
    
    @Autowired
    private BoardMapper mapper;

    @Test
    public void testEnroll() {
        
        BoardVO vo = new BoardVO();
        
        vo.setBbsTyp("02");
        vo.setBbsNo(4);
        vo.setBbsTitle("junit test 중!! 타이틀");
        vo.setBbsContent("junit content 테스트중");
        vo.setDocId("dsfsdfewrwe43534");
        vo.setBbsInsDte("20250101");
        vo.setBbsLstDte("20250101");
        vo.setUserId("admin");
        vo.setDelYn("N");
        
        mapper.boardEnrollTest(vo);
        
    }
}
