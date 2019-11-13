    .file   "nosense.c"
    .option nopic
    .text
    .align 1
    .global nosense
    .type nosense, @function
nosense:

  addi  sp,sp,-216
  sd    s0,208(sp)
  addi  s0,sp,216
  sd    a0,-168(s0)
  ld    a0,-168(s0)
  ld    t0,0(a0)
  sd    t0,-72(s0)
  ld    t0,8(a0)
  sd    t0,-88(s0)
  ld    t0,16(a0)
  sd    t0,-96(s0)
  ld    t0,24(a0)
  sd    t0,-64(s0)
  ld    t0,32(a0)
  sd    t0,-80(s0)
  ld    t0,40(a0)
  sd    t0,-120(s0)
  ld    t0,48(a0)
  sd    t0,-136(s0)
  ld    t0,56(a0)
  sd    t0,-112(s0)
  ld    t0,64(a0)
  sd    t0,-104(s0)
  ld    t0,72(a0)
  sd    t0,-144(s0)
  ld    t0,80(a0)
  sd    t0,-152(s0)
  ld    t0,88(a0)
  sd    t0,-128(s0)
nop
nop
nop
  #count1 := 0 
  #label: 0
  li    t0,0
  sd    t0,-64(s0)
  #count2 := 0 
  #label: 1
  li    t0,0
  sd    t0,-80(s0)
  #count3 := 0 
  #label: 2
  li    t0,0
  sd    t0,-120(s0)
  #count4 := 0 
  #label: 3
  li    t0,0
  sd    t0,-136(s0)
  j     .L2
#code for while condition ((((a Gre 0 ) or (b Gre 0 ) ) or (c Gre 0 ) ) or (d Gre 0 ) )  met: 
.L3:
  #count1 := (count1 + 1 ) 
  #label: 5
  ld    t0,-64(s0)
  sd    t0,-16(s0)
  li    t0,1
  ld    t1,-16(s0)
  add   t0,t0,t1
  sd    t0,-64(s0)
  j     .L4
#code for while condition ((Not((((1 * c ) + (2 * a ) ) Less ((1 * d ) + (2 * b ) ) ) ) ) And (true And ((((1 * d ) + (2 * a ) ) Gre= ((1 * c ) + (2 * b ) ) ) And (count2 Less= 1000 ) ) ) )  met: 
.L5:
  #count2 := ((((count2 + (1 * c ) ) + (2 * a ) ) + (1 * d ) ) + (2 * b ) ) 
  #label: 7
  ld    t0,-80(s0)
  sd    t0,-16(s0)
  li    t0,1
  sd    t0,-24(s0)
  ld    t0,-96(s0)
  ld    t1,-24(s0)
  mul   t0,t0,t1
  ld    t1,-16(s0)
  add   t0,t0,t1
  sd    t0,-16(s0)
  li    t0,2
  sd    t0,-24(s0)
  ld    t0,-72(s0)
  ld    t1,-24(s0)
  mul   t0,t0,t1
  ld    t1,-16(s0)
  add   t0,t0,t1
  sd    t0,-16(s0)
  li    t0,1
  sd    t0,-24(s0)
  ld    t0,-112(s0)
  ld    t1,-24(s0)
  mul   t0,t0,t1
  ld    t1,-16(s0)
  add   t0,t0,t1
  sd    t0,-16(s0)
  li    t0,2
  sd    t0,-24(s0)
  ld    t0,-88(s0)
  ld    t1,-24(s0)
  mul   t0,t0,t1
  ld    t1,-16(s0)
  add   t0,t0,t1
  sd    t0,-80(s0)
#IF condition: ((((6 + a ) + (b * (d - ((b + (c * a ) ) - d ) ) ) ) - d ) Gre 0 ) 
  #label: 8
  li    t0,6
  sd    t0,-16(s0)
  ld    t0,-72(s0)
  ld    t1,-16(s0)
  add   t0,t0,t1
  sd    t0,-16(s0)
  ld    t0,-88(s0)
  sd    t0,-24(s0)
  ld    t0,-112(s0)
  sd    t0,-32(s0)
  ld    t0,-88(s0)
  sd    t0,-40(s0)
  ld    t0,-96(s0)
  sd    t0,-48(s0)
  ld    t0,-72(s0)
  ld    t1,-48(s0)
  mul   t0,t0,t1
  ld    t1,-40(s0)
  add   t0,t0,t1
  sd    t0,-40(s0)
  ld    t0,-112(s0)
  ld    t1,-40(s0)
  sub   t0,t1,t0
  ld    t1,-32(s0)
  sub   t0,t1,t0
  ld    t1,-24(s0)
  mul   t0,t0,t1
  ld    t1,-16(s0)
  add   t0,t0,t1
  sd    t0,-16(s0)
  ld    t0,-112(s0)
  ld    t1,-16(s0)
  sub   t0,t1,t0
  sd    t0,-16(s0)
  li    t0,0
  ld    t1,-16(s0)
  sub   t1,t1,t0
  sgtz  t0,t1
#go to .L6 if condition not met
  beqz  t0,.L6
#Things to do when IF condition: ((((6 + a ) + (b * (d - ((b + (c * a ) ) - d ) ) ) ) - d ) Gre 0 )  is met
  #count4 := (count4 + 1 ) 
  #label: 9
  ld    t0,-136(s0)
  sd    t0,-16(s0)
  li    t0,1
  ld    t1,-16(s0)
  add   t0,t0,t1
  sd    t0,-136(s0)
  j     .L7
#Things to do when IF condition: ((((6 + a ) + (b * (d - ((b + (c * a ) ) - d ) ) ) ) - d ) Gre 0 )  is Not met
.L6:
  #label: 10
nop
#code after if ((((6 + a ) + (b * (d - ((b + (c * a ) ) - d ) ) ) ) - d ) Gre 0 ) 
.L7:
#while condition: ((Not((((1 * c ) + (2 * a ) ) Less ((1 * d ) + (2 * b ) ) ) ) ) And (true And ((((1 * d ) + (2 * a ) ) Gre= ((1 * c ) + (2 * b ) ) ) And (count2 Less= 1000 ) ) ) ) 
  #label: 6
.L4:
  li    t0,1
  sd    t0,-16(s0)
  ld    t0,-96(s0)
  ld    t1,-16(s0)
  mul   t0,t0,t1
  sd    t0,-16(s0)
  li    t0,2
  sd    t0,-24(s0)
  ld    t0,-72(s0)
  ld    t1,-24(s0)
  mul   t0,t0,t1
  ld    t1,-16(s0)
  add   t0,t0,t1
  sd    t0,-16(s0)
  li    t0,1
  sd    t0,-24(s0)
  ld    t0,-112(s0)
  ld    t1,-24(s0)
  mul   t0,t0,t1
  sd    t0,-24(s0)
  li    t0,2
  sd    t0,-32(s0)
  ld    t0,-88(s0)
  ld    t1,-32(s0)
  mul   t0,t0,t1
  ld    t1,-24(s0)
  add   t0,t0,t1
  ld    t1,-16(s0)
  sub   t1,t0,t1
  sgtz  t0,t1
  sd    t0,-16(s0)
  ld    t1,-16(s0)
  xori  t0,t1,1
  sd    t0,-16(s0)
  li    t0,1
  sd    t0,-24(s0)
  li    t0,1
  sd    t0,-32(s0)
  ld    t0,-112(s0)
  ld    t1,-32(s0)
  mul   t0,t0,t1
  sd    t0,-32(s0)
  li    t0,2
  sd    t0,-40(s0)
  ld    t0,-72(s0)
  ld    t1,-40(s0)
  mul   t0,t0,t1
  ld    t1,-32(s0)
  add   t0,t0,t1
  sd    t0,-32(s0)
  li    t0,1
  sd    t0,-40(s0)
  ld    t0,-96(s0)
  ld    t1,-40(s0)
  mul   t0,t0,t1
  sd    t0,-40(s0)
  li    t0,2
  sd    t0,-48(s0)
  ld    t0,-88(s0)
  ld    t1,-48(s0)
  mul   t0,t0,t1
  ld    t1,-40(s0)
  add   t0,t0,t1
  ld    t1,-32(s0)
  sub   t1,t0,t1
  sgtz  t0,t1
  xori  t0,t0,1
  sd    t0,-32(s0)
  ld    t0,-80(s0)
  sd    t0,-40(s0)
  li    t0,1000
  ld    t1,-40(s0)
  sub   t1,t1,t0
  sgtz  t0,t1
  xori  t0,t0,1
  ld    t1,-32(s0)
  mul   t0,t0,t1
  ld    t1,-24(s0)
  mul   t0,t0,t1
  ld    t1,-16(s0)
  mul   t0,t0,t1
  bnez  t0,.L5
#code for while condition ((Not((((1 * c ) + (2 * a ) ) Less ((1 * d ) + (2 * b ) ) ) ) ) And (true And ((((1 * d ) + (2 * a ) ) Gre= ((1 * c ) + (2 * b ) ) ) And (count2 Less= 1000 ) ) ) )  not met: 
  #flag := 0 
  #label: 11
  li    t0,0
  sd    t0,-104(s0)
  #i := 0 
  #label: 12
  li    t0,0
  sd    t0,-144(s0)
  #positive := count2 
  #label: 13
  ld    t0,-80(s0)
  sd    t0,-152(s0)
#IF condition: (count2 Less 0 ) 
  #label: 14
  ld    t0,-80(s0)
  sd    t0,-16(s0)
  li    t0,0
  ld    t1,-16(s0)
  sub   t1,t0,t1
  sgtz  t0,t1
#go to .L8 if condition not met
  beqz  t0,.L8
#Things to do when IF condition: (count2 Less 0 )  is met
  #positive := (0 - count2 ) 
  #label: 15
  li    t0,0
  sd    t0,-16(s0)
  ld    t0,-80(s0)
  ld    t1,-16(s0)
  sub   t0,t1,t0
  sd    t0,-152(s0)
  j     .L9
#Things to do when IF condition: (count2 Less 0 )  is Not met
.L8:
  #label: 16
nop
#code after if (count2 Less 0 ) 
.L9:
  j     .L10
#code for while condition ((flag = 0 ) And (i Less= positive ) )  met: 
.L11:
#IF condition: ((i * 2 ) = positive ) 
  #label: 18
  ld    t0,-144(s0)
  sd    t0,-16(s0)
  li    t0,2
  ld    t1,-16(s0)
  mul   t0,t0,t1
  sd    t0,-16(s0)
  ld    t0,-152(s0)
  ld    t1,-16(s0)
  sub   t1,t1,t0
  seqz  t0,t1
#go to .L12 if condition not met
  beqz  t0,.L12
#Things to do when IF condition: ((i * 2 ) = positive )  is met
  #flag := 1 
  #label: 19
  li    t0,1
  sd    t0,-104(s0)
  j     .L13
#Things to do when IF condition: ((i * 2 ) = positive )  is Not met
.L12:
  #label: 20
nop
#code after if ((i * 2 ) = positive ) 
.L13:
  #i := (i + 1 ) 
  #label: 21
  ld    t0,-144(s0)
  sd    t0,-16(s0)
  li    t0,1
  ld    t1,-16(s0)
  add   t0,t0,t1
  sd    t0,-144(s0)
#while condition: ((flag = 0 ) And (i Less= positive ) ) 
  #label: 17
.L10:
  ld    t0,-104(s0)
  sd    t0,-16(s0)
  li    t0,0
  ld    t1,-16(s0)
  sub   t1,t1,t0
  seqz  t0,t1
  sd    t0,-16(s0)
  ld    t0,-144(s0)
  sd    t0,-24(s0)
  ld    t0,-152(s0)
  ld    t1,-24(s0)
  sub   t1,t1,t0
  sgtz  t0,t1
  xori  t0,t0,1
  ld    t1,-16(s0)
  mul   t0,t0,t1
  bnez  t0,.L11
#code for while condition ((flag = 0 ) And (i Less= positive ) )  not met: 
#IF condition: (flag = 1 ) 
  #label: 22
  ld    t0,-104(s0)
  sd    t0,-16(s0)
  li    t0,1
  ld    t1,-16(s0)
  sub   t1,t1,t0
  seqz  t0,t1
#go to .L14 if condition not met
  beqz  t0,.L14
#Things to do when IF condition: (flag = 1 )  is met
  #tmp := ((((1 * d ) + (2 * c ) ) + (4 * b ) ) + (8 * d ) ) 
  #label: 23
  li    t0,1
  sd    t0,-16(s0)
  ld    t0,-112(s0)
  ld    t1,-16(s0)
  mul   t0,t0,t1
  sd    t0,-16(s0)
  li    t0,2
  sd    t0,-24(s0)
  ld    t0,-96(s0)
  ld    t1,-24(s0)
  mul   t0,t0,t1
  ld    t1,-16(s0)
  add   t0,t0,t1
  sd    t0,-16(s0)
  li    t0,4
  sd    t0,-24(s0)
  ld    t0,-88(s0)
  ld    t1,-24(s0)
  mul   t0,t0,t1
  ld    t1,-16(s0)
  add   t0,t0,t1
  sd    t0,-16(s0)
  li    t0,8
  sd    t0,-24(s0)
  ld    t0,-112(s0)
  ld    t1,-24(s0)
  mul   t0,t0,t1
  ld    t1,-16(s0)
  add   t0,t0,t1
  sd    t0,-128(s0)
  j     .L16
#code for while condition ((tmp Gre 0 ) And (Not((flag = 0 ) ) ) )  met: 
.L17:
  #tmp := (tmp - 1 ) 
  #label: 25
  ld    t0,-128(s0)
  sd    t0,-16(s0)
  li    t0,1
  ld    t1,-16(s0)
  sub   t0,t1,t0
  sd    t0,-128(s0)
  #count3 := (count3 + tmp ) 
  #label: 26
  ld    t0,-120(s0)
  sd    t0,-16(s0)
  ld    t0,-128(s0)
  ld    t1,-16(s0)
  add   t0,t0,t1
  sd    t0,-120(s0)
#IF condition: (Not((((count3 Less= count4 ) or ((count1 Less= count3 ) And true ) ) or (Not(true ) ) ) ) ) 
  #label: 27
  ld    t0,-120(s0)
  sd    t0,-16(s0)
  ld    t0,-136(s0)
  ld    t1,-16(s0)
  sub   t1,t1,t0
  sgtz  t0,t1
  xori  t0,t0,1
  sd    t0,-16(s0)
  ld    t0,-64(s0)
  sd    t0,-24(s0)
  ld    t0,-120(s0)
  ld    t1,-24(s0)
  sub   t1,t1,t0
  sgtz  t0,t1
  xori  t0,t0,1
  sd    t0,-24(s0)
  li    t0,1
  ld    t1,-24(s0)
  mul   t0,t0,t1
  ld    t1,-16(s0)
  add   t0,t0,t1
  snez  t0,t0
  sd    t0,-16(s0)
  li    t0,1
  sd    t0,-24(s0)
  ld    t1,-24(s0)
  xori  t0,t1,1
  ld    t1,-16(s0)
  add   t0,t0,t1
  snez  t0,t0
  sd    t0,-16(s0)
  ld    t1,-16(s0)
  xori  t0,t1,1
#go to .L18 if condition not met
  beqz  t0,.L18
#Things to do when IF condition: (Not((((count3 Less= count4 ) or ((count1 Less= count3 ) And true ) ) or (Not(true ) ) ) ) )  is met
  #count3 := (count3 + count4 ) 
  #label: 28
  ld    t0,-120(s0)
  sd    t0,-16(s0)
  ld    t0,-136(s0)
  ld    t1,-16(s0)
  add   t0,t0,t1
  sd    t0,-120(s0)
  j     .L19
#Things to do when IF condition: (Not((((count3 Less= count4 ) or ((count1 Less= count3 ) And true ) ) or (Not(true ) ) ) ) )  is Not met
.L18:
  #count3 := (count3 - count4 ) 
  #label: 29
  ld    t0,-120(s0)
  sd    t0,-16(s0)
  ld    t0,-136(s0)
  ld    t1,-16(s0)
  sub   t0,t1,t0
  sd    t0,-120(s0)
#code after if (Not((((count3 Less= count4 ) or ((count1 Less= count3 ) And true ) ) or (Not(true ) ) ) ) ) 
.L19:
#while condition: ((tmp Gre 0 ) And (Not((flag = 0 ) ) ) ) 
  #label: 24
.L16:
  ld    t0,-128(s0)
  sd    t0,-16(s0)
  li    t0,0
  ld    t1,-16(s0)
  sub   t1,t1,t0
  sgtz  t0,t1
  sd    t0,-16(s0)
  ld    t0,-104(s0)
  sd    t0,-24(s0)
  li    t0,0
  ld    t1,-24(s0)
  sub   t1,t1,t0
  seqz  t0,t1
  sd    t0,-24(s0)
  ld    t1,-24(s0)
  xori  t0,t1,1
  ld    t1,-16(s0)
  mul   t0,t0,t1
  bnez  t0,.L17
#code for while condition ((tmp Gre 0 ) And (Not((flag = 0 ) ) ) )  not met: 
  j     .L15
#Things to do when IF condition: (flag = 1 )  is Not met
.L14:
  #tmp := ((((1 * d ) + (2 * c ) ) + (4 * b ) ) + (8 * d ) ) 
  #label: 30
  li    t0,1
  sd    t0,-16(s0)
  ld    t0,-112(s0)
  ld    t1,-16(s0)
  mul   t0,t0,t1
  sd    t0,-16(s0)
  li    t0,2
  sd    t0,-24(s0)
  ld    t0,-96(s0)
  ld    t1,-24(s0)
  mul   t0,t0,t1
  ld    t1,-16(s0)
  add   t0,t0,t1
  sd    t0,-16(s0)
  li    t0,4
  sd    t0,-24(s0)
  ld    t0,-88(s0)
  ld    t1,-24(s0)
  mul   t0,t0,t1
  ld    t1,-16(s0)
  add   t0,t0,t1
  sd    t0,-16(s0)
  li    t0,8
  sd    t0,-24(s0)
  ld    t0,-112(s0)
  ld    t1,-24(s0)
  mul   t0,t0,t1
  ld    t1,-16(s0)
  add   t0,t0,t1
  sd    t0,-128(s0)
  j     .L20
#code for while condition ((tmp Gre 0 ) And (Not((flag = 1 ) ) ) )  met: 
.L21:
  #tmp := (tmp - 1 ) 
  #label: 32
  ld    t0,-128(s0)
  sd    t0,-16(s0)
  li    t0,1
  ld    t1,-16(s0)
  sub   t0,t1,t0
  sd    t0,-128(s0)
  #count3 := (count3 + (2 * tmp ) ) 
  #label: 33
  ld    t0,-120(s0)
  sd    t0,-16(s0)
  li    t0,2
  sd    t0,-24(s0)
  ld    t0,-128(s0)
  ld    t1,-24(s0)
  mul   t0,t0,t1
  ld    t1,-16(s0)
  add   t0,t0,t1
  sd    t0,-120(s0)
#while condition: ((tmp Gre 0 ) And (Not((flag = 1 ) ) ) ) 
  #label: 31
.L20:
  ld    t0,-128(s0)
  sd    t0,-16(s0)
  li    t0,0
  ld    t1,-16(s0)
  sub   t1,t1,t0
  sgtz  t0,t1
  sd    t0,-16(s0)
  ld    t0,-104(s0)
  sd    t0,-24(s0)
  li    t0,1
  ld    t1,-24(s0)
  sub   t1,t1,t0
  seqz  t0,t1
  sd    t0,-24(s0)
  ld    t1,-24(s0)
  xori  t0,t1,1
  ld    t1,-16(s0)
  mul   t0,t0,t1
  bnez  t0,.L21
#code for while condition ((tmp Gre 0 ) And (Not((flag = 1 ) ) ) )  not met: 
#code after if (flag = 1 ) 
.L15:
  #count2 := ((count2 - count3 ) - count4 ) 
  #label: 34
  ld    t0,-80(s0)
  sd    t0,-16(s0)
  ld    t0,-120(s0)
  ld    t1,-16(s0)
  sub   t0,t1,t0
  sd    t0,-16(s0)
  ld    t0,-136(s0)
  ld    t1,-16(s0)
  sub   t0,t1,t0
  sd    t0,-80(s0)
#IF condition: ((0 - count2 ) Gre= (2 * count3 ) ) 
  #label: 35
  li    t0,0
  sd    t0,-16(s0)
  ld    t0,-80(s0)
  ld    t1,-16(s0)
  sub   t0,t1,t0
  sd    t0,-16(s0)
  li    t0,2
  sd    t0,-24(s0)
  ld    t0,-120(s0)
  ld    t1,-24(s0)
  mul   t0,t0,t1
  ld    t1,-16(s0)
  sub   t1,t0,t1
  sgtz  t0,t1
  xori  t0,t0,1
#go to .L22 if condition not met
  beqz  t0,.L22
#Things to do when IF condition: ((0 - count2 ) Gre= (2 * count3 ) )  is met
  #count1 := (count1 + (0 - count2 ) ) 
  #label: 36
  ld    t0,-64(s0)
  sd    t0,-16(s0)
  li    t0,0
  sd    t0,-24(s0)
  ld    t0,-80(s0)
  ld    t1,-24(s0)
  sub   t0,t1,t0
  ld    t1,-16(s0)
  add   t0,t0,t1
  sd    t0,-64(s0)
  j     .L23
#Things to do when IF condition: ((0 - count2 ) Gre= (2 * count3 ) )  is Not met
.L22:
  #count1 := ((count1 + count3 ) + (count4 * count2 ) ) 
  #label: 37
  ld    t0,-64(s0)
  sd    t0,-16(s0)
  ld    t0,-120(s0)
  ld    t1,-16(s0)
  add   t0,t0,t1
  sd    t0,-16(s0)
  ld    t0,-136(s0)
  sd    t0,-24(s0)
  ld    t0,-80(s0)
  ld    t1,-24(s0)
  mul   t0,t0,t1
  ld    t1,-16(s0)
  add   t0,t0,t1
  sd    t0,-64(s0)
#code after if ((0 - count2 ) Gre= (2 * count3 ) ) 
.L23:
  #d := c 
  #label: 38
  ld    t0,-96(s0)
  sd    t0,-112(s0)
  #c := b 
  #label: 39
  ld    t0,-88(s0)
  sd    t0,-96(s0)
  #b := a 
  #label: 40
  ld    t0,-72(s0)
  sd    t0,-88(s0)
  #a := 0 
  #label: 41
  li    t0,0
  sd    t0,-72(s0)
#while condition: ((((a Gre 0 ) or (b Gre 0 ) ) or (c Gre 0 ) ) or (d Gre 0 ) ) 
  #label: 4
.L2:
  ld    t0,-72(s0)
  sd    t0,-16(s0)
  li    t0,0
  ld    t1,-16(s0)
  sub   t1,t1,t0
  sgtz  t0,t1
  sd    t0,-16(s0)
  ld    t0,-88(s0)
  sd    t0,-24(s0)
  li    t0,0
  ld    t1,-24(s0)
  sub   t1,t1,t0
  sgtz  t0,t1
  ld    t1,-16(s0)
  add   t0,t0,t1
  snez  t0,t0
  sd    t0,-16(s0)
  ld    t0,-96(s0)
  sd    t0,-24(s0)
  li    t0,0
  ld    t1,-24(s0)
  sub   t1,t1,t0
  sgtz  t0,t1
  ld    t1,-16(s0)
  add   t0,t0,t1
  snez  t0,t0
  sd    t0,-16(s0)
  ld    t0,-112(s0)
  sd    t0,-24(s0)
  li    t0,0
  ld    t1,-24(s0)
  sub   t1,t1,t0
  sgtz  t0,t1
  ld    t1,-16(s0)
  add   t0,t0,t1
  snez  t0,t0
  bnez  t0,.L3
#code for while condition ((((a Gre 0 ) or (b Gre 0 ) ) or (c Gre 0 ) ) or (d Gre 0 ) )  not met: 
nop
nop
nop
  ld    a0,-168(s0)
  ld    t0,-72(s0)
  sd    t0,0(a0)
  ld    t0,-88(s0)
  sd    t0,8(a0)
  ld    t0,-96(s0)
  sd    t0,16(a0)
  ld    t0,-64(s0)
  sd    t0,24(a0)
  ld    t0,-80(s0)
  sd    t0,32(a0)
  ld    t0,-120(s0)
  sd    t0,40(a0)
  ld    t0,-136(s0)
  sd    t0,48(a0)
  ld    t0,-112(s0)
  sd    t0,56(a0)
  ld    t0,-104(s0)
  sd    t0,64(a0)
  ld    t0,-144(s0)
  sd    t0,72(a0)
  ld    t0,-152(s0)
  sd    t0,80(a0)
  ld    t0,-128(s0)
  sd    t0,88(a0)
nop
  ld    s0,208(sp)
  addi  sp,sp,216
jr  ra
    .size   nosense, .-nosense
    .ident "GCC: (GNU) 9.0.1 20190123 (Red Hat 9.0.1-0.1)"
    .section        .note.GNU-stack,"",@progbits

