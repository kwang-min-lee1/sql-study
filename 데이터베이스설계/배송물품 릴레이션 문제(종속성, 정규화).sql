/*
다음은 배송(Shipping) 물품에 대한 릴레이션이다. 물음에 답하시오.

릴레이션: 
Shipping(shipname, shiptype, voyageID, cargo, port, date)

함수 종속성: 
shipname -> shiptype
voyageID -> shipname, cargo
{shipname, date} -> voyageID, port

1. 함수 종속성 다이어그램을 그리시오.
2. 후보키를 찾으시오
3. 제2정규형으로 정규화하시오.
4. 제3정규형으로 정규화하시오
5. BCNF로 정규화하시오

*/
