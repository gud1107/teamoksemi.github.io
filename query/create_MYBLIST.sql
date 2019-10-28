CREATE OR REPLACE VIEW MYBLIST
AS SELECT ROW_NUMBER() OVER(PARTITION BY MEMBER_NO ORDER BY MEMBER_NO, ARTICLE_NO DESC) NUM, A.*
FROM(SELECT ARTICLE_NO, MEMBER_NO, MEMBER_NICK, ARTICLE_VIEWS, ARTICLE_WISHES, ARTICLE_URL, ARTICLE_CONTENTS, ARTICLE_DATE, ARTICLE_STATUS
FROM BOARD
JOIN MEMBER USING(MEMBER_NO)
WHERE ARTICLE_STATUS='Y'
ORDER BY ARTICLE_NO DESC)A;