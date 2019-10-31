    .file   "test5.c"
    .option nopic
    .text
    .align 1
    .global test5
    .type test5, @function
test5:

  addi  sp,sp,-152
  sd    s0,144(sp)
  addi  s0,sp,152
  sd    a0,-104(s0)
  ld    a0,-104(s0)
  ld    t0,0(a0)
  sd    t0,-56(s0)
  ld    t0,8(a0)
  sd    t0,-64(s0)
  ld    t0,16(a0)
  sd    t0,-72(s0)
nop
nop
nop
  j     .L2
.L3:
  ld    t0,-64(s0)
  sd    t0,-16(s0)
  li    t0,2
  sd    t0,-24(s0)
  ld    t0,-56(s0)
  sd    t0,-32(s0)
  ld    t0,-56(s0)
  sd    t0,-40(s0)
  li    t0,2
  ld    t1,-40(s0)
  mul   t0,t0,t1
  sd    t0,-40(s0)
  ld    t0,-72(s0)
  ld    t1,-40(s0)
  sub   t0,t1,t0
  ld    t1,-32(s0)
  add   t0,t0,t1
  sd    t0,-32(s0)
  ld    t0,-56(s0)
  ld    t1,-32(s0)
  mul   t0,t0,t1
  ld    t1,-24(s0)
  add   t0,t0,t1
  ld    t1,-16(s0)
  add   t0,t0,t1
  sd    t0,-64(s0)
  ld    t0,-64(s0)
  sd    t0,-80(s0)
  j     .L4
.L5:
  ld    t0,-72(s0)
  sd    t0,-16(s0)
  li    t0,1
  ld    t1,-16(s0)
  add   t0,t0,t1
  sd    t0,-72(s0)
  ld    t0,-80(s0)
  sd    t0,-16(s0)
  li    t0,1
  ld    t1,-16(s0)
  add   t0,t0,t1
  sd    t0,-80(s0)
  j     .L6
.L7:
  ld    t0,-72(s0)
  sd    t0,-16(s0)
  li    t0,2
  ld    t1,-16(s0)
  mul   t0,t0,t1
  sd    t0,-72(s0)
  ld    t0,-80(s0)
  sd    t0,-16(s0)
  li    t0,500
  ld    t1,-16(s0)
  sub   t0,t1,t0
  sd    t0,-80(s0)
  ld    t0,-56(s0)
  sd    t0,-16(s0)
  ld    t0,-64(s0)
  ld    t1,-16(s0)
  sub   t1,t1,t0
  sgtz  t0,t1
  beqz  t0,.L8
  ld    t0,-72(s0)
  sd    t0,-16(s0)
  ld    t0,-56(s0)
  ld    t1,-16(s0)
  sub   t1,t0,t1
  sgtz  t0,t1
  beqz  t0,.L10
  ld    t0,-64(s0)
  sd    t0,-16(s0)
  ld    t0,-56(s0)
  ld    t1,-16(s0)
  sub   t1,t0,t1
  sgtz  t0,t1
  xori  t0,t0,1
  beqz  t0,.L12
  li    t0,2
  sd    t0,-16(s0)
  ld    t0,-56(s0)
  ld    t1,-16(s0)
  mul   t0,t0,t1
  sd    t0,-72(s0)
  j     .L13
.L12:
  li    t0,2
  sd    t0,-16(s0)
  ld    t0,-64(s0)
  ld    t1,-16(s0)
  mul   t0,t0,t1
  sd    t0,-72(s0)
.L13:
  j     .L11
.L10:
  li    t0,30
  sd    t0,-80(s0)
  ld    t0,-80(s0)
  sd    t0,-16(s0)
  li    t0,10
  ld    t1,-16(s0)
  sub   t1,t1,t0
  sgtz  t0,t1
  beqz  t0,.L14
  ld    t0,-56(s0)
  sd    t0,-16(s0)
  ld    t0,-64(s0)
  ld    t1,-16(s0)
  add   t0,t0,t1
  sd    t0,-16(s0)
  ld    t0,-72(s0)
  ld    t1,-16(s0)
  add   t0,t0,t1
  sd    t0,-56(s0)
  j     .L15
.L14:
  ld    t0,-56(s0)
  sd    t0,-16(s0)
  ld    t0,-64(s0)
  ld    t1,-16(s0)
  sub   t0,t1,t0
  sd    t0,-16(s0)
  ld    t0,-72(s0)
  ld    t1,-16(s0)
  sub   t0,t1,t0
  sd    t0,-56(s0)
.L15:
.L11:
  j     .L9
.L8:
  ld    t0,-72(s0)
  sd    t0,-16(s0)
  ld    t0,-56(s0)
  ld    t1,-16(s0)
  sub   t1,t1,t0
  seqz  t0,t1
  beqz  t0,.L16
  ld    t0,-56(s0)
  sd    t0,-16(s0)
  ld    t0,-64(s0)
  ld    t1,-16(s0)
  add   t0,t0,t1
  sd    t0,-72(s0)
  j     .L17
.L16:
  ld    t0,-64(s0)
  sd    t0,-16(s0)
  ld    t0,-56(s0)
  ld    t1,-16(s0)
  sub   t1,t0,t1
  sgtz  t0,t1
  xori  t0,t0,1
  beqz  t0,.L18
  ld    t0,-56(s0)
  sd    t0,-16(s0)
  li    t0,2
  sd    t0,-24(s0)
  ld    t0,-64(s0)
  ld    t1,-24(s0)
  mul   t0,t0,t1
  ld    t1,-16(s0)
  add   t0,t0,t1
  sd    t0,-72(s0)
  j     .L19
.L18:
  ld    t0,-56(s0)
  sd    t0,-16(s0)
  li    t0,2
  sd    t0,-24(s0)
  ld    t0,-64(s0)
  ld    t1,-24(s0)
  mul   t0,t0,t1
  ld    t1,-16(s0)
  sub   t0,t1,t0
  sd    t0,-72(s0)
.L19:
.L17:
.L9:
  li    t0,2
  sd    t0,-88(s0)
  j     .L20
.L21:
  ld    t0,-56(s0)
  sd    t0,-16(s0)
  li    t0,2
  ld    t1,-16(s0)
  add   t0,t0,t1
  sd    t0,-56(s0)
  ld    t0,-88(s0)
  sd    t0,-16(s0)
  li    t0,1
  ld    t1,-16(s0)
  sub   t0,t1,t0
  sd    t0,-88(s0)
.L20:
  ld    t0,-88(s0)
  sd    t0,-16(s0)
  li    t0,0
  ld    t1,-16(s0)
  sub   t1,t0,t1
  sgtz  t0,t1
  xori  t0,t0,1
  bnez  t0,.L21
.L6:
  ld    t0,-80(s0)
  sd    t0,-16(s0)
  li    t0,0
  ld    t1,-16(s0)
  sub   t1,t1,t0
  sgtz  t0,t1
  bnez  t0,.L7
.L4:
  li    t0,0
  sd    t0,-16(s0)
  li    t0,1
  sd    t0,-24(s0)
  ld    t1,-24(s0)
  xori  t0,t1,1
  sd    t0,-24(s0)
  ld    t0,-64(s0)
  sd    t0,-32(s0)
  ld    t0,-56(s0)
  ld    t1,-32(s0)
  sub   t1,t1,t0
  sgtz  t0,t1
  sd    t0,-32(s0)
  ld    t0,-72(s0)
  sd    t0,-40(s0)
  ld    t0,-56(s0)
  ld    t1,-40(s0)
  sub   t1,t1,t0
  sgtz  t0,t1
  xori  t0,t0,1
  ld    t1,-32(s0)
  mul   t0,t0,t1
  ld    t1,-24(s0)
  add   t0,t0,t1
  sd    t0,-24(s0)
  ld    t0,-56(s0)
  sd    t0,-32(s0)
  li    t0,100
  ld    t1,-32(s0)
  mul   t0,t0,t1
  sd    t0,-32(s0)
  ld    t0,-72(s0)
  ld    t1,-32(s0)
  sub   t1,t0,t1
  sgtz  t0,t1
  xori  t0,t0,1
  ld    t1,-24(s0)
  add   t0,t0,t1
  ld    t1,-16(s0)
  add   t0,t0,t1
  bnez  t0,.L5
  ld    t0,-56(s0)
  sd    t0,-16(s0)
  li    t0,1
  ld    t1,-16(s0)
  sub   t0,t1,t0
  sd    t0,-56(s0)
.L2:
  li    t0,0
  sd    t0,-16(s0)
  ld    t0,-56(s0)
  ld    t1,-16(s0)
  sub   t1,t1,t0
  sgtz  t0,t1
  xori  t0,t0,1
  bnez  t0,.L3
nop
nop
nop
  ld    a0,-104(s0)
  ld    t0,-56(s0)
  sd    t0,0(a0)
  ld    t0,-64(s0)
  sd    t0,8(a0)
  ld    t0,-72(s0)
  sd    t0,16(a0)
nop
  ld    s0,144(sp)
  addi  sp,sp,152
jr  ra
    .size   test5, .-test5
    .ident "GCC: (GNU) 9.0.1 20190123 (Red Hat 9.0.1-0.1)"
    .section        .note.GNU-stack,"",@progbits

