    .file   "prime.c"
    .option nopic
    .text
    .align 1
    .global prime
    .type prime, @function
prime:

  addi  sp,sp,-128
  sd    s0,120(sp)
  addi  s0,sp,128
  sd    a0,-80(s0)
  ld    a0,-80(s0)
  ld    t0,0(a0)
  sd    t0,-40(s0)
  ld    t0,8(a0)
  sd    t0,-56(s0)
  ld    t0,16(a0)
  sd    t0,-64(s0)
  ld    t0,24(a0)
  sd    t0,-48(s0)
  ld    t0,32(a0)
  sd    t0,-32(s0)
nop
nop
nop
  #result := 0 
  #label: 0
  li    t0,0
  sd    t0,-32(s0)
  j     .L2
#code for while condition (range Gre= 2 )  met: 
.L3:
  #count := 0 
  #label: 2
  li    t0,0
  sd    t0,-40(s0)
  #i := 2 
  #label: 3
  li    t0,2
  sd    t0,-56(s0)
  j     .L4
#code for while condition ((i * i ) Less= range )  met: 
.L5:
  #k := range 
  #label: 5
  ld    t0,-48(s0)
  sd    t0,-64(s0)
#IF condition: (count Gre 0 ) 
  #label: 6
  ld    t0,-40(s0)
  sd    t0,-16(s0)
  li    t0,0
  ld    t1,-16(s0)
  sub   t1,t1,t0
  sgtz  t0,t1
#go to .L6 if condition not met
  beqz  t0,.L6
#Things to do when IF condition: (count Gre 0 )  is met
  #label: 7
nop
  j     .L7
#Things to do when IF condition: (count Gre 0 )  is Not met
.L6:
  j     .L8
#code for while condition (k Gre= 1 )  met: 
.L9:
#IF condition: ((k * i ) = range ) 
  #label: 9
  ld    t0,-64(s0)
  sd    t0,-16(s0)
  ld    t0,-56(s0)
  ld    t1,-16(s0)
  mul   t0,t0,t1
  sd    t0,-16(s0)
  ld    t0,-48(s0)
  ld    t1,-16(s0)
  sub   t1,t1,t0
  seqz  t0,t1
#go to .L10 if condition not met
  beqz  t0,.L10
#Things to do when IF condition: ((k * i ) = range )  is met
  #count := (count + 1 ) 
  #label: 10
  ld    t0,-40(s0)
  sd    t0,-16(s0)
  li    t0,1
  ld    t1,-16(s0)
  add   t0,t0,t1
  sd    t0,-40(s0)
  j     .L11
#Things to do when IF condition: ((k * i ) = range )  is Not met
.L10:
  #label: 11
nop
#code after if ((k * i ) = range ) 
.L11:
  #k := (k - 1 ) 
  #label: 12
  ld    t0,-64(s0)
  sd    t0,-16(s0)
  li    t0,1
  ld    t1,-16(s0)
  sub   t0,t1,t0
  sd    t0,-64(s0)
#while condition: (k Gre= 1 ) 
  #label: 8
.L8:
  ld    t0,-64(s0)
  sd    t0,-16(s0)
  li    t0,1
  ld    t1,-16(s0)
  sub   t1,t0,t1
  sgtz  t0,t1
  xori  t0,t0,1
  bnez  t0,.L9
#code for while condition (k Gre= 1 )  not met: 
#code after if (count Gre 0 ) 
.L7:
  #i := (i + 1 ) 
  #label: 13
  ld    t0,-56(s0)
  sd    t0,-16(s0)
  li    t0,1
  ld    t1,-16(s0)
  add   t0,t0,t1
  sd    t0,-56(s0)
#while condition: ((i * i ) Less= range ) 
  #label: 4
.L4:
  ld    t0,-56(s0)
  sd    t0,-16(s0)
  ld    t0,-56(s0)
  ld    t1,-16(s0)
  mul   t0,t0,t1
  sd    t0,-16(s0)
  ld    t0,-48(s0)
  ld    t1,-16(s0)
  sub   t1,t1,t0
  sgtz  t0,t1
  xori  t0,t0,1
  bnez  t0,.L5
#code for while condition ((i * i ) Less= range )  not met: 
#IF condition: (count Gre 0 ) 
  #label: 14
  ld    t0,-40(s0)
  sd    t0,-16(s0)
  li    t0,0
  ld    t1,-16(s0)
  sub   t1,t1,t0
  sgtz  t0,t1
#go to .L12 if condition not met
  beqz  t0,.L12
#Things to do when IF condition: (count Gre 0 )  is met
  #label: 15
nop
  j     .L13
#Things to do when IF condition: (count Gre 0 )  is Not met
.L12:
  #result := (1 + result ) 
  #label: 16
  li    t0,1
  sd    t0,-16(s0)
  ld    t0,-32(s0)
  ld    t1,-16(s0)
  add   t0,t0,t1
  sd    t0,-32(s0)
#code after if (count Gre 0 ) 
.L13:
  #range := (range - 1 ) 
  #label: 17
  ld    t0,-48(s0)
  sd    t0,-16(s0)
  li    t0,1
  ld    t1,-16(s0)
  sub   t0,t1,t0
  sd    t0,-48(s0)
#while condition: (range Gre= 2 ) 
  #label: 1
.L2:
  ld    t0,-48(s0)
  sd    t0,-16(s0)
  li    t0,2
  ld    t1,-16(s0)
  sub   t1,t0,t1
  sgtz  t0,t1
  xori  t0,t0,1
  bnez  t0,.L3
#code for while condition (range Gre= 2 )  not met: 
nop
nop
nop
  ld    a0,-80(s0)
  ld    t0,-40(s0)
  sd    t0,0(a0)
  ld    t0,-56(s0)
  sd    t0,8(a0)
  ld    t0,-64(s0)
  sd    t0,16(a0)
  ld    t0,-48(s0)
  sd    t0,24(a0)
  ld    t0,-32(s0)
  sd    t0,32(a0)
nop
  ld    s0,120(sp)
  addi  sp,sp,128
jr  ra
    .size   prime, .-prime
    .ident "GCC: (GNU) 9.0.1 20190123 (Red Hat 9.0.1-0.1)"
    .section        .note.GNU-stack,"",@progbits

