    .file   "sort.c"
    .option nopic
    .text
    .align 1
    .global sort
    .type sort, @function
sort:

  addi  sp,sp,-120
  sd    s3,112(sp)
  sd    s4,104(sp)
  sd    s0,96(sp)
  sd    s1,88(sp)
  sd    s2,80(sp)
  addi  s0,sp,120
  sd    a0,-104(s0)
  ld    a0,-104(s0)
  ld    t0,0(a0)
  sd    t0,-88(s0)
  ld    t0,8(a0)
  sd    t0,-80(s0)
  ld    t0,16(a0)
  sd    t0,-72(s0)
  ld    t0,24(a0)
  sd    t0,-64(s0)
  ld    s1,-72(s0)
  ld    s2,-88(s0)
  ld    s3,-80(s0)
  ld    s4,-64(s0)
nop
nop
nop
#IF condition: (input1 Gre= input2 ) 
  #label: 0
  mv  t0,s2
  sd    t0,-48(s0)
  mv  t0,s3
  ld    t1,-48(s0)
  sub   t1,t0,t1
  sgtz  t0,t1
  xori  t0,t0,1
#go to .L2 if condition not met
  beqz  t0,.L2
#Things to do when IF condition: (input1 Gre= input2 )  is met
#IF condition: (input2 Gre= input3 ) 
  #label: 1
  mv  t0,s3
  sd    t0,-48(s0)
  mv  t0,s1
  ld    t1,-48(s0)
  sub   t1,t0,t1
  sgtz  t0,t1
  xori  t0,t0,1
#go to .L4 if condition not met
  beqz  t0,.L4
#Things to do when IF condition: (input2 Gre= input3 )  is met
  #tmp := input3 
  #label: 2
  mv  t0,s1
  mv  s4,t0
  #input3 := input1 
  #label: 3
  mv  t0,s2
  mv  s1,t0
  #input1 := tmp 
  #label: 4
  mv  t0,s4
  mv  s2,t0
  j     .L5
#Things to do when IF condition: (input2 Gre= input3 )  is Not met
.L4:
  #tmp := input2 
  #label: 5
  mv  t0,s3
  mv  s4,t0
  #input2 := input1 
  #label: 6
  mv  t0,s2
  mv  s3,t0
  #input1 := tmp 
  #label: 7
  mv  t0,s4
  mv  s2,t0
#code after if (input2 Gre= input3 ) 
.L5:
  j     .L3
#Things to do when IF condition: (input1 Gre= input2 )  is Not met
.L2:
#IF condition: (input1 Less input3 ) 
  #label: 8
  mv  t0,s2
  sd    t0,-48(s0)
  mv  t0,s1
  ld    t1,-48(s0)
  sub   t1,t0,t1
  sgtz  t0,t1
#go to .L6 if condition not met
  beqz  t0,.L6
#Things to do when IF condition: (input1 Less input3 )  is met
  #label: 9
nop
  j     .L7
#Things to do when IF condition: (input1 Less input3 )  is Not met
.L6:
  #tmp := input3 
  #label: 10
  mv  t0,s1
  mv  s4,t0
  #input3 := input1 
  #label: 11
  mv  t0,s2
  mv  s1,t0
  #input1 := tmp 
  #label: 12
  mv  t0,s4
  mv  s2,t0
#code after if (input1 Less input3 ) 
.L7:
#code after if (input1 Gre= input2 ) 
.L3:
#IF condition: (input2 Gre= input3 ) 
  #label: 13
  mv  t0,s3
  sd    t0,-48(s0)
  mv  t0,s1
  ld    t1,-48(s0)
  sub   t1,t0,t1
  sgtz  t0,t1
  xori  t0,t0,1
#go to .L8 if condition not met
  beqz  t0,.L8
#Things to do when IF condition: (input2 Gre= input3 )  is met
  #tmp := input3 
  #label: 14
  mv  t0,s1
  mv  s4,t0
  #input3 := input2 
  #label: 15
  mv  t0,s3
  mv  s1,t0
  #input2 := tmp 
  #label: 16
  mv  t0,s4
  mv  s3,t0
  j     .L9
#Things to do when IF condition: (input2 Gre= input3 )  is Not met
.L8:
  #label: 17
nop
#code after if (input2 Gre= input3 ) 
.L9:
nop
nop
nop
  sd    s1,-72(s0)
  sd    s3,-80(s0)
  sd    s2,-88(s0)
  sd    s1,-72(s0)
  sd    s2,-88(s0)
  sd    s3,-80(s0)
  sd    s4,-64(s0)
  ld    a0,-104(s0)
  ld    t0,-88(s0)
  sd    t0,0(a0)
  ld    t0,-80(s0)
  sd    t0,8(a0)
  ld    t0,-72(s0)
  sd    t0,16(a0)
  ld    t0,-64(s0)
  sd    t0,24(a0)
nop
  ld    s3,112(sp)
  ld    s4,104(sp)
  ld    s0,96(sp)
  ld    s1,88(sp)
  ld    s2,80(sp)
  addi  sp,sp,120
jr  ra
    .size   sort, .-sort
    .ident "GCC: (GNU) 9.0.1 20190123 (Red Hat 9.0.1-0.1)"
    .section        .note.GNU-stack,"",@progbits

