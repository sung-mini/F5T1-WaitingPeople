-- 음식점 태그 이름 등록 -작성:이성민
DELIMITER //

CREATE TRIGGER check_tag_title_before_insert
BEFORE INSERT ON tb_tag
FOR EACH ROW
BEGIN
    IF CHAR_LENGTH(NEW.tag_title) > 10 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'tag_title은 10글자를 초과할 수 없습니다';
    END IF;
END//

DELIMITER ;
as

INSERT INTO tb_tag (tag_title)
VALUES ('바다가 보이는');  

INSERT INTO tb_tag (tag_title)
VALUES ('이 문자열은 10글자를 초과합니다'); 

-- 음식점 태그 삭제 -작성:이성민
DELETE FROM tb_tag
WHERE tag_title = '한강뷰가 보이는';

-- 데이터 조회 -작성:이성민
SELECT * FROM tb_tag;
SELECT * FROM tb_restaurant;