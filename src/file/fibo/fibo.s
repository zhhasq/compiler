    .file   "fibo.c"
    .option nopic
    .text
    .align 1
    .global fibo
    .type fibo, @function
fibo:

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
#IF condition: (a Less= 0 ) 
  ld    t0,-32(s0)
  sd    t0,-16(s0)
  li    t0,0
  ld    t1,-16(s0)
  sub   t1,t1,t0
  sgtz  t0,t1
  xori  t0,t0,1
#go to .L2 if condition not met
  beqz  t0,.L2
#Things to do when IF condition: (a Less= 0 )  is met
  #b := 0 
  li    t0,0
  sd    t0,-40(s0)
  j     .L3
#Things to do when IF condition: (a Less= 0 )  is Not met
.L2:
nop
#code after if (a Less= 0 ) 
.L3:
#IF condition: (a Gre= 1 ) 
  ld    t0,-32(s0)
  sd    t0,-16(s0)
  li    t0,1
  ld    t1,-16(s0)
  sub   t1,t0,t1
  sgtz  t0,t1
  xori  t0,t0,1
#go to .L4 if condition not met
  beqz  t0,.L4
#Things to do when IF condition: (a Gre= 1 )  is met
  #b := 1 
  li    t0,1
  sd    t0,-40(s0)
  j     .L5
#Things to do when IF condition: (a Gre= 1 )  is Not met
.L4:
nop
#code after if (a Gre= 1 ) 
.L5:
  #tmp1 := 0 
  li    t0,0
  sd    t0,-56(s0)
  j     .L6
#code for while condition (a Gre 1 )  met: 
.L7:
  #sum := (tmp1 + b ) 
  ld    t0,-56(s0)
  sd    t0,-16(s0)
  ld    t0,-40(s0)
  ld    t1,-16(s0)
  add   t0,t0,t1
  sd    t0,-48(s0)
  #tmp1 := b 
  ld    t0,-40(s0)
  sd    t0,-56(s0)
  #b := sum 
  ld    t0,-48(s0)
  sd    t0,-40(s0)
  #a := (a - 1 ) 
  ld    t0,-32(s0)
  sd    t0,-16(s0)
  li    t0,1
  ld    t1,-16(s0)
  sub   t0,t1,t0
  sd    t0,-32(s0)
#while condition: (a Gre 1 ) 
.L6:
  ld    t0,-32(s0)
  sd    t0,-16(s0)
  li    t0,1
  ld    t1,-16(s0)
  sub   t1,t1,t0
  sgtz  t0,t1
  bnez  t0,.L7
#code for while condition (a Gre 1 )  not met: 
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
    .size   fibo, .-fibo
    .ident "GCC: (GNU) 9.0.1 20190123 (Red Hat 9.0.1-0.1)"
    .section        .note.GNU-stack,"",@progbits

