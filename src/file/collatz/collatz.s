    .file   "collatz.c"
    .option nopic
    .text
    .align 1
    .global collatz
    .type collatz, @function
collatz:

  addi  sp,sp,-136
  sd    s0,128(sp)
  addi  s0,sp,136
  sd    a0,-88(s0)
  ld    a0,-88(s0)
  ld    t0,0(a0)
  sd    t0,-40(s0)
  ld    t0,8(a0)
  sd    t0,-72(s0)
  ld    t0,16(a0)
  sd    t0,-32(s0)
  ld    t0,24(a0)
  sd    t0,-56(s0)
  ld    t0,32(a0)
  sd    t0,-48(s0)
  ld    t0,40(a0)
  sd    t0,-64(s0)
nop
nop
nop
# n := input
  ld    t0,-40(s0)
  sd    t0,-72(s0)
# steps := 0
  li    t0,0
  sd    t0,-64(s0)
  j     .L2
.L3:
# rem := n
  ld    t0,-72(s0)
  sd    t0,-48(s0)
# quot := 0
  li    t0,0
  sd    t0,-56(s0)
  j     .L4
.L5:
# rem := (rem-2)
  ld    t0,-48(s0)
  sd    t0,-16(s0)
  li    t0,2
  ld    t1,-16(s0)
  sub   t0,t1,t0
  sd    t0,-48(s0)
# quot := (quot+1)
  ld    t0,-56(s0)
  sd    t0,-16(s0)
  li    t0,1
  ld    t1,-16(s0)
  add   t0,t0,t1
  sd    t0,-56(s0)
.L4:
  ld    t0,-48(s0)
  sd    t0,-16(s0)
  li    t0,1
  ld    t1,-16(s0)
  sub   t1,t1,t0
  sgtz  t0,t1
  bnez  t0,.L5
  ld    t0,-48(s0)
  sd    t0,-16(s0)
  li    t0,0
  ld    t1,-16(s0)
  sub   t1,t1,t0
  seqz  t0,t1
  beqz  t0,.L6
# n := quot
  ld    t0,-56(s0)
  sd    t0,-72(s0)
  j     .L7
.L6:
# n := ((3*n)+1)
  li    t0,3
  sd    t0,-16(s0)
  ld    t0,-72(s0)
  ld    t1,-16(s0)
  mul   t0,t0,t1
  sd    t0,-16(s0)
  li    t0,1
  ld    t1,-16(s0)
  add   t0,t0,t1
  sd    t0,-72(s0)
.L7:
# steps := (steps+1)
  ld    t0,-64(s0)
  sd    t0,-16(s0)
  li    t0,1
  ld    t1,-16(s0)
  add   t0,t0,t1
  sd    t0,-64(s0)
.L2:
  ld    t0,-72(s0)
  sd    t0,-16(s0)
  li    t0,1
  ld    t1,-16(s0)
  sub   t1,t1,t0
  sgtz  t0,t1
  bnez  t0,.L3
# output := steps
  ld    t0,-64(s0)
  sd    t0,-32(s0)
nop
nop
nop
  ld    a0,-88(s0)
  ld    t0,-40(s0)
  sd    t0,0(a0)
  ld    t0,-72(s0)
  sd    t0,8(a0)
  ld    t0,-32(s0)
  sd    t0,16(a0)
  ld    t0,-56(s0)
  sd    t0,24(a0)
  ld    t0,-48(s0)
  sd    t0,32(a0)
  ld    t0,-64(s0)
  sd    t0,40(a0)
nop
  ld    s0,128(sp)
  addi  sp,sp,136
jr  ra
    .size   collatz, .-collatz
    .ident "GCC: (GNU) 9.0.1 20190123 (Red Hat 9.0.1-0.1)"
    .section        .note.GNU-stack,"",@progbits

