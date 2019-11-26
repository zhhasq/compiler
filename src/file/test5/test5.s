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
  ld    t0,24(a0)
  sd    t0,-88(s0)
  ld    t0,32(a0)
  sd    t0,-80(s0)
nop
nop
nop
  j     .L2
#code for while condition (0 Less= a )  met: 
.L3:
  #b := (b + (2 + ((a + ((a * 2 ) - c ) ) * a ) ) ) 
  #label: 1
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
  #d := b 
  #label: 2
  ld    t0,-64(s0)
  sd    t0,-80(s0)
  j     .L4
#code for while condition (false or (((Not(true ) ) or ((b Gre a ) And (c Less= a ) ) ) or ((a * 100 ) Gre= c ) ) )  met: 
.L5:
  #c := (c + 1 ) 
  #label: 4
  ld    t0,-72(s0)
  sd    t0,-16(s0)
  li    t0,1
  ld    t1,-16(s0)
  add   t0,t0,t1
  sd    t0,-72(s0)
  #d := (d + 1 ) 
  #label: 5
  ld    t0,-80(s0)
  sd    t0,-16(s0)
  li    t0,1
  ld    t1,-16(s0)
  add   t0,t0,t1
  sd    t0,-80(s0)
  j     .L6
#code for while condition (d Gre 0 )  met: 
.L7:
  #c := (c * 2 ) 
  #label: 7
  ld    t0,-72(s0)
  sd    t0,-16(s0)
  li    t0,2
  ld    t1,-16(s0)
  mul   t0,t0,t1
  sd    t0,-72(s0)
  #d := (d - 500 ) 
  #label: 8
  ld    t0,-80(s0)
  sd    t0,-16(s0)
  li    t0,500
  ld    t1,-16(s0)
  sub   t0,t1,t0
  sd    t0,-80(s0)
#IF condition: (a Gre b ) 
  #label: 9
  ld    t0,-56(s0)
  sd    t0,-16(s0)
  ld    t0,-64(s0)
  ld    t1,-16(s0)
  sub   t1,t1,t0
  sgtz  t0,t1
#go to .L8 if condition not met
  beqz  t0,.L8
#Things to do when IF condition: (a Gre b )  is met
#IF condition: (c Less a ) 
  #label: 10
  ld    t0,-72(s0)
  sd    t0,-16(s0)
  ld    t0,-56(s0)
  ld    t1,-16(s0)
  sub   t1,t0,t1
  sgtz  t0,t1
#go to .L10 if condition not met
  beqz  t0,.L10
#Things to do when IF condition: (c Less a )  is met
#IF condition: (b Gre= a ) 
  #label: 11
  ld    t0,-64(s0)
  sd    t0,-16(s0)
  ld    t0,-56(s0)
  ld    t1,-16(s0)
  sub   t1,t0,t1
  sgtz  t0,t1
  xori  t0,t0,1
#go to .L12 if condition not met
  beqz  t0,.L12
#Things to do when IF condition: (b Gre= a )  is met
  #c := (2 * a ) 
  #label: 12
  li    t0,2
  sd    t0,-16(s0)
  ld    t0,-56(s0)
  ld    t1,-16(s0)
  mul   t0,t0,t1
  sd    t0,-72(s0)
  j     .L13
#Things to do when IF condition: (b Gre= a )  is Not met
.L12:
  #c := (2 * b ) 
  #label: 13
  li    t0,2
  sd    t0,-16(s0)
  ld    t0,-64(s0)
  ld    t1,-16(s0)
  mul   t0,t0,t1
  sd    t0,-72(s0)
#code after if (b Gre= a ) 
.L13:
  j     .L11
#Things to do when IF condition: (c Less a )  is Not met
.L10:
  #d := 30 
  #label: 14
  li    t0,30
  sd    t0,-80(s0)
#IF condition: (d Gre 10 ) 
  #label: 15
  ld    t0,-80(s0)
  sd    t0,-16(s0)
  li    t0,10
  ld    t1,-16(s0)
  sub   t1,t1,t0
  sgtz  t0,t1
#go to .L14 if condition not met
  beqz  t0,.L14
#Things to do when IF condition: (d Gre 10 )  is met
  #a := ((a + b ) + c ) 
  #label: 16
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
#Things to do when IF condition: (d Gre 10 )  is Not met
.L14:
  #a := ((a - b ) - c ) 
  #label: 17
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
#code after if (d Gre 10 ) 
.L15:
#code after if (c Less a ) 
.L11:
  j     .L9
#Things to do when IF condition: (a Gre b )  is Not met
.L8:
#IF condition: (c = a ) 
  #label: 18
  ld    t0,-72(s0)
  sd    t0,-16(s0)
  ld    t0,-56(s0)
  ld    t1,-16(s0)
  sub   t1,t1,t0
  seqz  t0,t1
#go to .L16 if condition not met
  beqz  t0,.L16
#Things to do when IF condition: (c = a )  is met
  #c := (a + b ) 
  #label: 19
  ld    t0,-56(s0)
  sd    t0,-16(s0)
  ld    t0,-64(s0)
  ld    t1,-16(s0)
  add   t0,t0,t1
  sd    t0,-72(s0)
  j     .L17
#Things to do when IF condition: (c = a )  is Not met
.L16:
#IF condition: (b Gre= a ) 
  #label: 20
  ld    t0,-64(s0)
  sd    t0,-16(s0)
  ld    t0,-56(s0)
  ld    t1,-16(s0)
  sub   t1,t0,t1
  sgtz  t0,t1
  xori  t0,t0,1
#go to .L18 if condition not met
  beqz  t0,.L18
#Things to do when IF condition: (b Gre= a )  is met
  #c := (a + (2 * b ) ) 
  #label: 21
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
#Things to do when IF condition: (b Gre= a )  is Not met
.L18:
  #c := (a - (2 * b ) ) 
  #label: 22
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
#code after if (b Gre= a ) 
.L19:
#code after if (c = a ) 
.L17:
#code after if (a Gre b ) 
.L9:
  #count := 2 
  #label: 23
  li    t0,2
  sd    t0,-88(s0)
  j     .L20
#code for while condition (count Gre= 0 )  met: 
.L21:
  #a := (a + 2 ) 
  #label: 25
  ld    t0,-56(s0)
  sd    t0,-16(s0)
  li    t0,2
  ld    t1,-16(s0)
  add   t0,t0,t1
  sd    t0,-56(s0)
  #count := (count - 1 ) 
  #label: 26
  ld    t0,-88(s0)
  sd    t0,-16(s0)
  li    t0,1
  ld    t1,-16(s0)
  sub   t0,t1,t0
  sd    t0,-88(s0)
#while condition: (count Gre= 0 ) 
  #label: 24
.L20:
  ld    t0,-88(s0)
  sd    t0,-16(s0)
  li    t0,0
  ld    t1,-16(s0)
  sub   t1,t0,t1
  sgtz  t0,t1
  xori  t0,t0,1
  bnez  t0,.L21
#code for while condition (count Gre= 0 )  not met: 
#while condition: (d Gre 0 ) 
  #label: 6
.L6:
  ld    t0,-80(s0)
  sd    t0,-16(s0)
  li    t0,0
  ld    t1,-16(s0)
  sub   t1,t1,t0
  sgtz  t0,t1
  bnez  t0,.L7
#code for while condition (d Gre 0 )  not met: 
#while condition: (false or (((Not(true ) ) or ((b Gre a ) And (c Less= a ) ) ) or ((a * 100 ) Gre= c ) ) ) 
  #label: 3
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
  snez  t0,t0
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
  snez  t0,t0
  ld    t1,-16(s0)
  add   t0,t0,t1
  snez  t0,t0
  bnez  t0,.L5
#code for while condition (false or (((Not(true ) ) or ((b Gre a ) And (c Less= a ) ) ) or ((a * 100 ) Gre= c ) ) )  not met: 
  #a := (a - 1 ) 
  #label: 27
  ld    t0,-56(s0)
  sd    t0,-16(s0)
  li    t0,1
  ld    t1,-16(s0)
  sub   t0,t1,t0
  sd    t0,-56(s0)
#while condition: (0 Less= a ) 
  #label: 0
.L2:
  li    t0,0
  sd    t0,-16(s0)
  ld    t0,-56(s0)
  ld    t1,-16(s0)
  sub   t1,t1,t0
  sgtz  t0,t1
  xori  t0,t0,1
  bnez  t0,.L3
#code for while condition (0 Less= a )  not met: 
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
  ld    t0,-88(s0)
  sd    t0,24(a0)
  ld    t0,-80(s0)
  sd    t0,32(a0)
nop
  ld    s0,144(sp)
  addi  sp,sp,152
jr  ra
    .size   test5, .-test5
    .ident "GCC: (GNU) 9.0.1 20190123 (Red Hat 9.0.1-0.1)"
    .section        .note.GNU-stack,"",@progbits

