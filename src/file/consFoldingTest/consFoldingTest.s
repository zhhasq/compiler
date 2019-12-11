    .file   "consFoldingTest.c"
    .option nopic
    .text
    .align 1
    .global consFoldingTest
    .type consFoldingTest, @function
consFoldingTest:

  addi  sp,sp,-136
  sd    s0,128(sp)
  addi  s0,sp,136
  sd    a0,-88(s0)
  ld    a0,-88(s0)
  ld    t0,0(a0)
  sd    t0,-48(s0)
  ld    t0,8(a0)
  sd    t0,-56(s0)
  ld    t0,16(a0)
  sd    t0,-64(s0)
  ld    t0,24(a0)
  sd    t0,-72(s0)
nop
nop
nop
  #a := 10 
  #label: 0
  li    t0,10
  sd    t0,-48(s0)
  #b := 20 
  #label: 1
  li    t0,20
  sd    t0,-56(s0)
  #c := (a + b ) 
  #label: 2
  ld    t0,-48(s0)
  sd    t0,-16(s0)
  ld    t0,-56(s0)
  ld    t1,-16(s0)
  add   t0,t0,t1
  sd    t0,-64(s0)
  #d := ((a - ((a + (b * c ) ) * a ) ) - b ) 
  #label: 3
  ld    t0,-48(s0)
  sd    t0,-16(s0)
  ld    t0,-48(s0)
  sd    t0,-24(s0)
  ld    t0,-56(s0)
  sd    t0,-32(s0)
  ld    t0,-64(s0)
  ld    t1,-32(s0)
  mul   t0,t0,t1
  ld    t1,-24(s0)
  add   t0,t0,t1
  sd    t0,-24(s0)
  ld    t0,-48(s0)
  ld    t1,-24(s0)
  mul   t0,t0,t1
  ld    t1,-16(s0)
  sub   t0,t1,t0
  sd    t0,-16(s0)
  ld    t0,-56(s0)
  ld    t1,-16(s0)
  sub   t0,t1,t0
  sd    t0,-72(s0)
  j     .L2
#code for while condition (d Gre ((a - b ) + 3 ) )  met: 
.L3:
#IF condition: ((a * (a + b ) ) Gre (c + d ) ) 
  #label: 5
  ld    t0,-48(s0)
  sd    t0,-16(s0)
  ld    t0,-48(s0)
  sd    t0,-24(s0)
  ld    t0,-56(s0)
  ld    t1,-24(s0)
  add   t0,t0,t1
  ld    t1,-16(s0)
  mul   t0,t0,t1
  sd    t0,-16(s0)
  ld    t0,-64(s0)
  sd    t0,-24(s0)
  ld    t0,-72(s0)
  ld    t1,-24(s0)
  add   t0,t0,t1
  ld    t1,-16(s0)
  sub   t1,t1,t0
  sgtz  t0,t1
#go to .L4 if condition not met
  beqz  t0,.L4
#Things to do when IF condition: ((a * (a + b ) ) Gre (c + d ) )  is met
  #label: 6
nop
  j     .L5
#Things to do when IF condition: ((a * (a + b ) ) Gre (c + d ) )  is Not met
.L4:
  #a := (a * (b - d ) ) 
  #label: 7
  ld    t0,-48(s0)
  sd    t0,-16(s0)
  ld    t0,-56(s0)
  sd    t0,-24(s0)
  ld    t0,-72(s0)
  ld    t1,-24(s0)
  sub   t0,t1,t0
  ld    t1,-16(s0)
  mul   t0,t0,t1
  sd    t0,-48(s0)
#code after if ((a * (a + b ) ) Gre (c + d ) ) 
.L5:
  #c := 30 
  #label: 8
  li    t0,30
  sd    t0,-64(s0)
#while condition: (d Gre ((a - b ) + 3 ) ) 
  #label: 4
.L2:
  ld    t0,-72(s0)
  sd    t0,-16(s0)
  ld    t0,-48(s0)
  sd    t0,-24(s0)
  ld    t0,-56(s0)
  ld    t1,-24(s0)
  sub   t0,t1,t0
  sd    t0,-24(s0)
  li    t0,3
  ld    t1,-24(s0)
  add   t0,t0,t1
  ld    t1,-16(s0)
  sub   t1,t1,t0
  sgtz  t0,t1
  bnez  t0,.L3
#code for while condition (d Gre ((a - b ) + 3 ) )  not met: 
nop
nop
nop
  ld    a0,-88(s0)
  ld    t0,-48(s0)
  sd    t0,0(a0)
  ld    t0,-56(s0)
  sd    t0,8(a0)
  ld    t0,-64(s0)
  sd    t0,16(a0)
  ld    t0,-72(s0)
  sd    t0,24(a0)
nop
  ld    s0,128(sp)
  addi  sp,sp,136
jr  ra
    .size   consFoldingTest, .-consFoldingTest
    .ident "GCC: (GNU) 9.0.1 20190123 (Red Hat 9.0.1-0.1)"
    .section        .note.GNU-stack,"",@progbits

