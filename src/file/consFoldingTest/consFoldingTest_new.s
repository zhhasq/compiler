    .file   "consFoldingTest.c"
    .option nopic
    .text
    .align 1
    .global consFoldingTest
    .type consFoldingTest, @function
consFoldingTest:

  addi  sp,sp,-136
  sd    s3,128(sp)
  sd    s4,120(sp)
  sd    s5,112(sp)
  sd    s11,104(sp)
  sd    s6,96(sp)
  sd    s10,88(sp)
  sd    s7,80(sp)
  sd    s8,72(sp)
  sd    s9,64(sp)
  sd    s0,56(sp)
  sd    s1,48(sp)
  sd    s2,40(sp)
  addi  s0,sp,136
  sd    a0,-176(s0)
  ld    a0,-176(s0)
  ld    t0,0(a0)
  sd    t0,-136(s0)
  ld    t0,8(a0)
  sd    t0,-144(s0)
  ld    t0,16(a0)
  sd    t0,-152(s0)
  ld    t0,24(a0)
  sd    t0,-160(s0)
  ld    s1,-160(s0)
  ld    s2,-152(s0)
  ld    s3,-144(s0)
  ld    s4,-136(s0)
nop
nop
nop
  #a := 10 
  #label: 0
  li    t0,10
  mv  s4,t0
  #b := 20 
  #label: 1
  li    t0,20
  mv  s3,t0
  #c := 30 
  #label: 2
  li    t0,30
  mv  s2,t0
  #d := -6110 
  #label: 3
  li    t0,-6110
  mv  s1,t0
  j     .L2
#code for while condition (-6110 Gre ((a - 20 ) + 3 ) )  met: 
.L3:
#IF condition: ((a * (a + 20 ) ) Gre -6080 ) 
  #label: 5
  mv  t0,s4
  sd    t0,-104(s0)
  mv  t0,s4
  sd    t0,-112(s0)
  li    t0,20
  ld    t1,-112(s0)
  add   t0,t0,t1
  ld    t1,-104(s0)
  mul   t0,t0,t1
  sd    t0,-104(s0)
  li    t0,-6080
  ld    t1,-104(s0)
  sub   t1,t1,t0
  sgtz  t0,t1
#go to .L4 if condition not met
  beqz  t0,.L4
#Things to do when IF condition: ((a * (a + 20 ) ) Gre -6080 )  is met
  #label: 6
nop
  j     .L5
#Things to do when IF condition: ((a * (a + 20 ) ) Gre -6080 )  is Not met
.L4:
  #a := (a * 6130 ) 
  #label: 7
  mv  t0,s4
  sd    t0,-104(s0)
  li    t0,6130
  ld    t1,-104(s0)
  mul   t0,t0,t1
  mv  s4,t0
#code after if ((a * (a + 20 ) ) Gre -6080 ) 
.L5:
  #c := 30 
  #label: 8
  li    t0,30
  mv  s2,t0
#while condition: (-6110 Gre ((a - 20 ) + 3 ) ) 
  #label: 4
.L2:
  li    t0,-6110
  sd    t0,-104(s0)
  mv  t0,s4
  sd    t0,-112(s0)
  li    t0,20
  ld    t1,-112(s0)
  sub   t0,t1,t0
  sd    t0,-112(s0)
  li    t0,3
  ld    t1,-112(s0)
  add   t0,t0,t1
  ld    t1,-104(s0)
  sub   t1,t1,t0
  sgtz  t0,t1
  bnez  t0,.L3
#code for while condition (-6110 Gre ((a - 20 ) + 3 ) )  not met: 
nop
nop
nop
  sd    s1,-160(s0)
  sd    s2,-152(s0)
  sd    s3,-144(s0)
  sd    s4,-136(s0)
  ld    a0,-176(s0)
  ld    t0,-136(s0)
  sd    t0,0(a0)
  ld    t0,-144(s0)
  sd    t0,8(a0)
  ld    t0,-152(s0)
  sd    t0,16(a0)
  ld    t0,-160(s0)
  sd    t0,24(a0)
nop
  ld    s3,128(sp)
  ld    s4,120(sp)
  ld    s5,112(sp)
  ld    s11,104(sp)
  ld    s6,96(sp)
  ld    s10,88(sp)
  ld    s7,80(sp)
  ld    s8,72(sp)
  ld    s9,64(sp)
  ld    s0,56(sp)
  ld    s1,48(sp)
  ld    s2,40(sp)
  addi  sp,sp,136
jr  ra
    .size   consFoldingTest, .-consFoldingTest
    .ident "GCC: (GNU) 9.0.1 20190123 (Red Hat 9.0.1-0.1)"
    .section        .note.GNU-stack,"",@progbits

