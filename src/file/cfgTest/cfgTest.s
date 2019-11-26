    .file   "cfgTest.c"
    .option nopic
    .text
    .align 1
    .global cfgTest
    .type cfgTest, @function
cfgTest:

  addi  sp,sp,-120
  sd    s0,112(sp)
  addi  s0,sp,120
  sd    a0,-72(s0)
  ld    a0,-72(s0)
  ld    t0,0(a0)
  sd    t0,-32(s0)
  ld    t0,8(a0)
  sd    t0,-40(s0)
  ld    t0,16(a0)
  sd    t0,-48(s0)
  ld    t0,24(a0)
  sd    t0,-56(s0)
nop
nop
nop
  #a := b 
  #label: 0
  ld    t0,-40(s0)
  sd    t0,-32(s0)
  j     .L2
#code for while condition (a Gre b )  met: 
.L3:
  j     .L4
#code for while condition (b Gre c )  met: 
.L5:
  #b := 3 
  #label: 3
  li    t0,3
  sd    t0,-40(s0)
  j     .L6
#code for while condition (c Less 3 )  met: 
.L7:
  #a := 1 
  #label: 5
  li    t0,1
  sd    t0,-32(s0)
#while condition: (c Less 3 ) 
  #label: 4
.L6:
  ld    t0,-48(s0)
  sd    t0,-16(s0)
  li    t0,3
  ld    t1,-16(s0)
  sub   t1,t0,t1
  sgtz  t0,t1
  bnez  t0,.L7
#code for while condition (c Less 3 )  not met: 
  #c := 23 
  #label: 6
  li    t0,23
  sd    t0,-48(s0)
#while condition: (b Gre c ) 
  #label: 2
.L4:
  ld    t0,-40(s0)
  sd    t0,-16(s0)
  ld    t0,-48(s0)
  ld    t1,-16(s0)
  sub   t1,t1,t0
  sgtz  t0,t1
  bnez  t0,.L5
#code for while condition (b Gre c )  not met: 
  #a := c 
  #label: 7
  ld    t0,-48(s0)
  sd    t0,-32(s0)
  #b := c 
  #label: 8
  ld    t0,-48(s0)
  sd    t0,-40(s0)
#while condition: (a Gre b ) 
  #label: 1
.L2:
  ld    t0,-32(s0)
  sd    t0,-16(s0)
  ld    t0,-40(s0)
  ld    t1,-16(s0)
  sub   t1,t1,t0
  sgtz  t0,t1
  bnez  t0,.L3
#code for while condition (a Gre b )  not met: 
  #c := b 
  #label: 9
  ld    t0,-40(s0)
  sd    t0,-48(s0)
  j     .L8
#code for while condition (c Less a )  met: 
.L9:
  #a := (b - c ) 
  #label: 11
  ld    t0,-40(s0)
  sd    t0,-16(s0)
  ld    t0,-48(s0)
  ld    t1,-16(s0)
  sub   t0,t1,t0
  sd    t0,-32(s0)
#IF condition: (a Gre 111 ) 
  #label: 12
  ld    t0,-32(s0)
  sd    t0,-16(s0)
  li    t0,111
  ld    t1,-16(s0)
  sub   t1,t1,t0
  sgtz  t0,t1
#go to .L10 if condition not met
  beqz  t0,.L10
#Things to do when IF condition: (a Gre 111 )  is met
  #b := 1 
  #label: 13
  li    t0,1
  sd    t0,-40(s0)
#IF condition: (c Gre 22 ) 
  #label: 14
  ld    t0,-48(s0)
  sd    t0,-16(s0)
  li    t0,22
  ld    t1,-16(s0)
  sub   t1,t1,t0
  sgtz  t0,t1
#go to .L12 if condition not met
  beqz  t0,.L12
#Things to do when IF condition: (c Gre 22 )  is met
  #c := 1 
  #label: 15
  li    t0,1
  sd    t0,-48(s0)
  j     .L13
#Things to do when IF condition: (c Gre 22 )  is Not met
.L12:
  #c := 0 
  #label: 16
  li    t0,0
  sd    t0,-48(s0)
  j     .L14
#code for while condition (c Less 3 )  met: 
.L15:
  #a := 1 
  #label: 18
  li    t0,1
  sd    t0,-32(s0)
#while condition: (c Less 3 ) 
  #label: 17
.L14:
  ld    t0,-48(s0)
  sd    t0,-16(s0)
  li    t0,3
  ld    t1,-16(s0)
  sub   t1,t0,t1
  sgtz  t0,t1
  bnez  t0,.L15
#code for while condition (c Less 3 )  not met: 
#IF condition: (b = 99 ) 
  #label: 19
  ld    t0,-40(s0)
  sd    t0,-16(s0)
  li    t0,99
  ld    t1,-16(s0)
  sub   t1,t1,t0
  seqz  t0,t1
#go to .L16 if condition not met
  beqz  t0,.L16
#Things to do when IF condition: (b = 99 )  is met
  #a := 333 
  #label: 20
  li    t0,333
  sd    t0,-32(s0)
  j     .L18
#code for while condition (a = 333 )  met: 
.L19:
  #m := 1 
  #label: 22
  li    t0,1
  sd    t0,-56(s0)
#while condition: (a = 333 ) 
  #label: 21
.L18:
  ld    t0,-32(s0)
  sd    t0,-16(s0)
  li    t0,333
  ld    t1,-16(s0)
  sub   t1,t1,t0
  seqz  t0,t1
  bnez  t0,.L19
#code for while condition (a = 333 )  not met: 
  j     .L17
#Things to do when IF condition: (b = 99 )  is Not met
.L16:
  #label: 23
nop
#code after if (b = 99 ) 
.L17:
#code after if (c Gre 22 ) 
.L13:
  j     .L11
#Things to do when IF condition: (a Gre 111 )  is Not met
.L10:
  #b := 0 
  #label: 24
  li    t0,0
  sd    t0,-40(s0)
#code after if (a Gre 111 ) 
.L11:
#while condition: (c Less a ) 
  #label: 10
.L8:
  ld    t0,-48(s0)
  sd    t0,-16(s0)
  ld    t0,-32(s0)
  ld    t1,-16(s0)
  sub   t1,t0,t1
  sgtz  t0,t1
  bnez  t0,.L9
#code for while condition (c Less a )  not met: 
  #a := (b + c ) 
  #label: 25
  ld    t0,-40(s0)
  sd    t0,-16(s0)
  ld    t0,-48(s0)
  ld    t1,-16(s0)
  add   t0,t0,t1
  sd    t0,-32(s0)
nop
nop
nop
  ld    a0,-72(s0)
  ld    t0,-32(s0)
  sd    t0,0(a0)
  ld    t0,-40(s0)
  sd    t0,8(a0)
  ld    t0,-48(s0)
  sd    t0,16(a0)
  ld    t0,-56(s0)
  sd    t0,24(a0)
nop
  ld    s0,112(sp)
  addi  sp,sp,120
jr  ra
    .size   cfgTest, .-cfgTest
    .ident "GCC: (GNU) 9.0.1 20190123 (Red Hat 9.0.1-0.1)"
    .section        .note.GNU-stack,"",@progbits

