    .file   "fibo.c"
    .option nopic
    .text
    .align 1
    .global fibo
    .type fibo, @function
fibo:

  addi  sp,sp,-120
  sd    s3,112(sp)
  sd    s4,104(sp)
  sd    s0,96(sp)
  sd    s1,88(sp)
  sd    s2,80(sp)
  addi  s0,sp,120
  sd    a0,-104(s0)
  ld    a0,-104(s0)
  ld    t0,0(a0)
  sd    t0,-64(s0)
  ld    t0,8(a0)
  sd    t0,-72(s0)
  ld    t0,16(a0)
  sd    t0,-80(s0)
  ld    t0,24(a0)
  sd    t0,-88(s0)
  ld    s1,-80(s0)
  ld    s2,-72(s0)
  ld    s3,-88(s0)
  ld    s4,-64(s0)
nop
nop
nop
#IF condition: (a Less= 0 ) 
  #label: 0
  mv  t0,s4
  sd    t0,-48(s0)
  li    t0,0
  ld    t1,-48(s0)
  sub   t1,t1,t0
  sgtz  t0,t1
  xori  t0,t0,1
#go to .L2 if condition not met
  beqz  t0,.L2
#Things to do when IF condition: (a Less= 0 )  is met
  #b := 0 
  #label: 1
  li    t0,0
  mv  s2,t0
  j     .L3
#Things to do when IF condition: (a Less= 0 )  is Not met
.L2:
  #label: 2
nop
#code after if (a Less= 0 ) 
.L3:
#IF condition: (a Gre= 1 ) 
  #label: 3
  mv  t0,s4
  sd    t0,-48(s0)
  li    t0,1
  ld    t1,-48(s0)
  sub   t1,t0,t1
  sgtz  t0,t1
  xori  t0,t0,1
#go to .L4 if condition not met
  beqz  t0,.L4
#Things to do when IF condition: (a Gre= 1 )  is met
  #b := 1 
  #label: 4
  li    t0,1
  mv  s2,t0
  j     .L5
#Things to do when IF condition: (a Gre= 1 )  is Not met
.L4:
  #label: 5
nop
#code after if (a Gre= 1 ) 
.L5:
  #tmp1 := 0 
  #label: 6
  li    t0,0
  mv  s3,t0
  j     .L6
#code for while condition (a Gre 1 )  met: 
.L7:
  #sum := (tmp1 + b ) 
  #label: 8
  mv  t0,s3
  sd    t0,-48(s0)
  mv  t0,s2
  ld    t1,-48(s0)
  add   t0,t0,t1
  mv  s1,t0
  #tmp1 := b 
  #label: 9
  mv  t0,s2
  mv  s3,t0
  #b := sum 
  #label: 10
  mv  t0,s1
  mv  s2,t0
  #a := (a - 1 ) 
  #label: 11
  mv  t0,s4
  sd    t0,-48(s0)
  li    t0,1
  ld    t1,-48(s0)
  sub   t0,t1,t0
  mv  s4,t0
#while condition: (a Gre 1 ) 
  #label: 7
.L6:
  mv  t0,s4
  sd    t0,-48(s0)
  li    t0,1
  ld    t1,-48(s0)
  sub   t1,t1,t0
  sgtz  t0,t1
  bnez  t0,.L7
#code for while condition (a Gre 1 )  not met: 
nop
nop
nop
  sd    s2,-72(s0)
  sd    s1,-80(s0)
  sd    s2,-72(s0)
  sd    s3,-88(s0)
  sd    s4,-64(s0)
  ld    a0,-104(s0)
  ld    t0,-64(s0)
  sd    t0,0(a0)
  ld    t0,-72(s0)
  sd    t0,8(a0)
  ld    t0,-80(s0)
  sd    t0,16(a0)
  ld    t0,-88(s0)
  sd    t0,24(a0)
nop
  ld    s3,112(sp)
  ld    s4,104(sp)
  ld    s0,96(sp)
  ld    s1,88(sp)
  ld    s2,80(sp)
  addi  sp,sp,120
jr  ra
    .size   fibo, .-fibo
    .ident "GCC: (GNU) 9.0.1 20190123 (Red Hat 9.0.1-0.1)"
    .section        .note.GNU-stack,"",@progbits

