    .file   "test.c"
    .option nopic
    .text
    .align 1
    .global test
    .type test, @function
test:

  addi  sp,sp,-120
  sd    s0,112(sp)
  addi  s0,sp,120
  sd    a0,-72(s0)
  ld    a0,-72(s0)
  ld    t0,0(a0)
  sd    t0,-40(s0)
  ld    t0,8(a0)
  sd    t0,-48(s0)
  ld    t0,16(a0)
  sd    t0,-56(s0)
nop
nop
nop
#IF condition: ((count3 Less= count4 ) or ((count1 Less= count3 ) And true ) ) 
  ld    t0,-48(s0)
  sd    t0,-16(s0)
  ld    t0,-56(s0)
  ld    t1,-16(s0)
  sub   t1,t1,t0
  sgtz  t0,t1
  xori  t0,t0,1
  sd    t0,-16(s0)
  ld    t0,-40(s0)
  sd    t0,-24(s0)
  ld    t0,-48(s0)
  ld    t1,-24(s0)
  sub   t1,t1,t0
  sgtz  t0,t1
  xori  t0,t0,1
  sd    t0,-24(s0)
  li    t0,1
  ld    t1,-24(s0)
  mul   t0,t0,t1
  ld    t1,-16(s0)
  add   t0,t0,t1
#go to .L2 if condition not met
  beqz  t0,.L2
#Things to do when IF condition: ((count3 Less= count4 ) or ((count1 Less= count3 ) And true ) )  is met
  #count3 := (count3 + count4 ) 
  ld    t0,-48(s0)
  sd    t0,-16(s0)
  ld    t0,-56(s0)
  ld    t1,-16(s0)
  add   t0,t0,t1
  sd    t0,-48(s0)
  j     .L3
#Things to do when IF condition: ((count3 Less= count4 ) or ((count1 Less= count3 ) And true ) )  is Not met
.L2:
  #count3 := (count3 - count4 ) 
  ld    t0,-48(s0)
  sd    t0,-16(s0)
  ld    t0,-56(s0)
  ld    t1,-16(s0)
  sub   t0,t1,t0
  sd    t0,-48(s0)
#code after if ((count3 Less= count4 ) or ((count1 Less= count3 ) And true ) ) 
.L3:
nop
nop
nop
  ld    a0,-72(s0)
  ld    t0,-40(s0)
  sd    t0,0(a0)
  ld    t0,-48(s0)
  sd    t0,8(a0)
  ld    t0,-56(s0)
  sd    t0,16(a0)
nop
  ld    s0,112(sp)
  addi  sp,sp,120
jr  ra
    .size   test, .-test
    .ident "GCC: (GNU) 9.0.1 20190123 (Red Hat 9.0.1-0.1)"
    .section        .note.GNU-stack,"",@progbits

