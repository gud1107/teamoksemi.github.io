-- 기존 MYQNALIST 삭제
DROP VIEW MYQNALIST;

-- MEMBER_NICK 컬럼을 추가함으로써 JOIN 구문은 생략했음
CREATE OR REPLACE VIEW MYQNALIST
AS SELECT ROW_NUMBER() OVER(PARTITION BY MEMBER_NO ORDER BY MEMBER_NO, QNA_NO DESC) NUM, A.*
FROM(SELECT QNA_NO, MEMBER_NO, MEMBER_NICK, ENROLL_DATE, QNA_TITLE, QNA_CONTENTS, ANSWER_STATUS, ANSWER_CONTENTS
FROM QNA
ORDER BY QNA_NO DESC)A;