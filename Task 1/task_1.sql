DECLARE
  u_id university.univ_id%TYPE;
  u_name university.univ_name%TYPE;
  u_rating university.rating%TYPE;
  u_city university.city%TYPE;

CURSOR uw_rating_g_400 IS SELECT * FROM university WHERE rating > 400;

u_rating_exception EXCEPTION;

BEGIN
  OPEN uw_rating_g_400;
  FETCH uw_rating_g_400 INTO u_id, u_name, u_rating, u_city;
  WHILE uw_rating_g_400%FOUND LOOP
    BEGIN
    
    IF u_city <> 'ÂÎÐÎÍÅÆ' THEN
      RAISE u_rating_exception;
    END IF;

    FETCH uw_rating_g_400 INTO u_id, u_name, u_rating, u_city;
    
    EXCEPTION WHEN u_rating_exception THEN
      dbms_output.put_line(u_name||' '||u_rating||' '||u_city);
      FETCH uw_rating_g_400 INTO u_id, u_name, u_rating, u_city;

    END;
  END LOOP;
END;
/