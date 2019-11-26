    .file   "example39.c"
    .option nopic
    .text
    .align 1
    .global example39
    .type example39, @function
example39:

  addi  sp,sp,-112
  sd    s0,104(sp)
  addi  s0,sp,112
  sd    a0,-64(s0)
  ld    a0,-64(s0)
  ld    t0,0(a0)
  sd    t0,-40(s0)
  ld    t0,8(a0)
  sd    t0,-48(s0)
  ld    t0,16(a0)
  sd    t0,-32(s0)
nop
nop
nop
  #a := 9223372036854774808 
  #label: 0
  li    t0,9223372036854774808
  sd    t0,-40(s0)
  #b := (0 - 100000 ) 
  #label: 1
  li    t0,0
  sd    t0,-16(s0)
  li    t0,100000
  ld    t1,-16(s0)
  sub   t0,t1,t0
  sd    t0,-48(s0)
#IF condition: (a Less b ) 
  #label: 2
  ld    t0,-40(s0)
  sd    t0,-16(s0)
  ld    t0,-48(s0)
  ld    t1,-16(s0)
  sub   t1,t0,t1
  sgtz  t0,t1
#go to .L2 if condition not met
  beqz  t0,.L2
#Things to do when IF condition: (a Less b )  is met
  #output := 1 
  #label: 3
  li    t0,1
  sd    t0,-32(s0)
  j     .L3
#Things to do when IF condition: (a Less b )  is Not met
.L2:
  #output := 2 
  #label: 4
  li    t0,2
  sd    t0,-32(s0)
#code after if (a Less b ) 
.L3:
nop
nop
nop
  ld    a0,-64(s0)
  ld    t0,-40(s0)
  sd    t0,0(a0)
  ld    t0,-48(s0)
  sd    t0,8(a0)
  ld    t0,-32(s0)
  sd    t0,16(a0)
nop
  ld    s0,104(sp)
  addi  sp,sp,112
jr  ra
    .size   example39, .-example39
    .ident "GCC: (GNU) 9.0.1 20190123 (Red Hat 9.0.1-0.1)"
    .section        .note.GNU-stack,"",@progbits

