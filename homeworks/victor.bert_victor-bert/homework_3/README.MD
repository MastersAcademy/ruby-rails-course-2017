###homework #3

####class Institution
+ type
+ name
+ menu
+ contacts
1 opened


####class Employer
+ name
+ type


####class Visitor
+ name
+ gender
+ order
+ table
1 ask => (table or bill or menu)
2 choose => (table or dish)
3 call
4 make
5 eat
6 pay
7 awaits
8 leave
9 goHome

####class Waitress < Employer
+ name
1 menu
2 order
3 give
4 bill
5 clean


