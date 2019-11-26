    .file   "cfgTest2.c"
    .option nopic
    .text
    .align 1
    .global cfgTest2
    .type cfgTest2, @function
cfgTest2:

  addi  sp,sp,-176
  sd    s0,168(sp)
  addi  s0,sp,176
  sd    a0,-128(s0)
  ld    a0,-128(s0)
  ld    t0,0(a0)
  sd    t0,-48(s0)
  ld    t0,8(a0)
  sd    t0,-56(s0)
  ld    t0,16(a0)
  sd    t0,-64(s0)
  ld    t0,24(a0)
  sd    t0,-72(s0)
  ld    t0,32(a0)
  sd    t0,-80(s0)
  ld    t0,40(a0)
  sd    t0,-112(s0)
  ld    t0,48(a0)
  sd    t0,-104(s0)
  ld    t0,56(a0)
  sd    t0,-88(s0)
  ld    t0,64(a0)
  sd    t0,-96(s0)
  ld    t0,72(a0)
  sd    t0,-32(s0)
  ld    t0,80(a0)
  sd    t0,-40(s0)
nop
nop
nop
#IF condition: (a = 0 ) 
  #label: 0
  ld    t0,-48(s0)
  sd    t0,-16(s0)
  li    t0,0
  ld    t1,-16(s0)
  sub   t1,t1,t0
  seqz  t0,t1
#go to .L2 if condition not met
  beqz  t0,.L2
#Things to do when IF condition: (a = 0 )  is met
#IF condition: (b = 0 ) 
  #label: 1
  ld    t0,-56(s0)
  sd    t0,-16(s0)
  li    t0,0
  ld    t1,-16(s0)
  sub   t1,t1,t0
  seqz  t0,t1
#go to .L4 if condition not met
  beqz  t0,.L4
#Things to do when IF condition: (b = 0 )  is met
  #d := 0 
  #label: 2
  li    t0,0
  sd    t0,-72(s0)
#IF condition: (k = 0 ) 
  #label: 3
  ld    t0,-112(s0)
  sd    t0,-16(s0)
  li    t0,0
  ld    t1,-16(s0)
  sub   t1,t1,t0
  seqz  t0,t1
#go to .L6 if condition not met
  beqz  t0,.L6
#Things to do when IF condition: (k = 0 )  is met
  j     .L8
#code for while condition (loop1 Gre 0 )  met: 
.L9:
  #loop1 := 11 
  #label: 5
  li    t0,11
  sd    t0,-104(s0)
#while condition: (loop1 Gre 0 ) 
  #label: 4
.L8:
  ld    t0,-104(s0)
  sd    t0,-16(s0)
  li    t0,0
  ld    t1,-16(s0)
  sub   t1,t1,t0
  sgtz  t0,t1
  bnez  t0,.L9
#code for while condition (loop1 Gre 0 )  not met: 
  j     .L7
#Things to do when IF condition: (k = 0 )  is Not met
.L6:
  #label: 6
nop
#code after if (k = 0 ) 
.L7:
  j     .L5
#Things to do when IF condition: (b = 0 )  is Not met
.L4:
  #d := 1 
  #label: 7
  li    t0,1
  sd    t0,-72(s0)
  j     .L10
#code for while condition (loop2 Gre 0 )  met: 
.L11:
#IF condition: (f = 0 ) 
  #label: 9
  ld    t0,-80(s0)
  sd    t0,-16(s0)
  li    t0,0
  ld    t1,-16(s0)
  sub   t1,t1,t0
  seqz  t0,t1
#go to .L12 if condition not met
  beqz  t0,.L12
#Things to do when IF condition: (f = 0 )  is met
  #label: 10
nop
  j     .L13
#Things to do when IF condition: (f = 0 )  is Not met
.L12:
  #label: 11
nop
#code after if (f = 0 ) 
.L13:
#while condition: (loop2 Gre 0 ) 
  #label: 8
.L10:
  ld    t0,-88(s0)
  sd    t0,-16(s0)
  li    t0,0
  ld    t1,-16(s0)
  sub   t1,t1,t0
  sgtz  t0,t1
  bnez  t0,.L11
#code for while condition (loop2 Gre 0 )  not met: 
#code after if (b = 0 ) 
.L5:
  j     .L3
#Things to do when IF condition: (a = 0 )  is Not met
.L2:
  j     .L14
#code for while condition (loop3 Gre 0 )  met: 
.L15:
#IF condition: (c = 0 ) 
  #label: 13
  ld    t0,-64(s0)
  sd    t0,-16(s0)
  li    t0,0
  ld    t1,-16(s0)
  sub   t1,t1,t0
  seqz  t0,t1
#go to .L16 if condition not met
  beqz  t0,.L16
#Things to do when IF condition: (c = 0 )  is met
  #d := 2 
  #label: 14
  li    t0,2
  sd    t0,-72(s0)
#IF condition: (q = 0 ) 
  #label: 15
  ld    t0,-40(s0)
  sd    t0,-16(s0)
  li    t0,0
  ld    t1,-16(s0)
  sub   t1,t1,t0
  seqz  t0,t1
#go to .L18 if condition not met
  beqz  t0,.L18
#Things to do when IF condition: (q = 0 )  is met
  #label: 16
nop
  j     .L19
#Things to do when IF condition: (q = 0 )  is Not met
.L18:
  #label: 17
nop
#code after if (q = 0 ) 
.L19:
  j     .L17
#Things to do when IF condition: (c = 0 )  is Not met
.L16:
  #d := 3 
  #label: 18
  li    t0,3
  sd    t0,-72(s0)
#IF condition: (p = 0 ) 
  #label: 19
  ld    t0,-32(s0)
  sd    t0,-16(s0)
  li    t0,0
  ld    t1,-16(s0)
  sub   t1,t1,t0
  seqz  t0,t1
#go to .L20 if condition not met
  beqz  t0,.L20
#Things to do when IF condition: (p = 0 )  is met
  #label: 20
nop
  j     .L21
#Things to do when IF condition: (p = 0 )  is Not met
.L20:
  #label: 21
nop
#code after if (p = 0 ) 
.L21:
#code after if (c = 0 ) 
.L17:
#while condition: (loop3 Gre 0 ) 
  #label: 12
.L14:
  ld    t0,-96(s0)
  sd    t0,-16(s0)
  li    t0,0
  ld    t1,-16(s0)
  sub   t1,t1,t0
  sgtz  t0,t1
  bnez  t0,.L15
#code for while condition (loop3 Gre 0 )  not met: 
#code after if (a = 0 ) 
.L3:
nop
nop
nop
  ld    a0,-128(s0)
  ld    t0,-48(s0)
  sd    t0,0(a0)
  ld    t0,-56(s0)
  sd    t0,8(a0)
  ld    t0,-64(s0)
  sd    t0,16(a0)
  ld    t0,-72(s0)
  sd    t0,24(a0)
  ld    t0,-80(s0)
  sd    t0,32(a0)
  ld    t0,-112(s0)
  sd    t0,40(a0)
  ld    t0,-104(s0)
  sd    t0,48(a0)
  ld    t0,-88(s0)
  sd    t0,56(a0)
  ld    t0,-96(s0)
  sd    t0,64(a0)
  ld    t0,-32(s0)
  sd    t0,72(a0)
  ld    t0,-40(s0)
  sd    t0,80(a0)
nop
  ld    s0,168(sp)
  addi  sp,sp,176
jr  ra
    .size   cfgTest2, .-cfgTest2
    .ident "GCC: (GNU) 9.0.1 20190123 (Red Hat 9.0.1-0.1)"
    .section        .note.GNU-stack,"",@progbits

