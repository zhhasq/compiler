    .file   "sort.c"
    .option nopic
    .text
    .align 1
    .global sort
    .type sort, @function
sort:

  addi  sp,sp,-120
  sd    s0,112(sp)
  addi  s0,sp,120
  sd    a0,-72(s0)
  ld    a0,-72(s0)
  ld    t0,0(a0)
  sd    t0,-56(s0)
  ld    t0,8(a0)
  sd    t0,-48(s0)
  ld    t0,16(a0)
  sd    t0,-40(s0)
  ld    t0,24(a0)
  sd    t0,-32(s0)
nop
nop
nop
#IF condition: (input1 Gre= input2 ) 
  ld    t0,-56(s0)
  sd    t0,-16(s0)
  ld    t0,-48(s0)
  ld    t1,-16(s0)
  sub   t1,t0,t1
  sgtz  t0,t1
  xori  t0,t0,1
#go to .L2 if condition not met
  beqz  t0,.L2
#Things to do when IF condition: (input1 Gre= input2 )  is met
#IF condition: (input2 Gre= input3 ) 
  ld    t0,-48(s0)
  sd    t0,-16(s0)
  ld    t0,-40(s0)
  ld    t1,-16(s0)
  sub   t1,t0,t1
  sgtz  t0,t1
  xori  t0,t0,1
#go to .L4 if condition not met
  beqz  t0,.L4
#Things to do when IF condition: (input2 Gre= input3 )  is met
  #tmp := input3 
  ld    t0,-40(s0)
  sd    t0,-32(s0)
  #input3 := input1 
  ld    t0,-56(s0)
  sd    t0,-40(s0)
  #input1 := tmp 
  ld    t0,-32(s0)
  sd    t0,-56(s0)
  j     .L5
#Things to do when IF condition: (input2 Gre= input3 )  is Not met
.L4:
  #tmp := input2 
  ld    t0,-48(s0)
  sd    t0,-32(s0)
  #input2 := input1 
  ld    t0,-56(s0)
  sd    t0,-48(s0)
  #input1 := tmp 
  ld    t0,-32(s0)
  sd    t0,-56(s0)
#code after if (input2 Gre= input3 ) 
.L5:
  j     .L3
#Things to do when IF condition: (input1 Gre= input2 )  is Not met
.L2:
#IF condition: (input1 Less input3 ) 
  ld    t0,-56(s0)
  sd    t0,-16(s0)
  ld    t0,-40(s0)
  ld    t1,-16(s0)
  sub   t1,t0,t1
  sgtz  t0,t1
#go to .L6 if condition not met
  beqz  t0,.L6
#Things to do when IF condition: (input1 Less input3 )  is met
  #tmp := input1 
  ld    t0,-56(s0)
  sd    t0,-32(s0)
  j     .L7
#Things to do when IF condition: (input1 Less input3 )  is Not met
.L6:
  #tmp := input3 
  ld    t0,-40(s0)
  sd    t0,-32(s0)
  #input3 := input1 
  ld    t0,-56(s0)
  sd    t0,-40(s0)
  #input1 := tmp 
  ld    t0,-32(s0)
  sd    t0,-56(s0)
#code after if (input1 Less input3 ) 
.L7:
#code after if (input1 Gre= input2 ) 
.L3:
#IF condition: (input2 Gre= input3 ) 
  ld    t0,-48(s0)
  sd    t0,-16(s0)
  ld    t0,-40(s0)
  ld    t1,-16(s0)
  sub   t1,t0,t1
  sgtz  t0,t1
  xori  t0,t0,1
#go to .L8 if condition not met
  beqz  t0,.L8
#Things to do when IF condition: (input2 Gre= input3 )  is met
  #tmp := input3 
  ld    t0,-40(s0)
  sd    t0,-32(s0)
  #input3 := input2 
  ld    t0,-48(s0)
  sd    t0,-40(s0)
  #input2 := tmp 
  ld    t0,-32(s0)
  sd    t0,-48(s0)
  j     .L9
#Things to do when IF condition: (input2 Gre= input3 )  is Not met
.L8:
  #tmp := input2 
  ld    t0,-48(s0)
  sd    t0,-32(s0)
#code after if (input2 Gre= input3 ) 
.L9:
nop
nop
nop
  ld    a0,-72(s0)
  ld    t0,-56(s0)
  sd    t0,0(a0)
  ld    t0,-48(s0)
  sd    t0,8(a0)
  ld    t0,-40(s0)
  sd    t0,16(a0)
  ld    t0,-32(s0)
  sd    t0,24(a0)
nop
  ld    s0,112(sp)
  addi  sp,sp,120
jr  ra
    .size   sort, .-sort
    .ident "GCC: (GNU) 9.0.1 20190123 (Red Hat 9.0.1-0.1)"
    .section        .note.GNU-stack,"",@progbits

