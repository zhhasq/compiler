    .file   "test4.c"
    .option nopic
    .text
    .align 1
    .global test4
    .type test4, @function
test4:

  addi  sp,sp,-128
  sd    s0,120(sp)
  addi  s0,sp,128
  sd    a0,-80(s0)
  ld    a0,-80(s0)
  ld    t0,0(a0)
  sd    t0,-40(s0)
  ld    t0,8(a0)
  sd    t0,-48(s0)
  ld    t0,16(a0)
  sd    t0,-56(s0)
nop
nop
nop
  ld    t0,-40(s0)
  sd    t0,-16(s0)
  ld    t0,-48(s0)
  ld    t1,-16(s0)
  sub   t1,t1,t0
  sgtz  t0,t1
  beqz  t0,.L2
  ld    t0,-56(s0)
  sd    t0,-16(s0)
  ld    t0,-40(s0)
  ld    t1,-16(s0)
  sub   t1,t0,t1
  sgtz  t0,t1
  beqz  t0,.L4
  ld    t0,-48(s0)
  sd    t0,-16(s0)
  ld    t0,-40(s0)
  ld    t1,-16(s0)
  sub   t1,t0,t1
  sgtz  t0,t1
  xori  t0,t0,1
  beqz  t0,.L6
  li    t0,2
  sd    t0,-16(s0)
  ld    t0,-40(s0)
  ld    t1,-16(s0)
  mul   t0,t0,t1
  sd    t0,-56(s0)
  j     .L7
.L6:
  li    t0,2
  sd    t0,-16(s0)
  ld    t0,-48(s0)
  ld    t1,-16(s0)
  mul   t0,t0,t1
  sd    t0,-56(s0)
.L7:
  j     .L5
.L4:
  li    t0,30
  sd    t0,-64(s0)
  ld    t0,-64(s0)
  sd    t0,-16(s0)
  li    t0,10
  ld    t1,-16(s0)
  sub   t1,t1,t0
  sgtz  t0,t1
  beqz  t0,.L8
  ld    t0,-40(s0)
  sd    t0,-16(s0)
  ld    t0,-48(s0)
  ld    t1,-16(s0)
  add   t0,t0,t1
  sd    t0,-16(s0)
  ld    t0,-56(s0)
  ld    t1,-16(s0)
  add   t0,t0,t1
  sd    t0,-40(s0)
  j     .L9
.L8:
  ld    t0,-40(s0)
  sd    t0,-16(s0)
  ld    t0,-48(s0)
  ld    t1,-16(s0)
  sub   t0,t1,t0
  sd    t0,-16(s0)
  ld    t0,-56(s0)
  ld    t1,-16(s0)
  sub   t0,t1,t0
  sd    t0,-40(s0)
.L9:
.L5:
  j     .L3
.L2:
  ld    t0,-56(s0)
  sd    t0,-16(s0)
  ld    t0,-40(s0)
  ld    t1,-16(s0)
  sub   t1,t1,t0
  seqz  t0,t1
  beqz  t0,.L10
  ld    t0,-40(s0)
  sd    t0,-16(s0)
  ld    t0,-48(s0)
  ld    t1,-16(s0)
  add   t0,t0,t1
  sd    t0,-56(s0)
  j     .L11
.L10:
  ld    t0,-48(s0)
  sd    t0,-16(s0)
  ld    t0,-40(s0)
  ld    t1,-16(s0)
  sub   t1,t0,t1
  sgtz  t0,t1
  xori  t0,t0,1
  beqz  t0,.L12
  ld    t0,-40(s0)
  sd    t0,-16(s0)
  li    t0,2
  sd    t0,-24(s0)
  ld    t0,-48(s0)
  ld    t1,-24(s0)
  mul   t0,t0,t1
  ld    t1,-16(s0)
  add   t0,t0,t1
  sd    t0,-56(s0)
  j     .L13
.L12:
  ld    t0,-40(s0)
  sd    t0,-16(s0)
  li    t0,2
  sd    t0,-24(s0)
  ld    t0,-48(s0)
  ld    t1,-24(s0)
  mul   t0,t0,t1
  ld    t1,-16(s0)
  sub   t0,t1,t0
  sd    t0,-56(s0)
.L13:
.L11:
.L3:
  ld    t0,-48(s0)
  sd    t0,-16(s0)
  ld    t0,-40(s0)
  ld    t1,-16(s0)
  sub   t0,t1,t0
  sd    t0,-40(s0)
  ld    t0,-40(s0)
  sd    t0,-16(s0)
  ld    t0,-48(s0)
  ld    t1,-16(s0)
  add   t0,t0,t1
  sd    t0,-56(s0)
  ld    t0,-40(s0)
  sd    t0,-16(s0)
  ld    t0,-48(s0)
  ld    t1,-16(s0)
  add   t0,t0,t1
  sd    t0,-16(s0)
  ld    t0,-56(s0)
  ld    t1,-16(s0)
  add   t0,t0,t1
  sd    t0,-48(s0)
nop
nop
nop
  ld    a0,-80(s0)
  ld    t0,-40(s0)
  sd    t0,0(a0)
  ld    t0,-48(s0)
  sd    t0,8(a0)
  ld    t0,-56(s0)
  sd    t0,16(a0)
nop
  ld    s0,120(sp)
  addi  sp,sp,128
jr  ra
    .size   test4, .-test4
    .ident "GCC: (GNU) 9.0.1 20190123 (Red Hat 9.0.1-0.1)"
    .section        .note.GNU-stack,"",@progbits

