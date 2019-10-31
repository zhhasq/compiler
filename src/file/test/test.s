    .file   "test.c"
    .option nopic
    .text
    .align 1
    .global test
    .type test, @function
test:

  addi  sp,sp,-152
  sd    s0,144(sp)
  addi  s0,sp,152
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
nop
nop
nop
  j     .L2
#code for while condition (((true or ((false or ((a Gre 1 ) And (b Less 3 ) ) ) And (a Gre b ) ) ) or (Not((1 Gre 3 ) ) ) ) or (c Less 1 ) )  met: 
.L3:
  #a := (((2 + b ) - ((3 * (1 - (a * (5 - d ) ) ) ) * 2 ) ) - (c * 1 ) ) 
  li    t0,2
  sd    t0,-16(s0)
  ld    t0,-72(s0)
  ld    t1,-16(s0)
  add   t0,t0,t1
  sd    t0,-16(s0)
  li    t0,3
  sd    t0,-24(s0)
  li    t0,1
  sd    t0,-32(s0)
  ld    t0,-64(s0)
  sd    t0,-40(s0)
  li    t0,5
  sd    t0,-48(s0)
  ld    t0,-88(s0)
  ld    t1,-48(s0)
  sub   t0,t1,t0
  ld    t1,-40(s0)
  mul   t0,t0,t1
  ld    t1,-32(s0)
  sub   t0,t1,t0
  ld    t1,-24(s0)
  mul   t0,t0,t1
  sd    t0,-24(s0)
  li    t0,2
  ld    t1,-24(s0)
  mul   t0,t0,t1
  ld    t1,-16(s0)
  sub   t0,t1,t0
  sd    t0,-16(s0)
  ld    t0,-80(s0)
  sd    t0,-24(s0)
  li    t0,1
  ld    t1,-24(s0)
  mul   t0,t0,t1
  ld    t1,-16(s0)
  sub   t0,t1,t0
  sd    t0,-64(s0)
#while condition: (((true or ((false or ((a Gre 1 ) And (b Less 3 ) ) ) And (a Gre b ) ) ) or (Not((1 Gre 3 ) ) ) ) or (c Less 1 ) ) 
.L2:
  li    t0,1
  sd    t0,-16(s0)
  li    t0,0
  sd    t0,-24(s0)
  ld    t0,-64(s0)
  sd    t0,-32(s0)
  li    t0,1
  ld    t1,-32(s0)
  sub   t1,t1,t0
  sgtz  t0,t1
  sd    t0,-32(s0)
  ld    t0,-72(s0)
  sd    t0,-40(s0)
  li    t0,3
  ld    t1,-40(s0)
  sub   t1,t0,t1
  sgtz  t0,t1
  ld    t1,-32(s0)
  mul   t0,t0,t1
  ld    t1,-24(s0)
  add   t0,t0,t1
  sd    t0,-24(s0)
  ld    t0,-64(s0)
  sd    t0,-32(s0)
  ld    t0,-72(s0)
  ld    t1,-32(s0)
  sub   t1,t1,t0
  sgtz  t0,t1
  ld    t1,-24(s0)
  mul   t0,t0,t1
  ld    t1,-16(s0)
  add   t0,t0,t1
  sd    t0,-16(s0)
  li    t0,1
  sd    t0,-24(s0)
  li    t0,3
  ld    t1,-24(s0)
  sub   t1,t1,t0
  sgtz  t0,t1
  sd    t0,-24(s0)
  ld    t1,-24(s0)
  xori  t0,t1,1
  ld    t1,-16(s0)
  add   t0,t0,t1
  sd    t0,-16(s0)
  ld    t0,-80(s0)
  sd    t0,-24(s0)
  li    t0,1
  ld    t1,-24(s0)
  sub   t1,t0,t1
  sgtz  t0,t1
  ld    t1,-16(s0)
  add   t0,t0,t1
  bnez  t0,.L3
#code for while condition (((true or ((false or ((a Gre 1 ) And (b Less 3 ) ) ) And (a Gre b ) ) ) or (Not((1 Gre 3 ) ) ) ) or (c Less 1 ) )  not met: 
nop
nop
nop
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
  ld    s0,144(sp)
  addi  sp,sp,152
jr  ra
    .size   test, .-test
    .ident "GCC: (GNU) 9.0.1 20190123 (Red Hat 9.0.1-0.1)"
    .section        .note.GNU-stack,"",@progbits

