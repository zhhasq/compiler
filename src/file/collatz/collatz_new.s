    .file   "collatz.c"
    .option nopic
    .text
    .align 1
    .global collatz
    .type collatz, @function
collatz:

  addi  sp,sp,-136
  sd    s3,128(sp)
  sd    s4,120(sp)
  sd    s0,112(sp)
  sd    s1,104(sp)
  sd    s2,96(sp)
  addi  s0,sp,136
  sd    a0,-120(s0)
  ld    a0,-120(s0)
  ld    t0,0(a0)
  sd    t0,-72(s0)
  ld    t0,8(a0)
  sd    t0,-104(s0)
  ld    t0,16(a0)
  sd    t0,-64(s0)
  ld    t0,24(a0)
  sd    t0,-88(s0)
  ld    t0,32(a0)
  sd    t0,-80(s0)
  ld    t0,40(a0)
  sd    t0,-96(s0)
  ld    s1,-72(s0)
  ld    s2,-88(s0)
  ld    s3,-96(s0)
  ld    s4,-80(s0)
nop
nop
nop
  #n := input 
  #label: 0
  mv  t0,s1
  mv  s1,t0
  #steps := 0 
  #label: 1
  li    t0,0
  mv  s3,t0
  j     .L2
#code for while condition (n Gre 1 )  met: 
.L3:
  #rem := n 
  #label: 3
  mv  t0,s1
  mv  s4,t0
  #quot := 0 
  #label: 4
  li    t0,0
  mv  s2,t0
  j     .L4
#code for while condition (rem Gre 1 )  met: 
.L5:
  #rem := (rem - 2 ) 
  #label: 6
  mv  t0,s4
  sd    t0,-48(s0)
  li    t0,2
  ld    t1,-48(s0)
  sub   t0,t1,t0
  mv  s4,t0
  #quot := (quot + 1 ) 
  #label: 7
  mv  t0,s2
  sd    t0,-48(s0)
  li    t0,1
  ld    t1,-48(s0)
  add   t0,t0,t1
  mv  s2,t0
#while condition: (rem Gre 1 ) 
  #label: 5
.L4:
  mv  t0,s4
  sd    t0,-48(s0)
  li    t0,1
  ld    t1,-48(s0)
  sub   t1,t1,t0
  sgtz  t0,t1
  bnez  t0,.L5
#code for while condition (rem Gre 1 )  not met: 
#IF condition: (rem = 0 ) 
  #label: 8
  mv  t0,s4
  sd    t0,-48(s0)
  li    t0,0
  ld    t1,-48(s0)
  sub   t1,t1,t0
  seqz  t0,t1
#go to .L6 if condition not met
  beqz  t0,.L6
#Things to do when IF condition: (rem = 0 )  is met
  #n := quot 
  #label: 9
  mv  t0,s2
  mv  s1,t0
  j     .L7
#Things to do when IF condition: (rem = 0 )  is Not met
.L6:
  #n := ((3 * n ) + 1 ) 
  #label: 10
  li    t0,3
  sd    t0,-48(s0)
  mv  t0,s1
  ld    t1,-48(s0)
  mul   t0,t0,t1
  sd    t0,-48(s0)
  li    t0,1
  ld    t1,-48(s0)
  add   t0,t0,t1
  mv  s1,t0
#code after if (rem = 0 ) 
.L7:
  #steps := (steps + 1 ) 
  #label: 11
  mv  t0,s3
  sd    t0,-48(s0)
  li    t0,1
  ld    t1,-48(s0)
  add   t0,t0,t1
  mv  s3,t0
#while condition: (n Gre 1 ) 
  #label: 2
.L2:
  mv  t0,s1
  sd    t0,-48(s0)
  li    t0,1
  ld    t1,-48(s0)
  sub   t1,t1,t0
  sgtz  t0,t1
  bnez  t0,.L3
#code for while condition (n Gre 1 )  not met: 
  #output := steps 
  #label: 12
  mv  t0,s3
  mv  s1,t0
nop
nop
nop
  sd    s1,-64(s0)
  sd    s2,-88(s0)
  sd    s3,-96(s0)
  sd    s4,-80(s0)
  ld    a0,-120(s0)
  ld    t0,-72(s0)
  sd    t0,0(a0)
  ld    t0,-104(s0)
  sd    t0,8(a0)
  ld    t0,-64(s0)
  sd    t0,16(a0)
  ld    t0,-88(s0)
  sd    t0,24(a0)
  ld    t0,-80(s0)
  sd    t0,32(a0)
  ld    t0,-96(s0)
  sd    t0,40(a0)
nop
  ld    s3,128(sp)
  ld    s4,120(sp)
  ld    s0,112(sp)
  ld    s1,104(sp)
  ld    s2,96(sp)
  addi  sp,sp,136
jr  ra
    .size   collatz, .-collatz
    .ident "GCC: (GNU) 9.0.1 20190123 (Red Hat 9.0.1-0.1)"
    .section        .note.GNU-stack,"",@progbits

