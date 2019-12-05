    .file   "livenessTest.c"
    .option nopic
    .text
    .align 1
    .global livenessTest
    .type livenessTest, @function
livenessTest:

  addi  sp,sp,-112
  sd    s0,104(sp)
  addi  s0,sp,112
  sd    a0,-64(s0)
  ld    a0,-64(s0)
  ld    t0,0(a0)
  sd    t0,-32(s0)
  ld    t0,8(a0)
  sd    t0,-40(s0)
  ld    t0,16(a0)
  sd    t0,-48(s0)
nop
nop
nop
  #a := 0 
  #label: 0
  li    t0,0
  sd    t0,-32(s0)
  j     .L2
#code for while condition (a Less 444 )  met: 
.L3:
  #b := (a + 1 ) 
  #label: 2
  ld    t0,-32(s0)
  sd    t0,-16(s0)
  li    t0,1
  ld    t1,-16(s0)
  add   t0,t0,t1
  sd    t0,-40(s0)
  #c := (c + b ) 
  #label: 3
  ld    t0,-48(s0)
  sd    t0,-16(s0)
  ld    t0,-40(s0)
  ld    t1,-16(s0)
  add   t0,t0,t1
  sd    t0,-48(s0)
  #a := (b * 2 ) 
  #label: 4
  ld    t0,-40(s0)
  sd    t0,-16(s0)
  li    t0,2
  ld    t1,-16(s0)
  mul   t0,t0,t1
  sd    t0,-32(s0)
#while condition: (a Less 444 ) 
  #label: 1
.L2:
  ld    t0,-32(s0)
  sd    t0,-16(s0)
  li    t0,444
  ld    t1,-16(s0)
  sub   t1,t0,t1
  sgtz  t0,t1
  bnez  t0,.L3
#code for while condition (a Less 444 )  not met: 
nop
nop
nop
  ld    a0,-64(s0)
  ld    t0,-32(s0)
  sd    t0,0(a0)
  ld    t0,-40(s0)
  sd    t0,8(a0)
  ld    t0,-48(s0)
  sd    t0,16(a0)
nop
  ld    s0,104(sp)
  addi  sp,sp,112
jr  ra
    .size   livenessTest, .-livenessTest
    .ident "GCC: (GNU) 9.0.1 20190123 (Red Hat 9.0.1-0.1)"
    .section        .note.GNU-stack,"",@progbits

