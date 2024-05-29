// bonus is completed
// starting address of array sum func: 44

0: CP 40 90      
1: CP 41 100
2: CP 42 48
3: BZJi 44 0    // jump to func
4: CP 75 43

5: CP 40 91
6: CP 41 130
7: CP 42 49
8: BZJi 44 0    // jump to func
9: CP 77 43

10: CP 147 75
11: CP 148 100
12: CP 50 46
13: BZJi 146 0    // jump to fn
14: CP 76 149

15: CP 147 77
16: CP 148 130
17: CP 50 47
18: BZJi 146 0
19: CP 78 149

20: BZJi 45 0    // end


// start of array sum
21: CPi 70 0
22: CPi 71 0
23: CPi 72 0
24: CPi 73 0
25: CPi 43 0
26: CPi 74 0
27: CP 73 74
28: LT 73 41
29: BZJ 67 73
30: CP 72 40
31: ADD 72 74
32: CPI 71 72
33: ADD 43 71
34: ADDi 74 1    // counter ++
35: BZJi 65 0
36: BZJi 42 0

40: 0    // array start
41: 0    // size of array
42: 0    // return address 
43: 0    // result of array sum func
44: 21   // starting address of array sum func

45: 20

46: 14    // return address of first func
47: 19    // return address after second function

48: 4    // return address after first call
49: 9    // return address after second call

50: 0    // stack pointer

65: 27 
66: 42 
67: 36 
68: 11    
69: 2    
70: 0    
71: 0    
72: 0    
73: 0    
74: 0    // counter1


75: 0    // sum of array 1
76: 0    // mean of array 1
77: 0    // sum of array 2
78: 0    // mean of array 2

90: 101  // array 1 start index
91: 131  // array 2 start index

100: 20  // SIZE of section A
101: 9   // first grade of Section A
102: 1   
103: 2
104: 2
105: 5
106: 7
107: 10
108: 7
109: 8
110: 6
111: 9
112: 4   
113: 2
114: 4
115: 3
116: 7
117: 10
118: 0
119: 8
120: 6   // last grade of Section A

130: 12  // SIZE of section B
131: 9   // first grade of Section B
132: 1   
133: 2
134: 4
135: 3
136: 7
137: 2
138: 0
139: 8
140: 5
141: 8
142: 1   // last grade of Section B   

146: 150 // divider start address , divider function
147: 0   // operand 1
148: 0   // operand 2
149: 0   // result
150: CPi 149 0
151: CP 173 147
152: CP 172 173
153: LT 172 148
154: LTi 172 1
155: BZJ 50 172
156: ADDi 149 1
157: CP 171 148
158: NAND 171 171
159: ADDi 171 1
160: ADD 173 171
161: BZJi 169 152  
169: 0 
170: 0 // temp
171: 0 // temp2
172: 0 // temp3
173: 0 // temp4                      , end of divider 
