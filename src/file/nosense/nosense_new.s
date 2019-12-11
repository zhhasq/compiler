    .file   "nosense.c"
    .option nopic
    .text
    .align 1
    .global nosense
    .type nosense, @function
nosense:

  addi  sp,sp,-216
  sd    s3,208(sp)
  sd    s4,200(sp)
  sd    s5,192(sp)
  sd    s11,184(sp)
  sd    s6,176(sp)
  sd    s10,168(sp)
  sd    s7,160(sp)
  sd    s8,152(sp)
  sd    s9,144(sp)
  sd    s0,136(sp)
  sd    s1,128(sp)
  sd    s2,120(sp)
  addi  s0,sp,216
  sd    a0,-256(s0)
  ld    a0,-256(s0)
  ld    t0,0(a0)
  sd    t0,-160(s0)
  ld    t0,8(a0)
  sd    t0,-176(s0)
  ld    t0,16(a0)
  sd    t0,-184(s0)
  ld    t0,24(a0)
  sd    t0,-152(s0)
  ld    t0,32(a0)
  sd    t0,-168(s0)
  ld    t0,40(a0)
  sd    t0,-208(s0)
  ld    t0,48(a0)
  sd    t0,-224(s0)
  ld    t0,56(a0)
  sd    t0,-200(s0)
  ld    t0,64(a0)
  sd    t0,-192(s0)
  ld    t0,72(a0)
  sd    t0,-232(s0)
  ld    t0,80(a0)
  sd    t0,-240(s0)
  ld    t0,88(a0)
  sd    t0,-216(s0)
  ld    s1,-160(s0)
  ld    s2,-208(s0)
  ld    s3,-232(s0)
  ld    s4,-192(s0)
  ld    s5,-224(s0)
  ld    s6,-200(s0)
  ld    s7,-184(s0)
  ld    s8,-168(s0)
  ld    s9,-176(s0)
  ld    s10,-152(s0)
  ld    s11,-240(s0)
nop
nop
nop
  #count1 := 0 
  #label: 0
  li    t0,0
  mv  s10,t0
  #count2 := 0 
  #label: 1
  li    t0,0
  mv  s8,t0
  #count3 := 0 
  #label: 2
  li    t0,0
  mv  s2,t0
  #count4 := 0 
  #label: 3
  li    t0,0
  mv  s5,t0
  j     .L2
#code for while condition ((((a Gre 0 ) or (b Gre 0 ) ) or (c Gre 0 ) ) or (d Gre 0 ) )  met: 
.L3:
  #count1 := (count1 + 1 ) 
  #label: 5
  mv  t0,s10
  sd    t0,-104(s0)
  li    t0,1
  ld    t1,-104(s0)
  add   t0,t0,t1
  mv  s10,t0
  j     .L4
#code for while condition ((Not((((1 * c ) + (2 * a ) ) Less ((1 * d ) + (2 * b ) ) ) ) ) And (true And ((((1 * d ) + (2 * a ) ) Gre= ((1 * c ) + (2 * b ) ) ) And (count2 Less= 1000 ) ) ) )  met: 
.L5:
  #count2 := ((((count2 + (1 * c ) ) + (2 * a ) ) + (1 * d ) ) + (2 * b ) ) 
  #label: 7
  mv  t0,s8
  sd    t0,-104(s0)
  li    t0,1
  sd    t0,-112(s0)
  mv  t0,s7
  ld    t1,-112(s0)
  mul   t0,t0,t1
  ld    t1,-104(s0)
  add   t0,t0,t1
  sd    t0,-104(s0)
  li    t0,2
  sd    t0,-112(s0)
  mv  t0,s1
  ld    t1,-112(s0)
  mul   t0,t0,t1
  ld    t1,-104(s0)
  add   t0,t0,t1
  sd    t0,-104(s0)
  li    t0,1
  sd    t0,-112(s0)
  mv  t0,s6
  ld    t1,-112(s0)
  mul   t0,t0,t1
  ld    t1,-104(s0)
  add   t0,t0,t1
  sd    t0,-104(s0)
  li    t0,2
  sd    t0,-112(s0)
  mv  t0,s9
  ld    t1,-112(s0)
  mul   t0,t0,t1
  ld    t1,-104(s0)
  add   t0,t0,t1
  mv  s8,t0
#IF condition: ((((6 + a ) + (b * (d - ((b + (c * a ) ) - d ) ) ) ) - d ) Gre 0 ) 
  #label: 8
  li    t0,6
  sd    t0,-104(s0)
  mv  t0,s1
  ld    t1,-104(s0)
  add   t0,t0,t1
  sd    t0,-104(s0)
  mv  t0,s9
  sd    t0,-112(s0)
  mv  t0,s6
  sd    t0,-120(s0)
  mv  t0,s9
  sd    t0,-128(s0)
  mv  t0,s7
  sd    t0,-136(s0)
  mv  t0,s1
  ld    t1,-136(s0)
  mul   t0,t0,t1
  ld    t1,-128(s0)
  add   t0,t0,t1
  sd    t0,-128(s0)
  mv  t0,s6
  ld    t1,-128(s0)
  sub   t0,t1,t0
  ld    t1,-120(s0)
  sub   t0,t1,t0
  ld    t1,-112(s0)
  mul   t0,t0,t1
  ld    t1,-104(s0)
  add   t0,t0,t1
  sd    t0,-104(s0)
  mv  t0,s6
  ld    t1,-104(s0)
  sub   t0,t1,t0
  sd    t0,-104(s0)
  li    t0,0
  ld    t1,-104(s0)
  sub   t1,t1,t0
  sgtz  t0,t1
#go to .L6 if condition not met
  beqz  t0,.L6
#Things to do when IF condition: ((((6 + a ) + (b * (d - ((b + (c * a ) ) - d ) ) ) ) - d ) Gre 0 )  is met
  #count4 := (count4 + 1 ) 
  #label: 9
  mv  t0,s5
  sd    t0,-104(s0)
  li    t0,1
  ld    t1,-104(s0)
  add   t0,t0,t1
  mv  s5,t0
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
  sd    t0,-104(s0)
  mv  t0,s7
  ld    t1,-104(s0)
  mul   t0,t0,t1
  sd    t0,-104(s0)
  li    t0,2
  sd    t0,-112(s0)
  mv  t0,s1
  ld    t1,-112(s0)
  mul   t0,t0,t1
  ld    t1,-104(s0)
  add   t0,t0,t1
  sd    t0,-104(s0)
  li    t0,1
  sd    t0,-112(s0)
  mv  t0,s6
  ld    t1,-112(s0)
  mul   t0,t0,t1
  sd    t0,-112(s0)
  li    t0,2
  sd    t0,-120(s0)
  mv  t0,s9
  ld    t1,-120(s0)
  mul   t0,t0,t1
  ld    t1,-112(s0)
  add   t0,t0,t1
  ld    t1,-104(s0)
  sub   t1,t0,t1
  sgtz  t0,t1
  sd    t0,-104(s0)
  ld    t1,-104(s0)
  xori  t0,t1,1
  sd    t0,-104(s0)
  li    t0,1
  sd    t0,-112(s0)
  li    t0,1
  sd    t0,-120(s0)
  mv  t0,s6
  ld    t1,-120(s0)
  mul   t0,t0,t1
  sd    t0,-120(s0)
  li    t0,2
  sd    t0,-128(s0)
  mv  t0,s1
  ld    t1,-128(s0)
  mul   t0,t0,t1
  ld    t1,-120(s0)
  add   t0,t0,t1
  sd    t0,-120(s0)
  li    t0,1
  sd    t0,-128(s0)
  mv  t0,s7
  ld    t1,-128(s0)
  mul   t0,t0,t1
  sd    t0,-128(s0)
  li    t0,2
  sd    t0,-136(s0)
  mv  t0,s9
  ld    t1,-136(s0)
  mul   t0,t0,t1
  ld    t1,-128(s0)
  add   t0,t0,t1
  ld    t1,-120(s0)
  sub   t1,t0,t1
  sgtz  t0,t1
  xori  t0,t0,1
  sd    t0,-120(s0)
  mv  t0,s8
  sd    t0,-128(s0)
  li    t0,1000
  ld    t1,-128(s0)
  sub   t1,t1,t0
  sgtz  t0,t1
  xori  t0,t0,1
  ld    t1,-120(s0)
  mul   t0,t0,t1
  ld    t1,-112(s0)
  mul   t0,t0,t1
  ld    t1,-104(s0)
  mul   t0,t0,t1
  bnez  t0,.L5
#code for while condition ((Not((((1 * c ) + (2 * a ) ) Less ((1 * d ) + (2 * b ) ) ) ) ) And (true And ((((1 * d ) + (2 * a ) ) Gre= ((1 * c ) + (2 * b ) ) ) And (count2 Less= 1000 ) ) ) )  not met: 
  #flag := 0 
  #label: 11
  li    t0,0
  mv  s4,t0
  #i := 0 
  #label: 12
  li    t0,0
  mv  s3,t0
  #positive := count2 
  #label: 13
  mv  t0,s8
  mv  s11,t0
#IF condition: (count2 Less 0 ) 
  #label: 14
  mv  t0,s8
  sd    t0,-104(s0)
  li    t0,0
  ld    t1,-104(s0)
  sub   t1,t0,t1
  sgtz  t0,t1
#go to .L8 if condition not met
  beqz  t0,.L8
#Things to do when IF condition: (count2 Less 0 )  is met
  #positive := (0 - count2 ) 
  #label: 15
  li    t0,0
  sd    t0,-104(s0)
  mv  t0,s8
  ld    t1,-104(s0)
  sub   t0,t1,t0
  mv  s11,t0
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
  mv  t0,s3
  sd    t0,-104(s0)
  li    t0,2
  ld    t1,-104(s0)
  mul   t0,t0,t1
  sd    t0,-104(s0)
  mv  t0,s11
  ld    t1,-104(s0)
  sub   t1,t1,t0
  seqz  t0,t1
#go to .L12 if condition not met
  beqz  t0,.L12
#Things to do when IF condition: ((i * 2 ) = positive )  is met
  #flag := 1 
  #label: 19
  li    t0,1
  mv  s4,t0
  j     .L13
#Things to do when IF condition: ((i * 2 ) = positive )  is Not met
.L12:
  #label: 20
nop
#code after if ((i * 2 ) = positive ) 
.L13:
  #i := (i + 1 ) 
  #label: 21
  mv  t0,s3
  sd    t0,-104(s0)
  li    t0,1
  ld    t1,-104(s0)
  add   t0,t0,t1
  mv  s3,t0
#while condition: ((flag = 0 ) And (i Less= positive ) ) 
  #label: 17
.L10:
  mv  t0,s4
  sd    t0,-104(s0)
  li    t0,0
  ld    t1,-104(s0)
  sub   t1,t1,t0
  seqz  t0,t1
  sd    t0,-104(s0)
  mv  t0,s3
  sd    t0,-112(s0)
  mv  t0,s11
  ld    t1,-112(s0)
  sub   t1,t1,t0
  sgtz  t0,t1
  xori  t0,t0,1
  ld    t1,-104(s0)
  mul   t0,t0,t1
  bnez  t0,.L11
#code for while condition ((flag = 0 ) And (i Less= positive ) )  not met: 
#IF condition: (flag = 1 ) 
  #label: 22
  mv  t0,s4
  sd    t0,-104(s0)
  li    t0,1
  ld    t1,-104(s0)
  sub   t1,t1,t0
  seqz  t0,t1
#go to .L14 if condition not met
  beqz  t0,.L14
#Things to do when IF condition: (flag = 1 )  is met
  #tmp := ((((1 * d ) + (2 * c ) ) + (4 * b ) ) + (8 * d ) ) 
  #label: 23
  li    t0,1
  sd    t0,-104(s0)
  mv  t0,s6
  ld    t1,-104(s0)
  mul   t0,t0,t1
  sd    t0,-104(s0)
  li    t0,2
  sd    t0,-112(s0)
  mv  t0,s7
  ld    t1,-112(s0)
  mul   t0,t0,t1
  ld    t1,-104(s0)
  add   t0,t0,t1
  sd    t0,-104(s0)
  li    t0,4
  sd    t0,-112(s0)
  mv  t0,s9
  ld    t1,-112(s0)
  mul   t0,t0,t1
  ld    t1,-104(s0)
  add   t0,t0,t1
  sd    t0,-104(s0)
  li    t0,8
  sd    t0,-112(s0)
  mv  t0,s6
  ld    t1,-112(s0)
  mul   t0,t0,t1
  ld    t1,-104(s0)
  add   t0,t0,t1
  mv  s3,t0
  j     .L16
#code for while condition ((tmp Gre 0 ) And (Not((flag = 0 ) ) ) )  met: 
.L17:
  #tmp := (tmp - 1 ) 
  #label: 25
  mv  t0,s3
  sd    t0,-104(s0)
  li    t0,1
  ld    t1,-104(s0)
  sub   t0,t1,t0
  mv  s3,t0
  #count3 := (count3 + tmp ) 
  #label: 26
  mv  t0,s2
  sd    t0,-104(s0)
  mv  t0,s3
  ld    t1,-104(s0)
  add   t0,t0,t1
  mv  s2,t0
#IF condition: (Not((((count3 Less= count4 ) or ((count1 Less= count3 ) And true ) ) or (Not(true ) ) ) ) ) 
  #label: 27
  mv  t0,s2
  sd    t0,-104(s0)
  mv  t0,s5
  ld    t1,-104(s0)
  sub   t1,t1,t0
  sgtz  t0,t1
  xori  t0,t0,1
  sd    t0,-104(s0)
  mv  t0,s10
  sd    t0,-112(s0)
  mv  t0,s2
  ld    t1,-112(s0)
  sub   t1,t1,t0
  sgtz  t0,t1
  xori  t0,t0,1
  sd    t0,-112(s0)
  li    t0,1
  ld    t1,-112(s0)
  mul   t0,t0,t1
  ld    t1,-104(s0)
  add   t0,t0,t1
  snez  t0,t0
  sd    t0,-104(s0)
  li    t0,1
  sd    t0,-112(s0)
  ld    t1,-112(s0)
  xori  t0,t1,1
  ld    t1,-104(s0)
  add   t0,t0,t1
  snez  t0,t0
  sd    t0,-104(s0)
  ld    t1,-104(s0)
  xori  t0,t1,1
#go to .L18 if condition not met
  beqz  t0,.L18
#Things to do when IF condition: (Not((((count3 Less= count4 ) or ((count1 Less= count3 ) And true ) ) or (Not(true ) ) ) ) )  is met
  #count3 := (count3 + count4 ) 
  #label: 28
  mv  t0,s2
  sd    t0,-104(s0)
  mv  t0,s5
  ld    t1,-104(s0)
  add   t0,t0,t1
  mv  s2,t0
  j     .L19
#Things to do when IF condition: (Not((((count3 Less= count4 ) or ((count1 Less= count3 ) And true ) ) or (Not(true ) ) ) ) )  is Not met
.L18:
  #count3 := (count3 - count4 ) 
  #label: 29
  mv  t0,s2
  sd    t0,-104(s0)
  mv  t0,s5
  ld    t1,-104(s0)
  sub   t0,t1,t0
  mv  s2,t0
#code after if (Not((((count3 Less= count4 ) or ((count1 Less= count3 ) And true ) ) or (Not(true ) ) ) ) ) 
.L19:
#while condition: ((tmp Gre 0 ) And (Not((flag = 0 ) ) ) ) 
  #label: 24
.L16:
  mv  t0,s3
  sd    t0,-104(s0)
  li    t0,0
  ld    t1,-104(s0)
  sub   t1,t1,t0
  sgtz  t0,t1
  sd    t0,-104(s0)
  mv  t0,s4
  sd    t0,-112(s0)
  li    t0,0
  ld    t1,-112(s0)
  sub   t1,t1,t0
  seqz  t0,t1
  sd    t0,-112(s0)
  ld    t1,-112(s0)
  xori  t0,t1,1
  ld    t1,-104(s0)
  mul   t0,t0,t1
  bnez  t0,.L17
#code for while condition ((tmp Gre 0 ) And (Not((flag = 0 ) ) ) )  not met: 
  j     .L15
#Things to do when IF condition: (flag = 1 )  is Not met
.L14:
  #tmp := ((((1 * d ) + (2 * c ) ) + (4 * b ) ) + (8 * d ) ) 
  #label: 30
  li    t0,1
  sd    t0,-104(s0)
  mv  t0,s6
  ld    t1,-104(s0)
  mul   t0,t0,t1
  sd    t0,-104(s0)
  li    t0,2
  sd    t0,-112(s0)
  mv  t0,s7
  ld    t1,-112(s0)
  mul   t0,t0,t1
  ld    t1,-104(s0)
  add   t0,t0,t1
  sd    t0,-104(s0)
  li    t0,4
  sd    t0,-112(s0)
  mv  t0,s9
  ld    t1,-112(s0)
  mul   t0,t0,t1
  ld    t1,-104(s0)
  add   t0,t0,t1
  sd    t0,-104(s0)
  li    t0,8
  sd    t0,-112(s0)
  mv  t0,s6
  ld    t1,-112(s0)
  mul   t0,t0,t1
  ld    t1,-104(s0)
  add   t0,t0,t1
  mv  s3,t0
  j     .L20
#code for while condition ((tmp Gre 0 ) And (Not((flag = 1 ) ) ) )  met: 
.L21:
  #tmp := (tmp - 1 ) 
  #label: 32
  mv  t0,s3
  sd    t0,-104(s0)
  li    t0,1
  ld    t1,-104(s0)
  sub   t0,t1,t0
  mv  s3,t0
  #count3 := (count3 + (2 * tmp ) ) 
  #label: 33
  mv  t0,s2
  sd    t0,-104(s0)
  li    t0,2
  sd    t0,-112(s0)
  mv  t0,s3
  ld    t1,-112(s0)
  mul   t0,t0,t1
  ld    t1,-104(s0)
  add   t0,t0,t1
  mv  s2,t0
#while condition: ((tmp Gre 0 ) And (Not((flag = 1 ) ) ) ) 
  #label: 31
.L20:
  mv  t0,s3
  sd    t0,-104(s0)
  li    t0,0
  ld    t1,-104(s0)
  sub   t1,t1,t0
  sgtz  t0,t1
  sd    t0,-104(s0)
  mv  t0,s4
  sd    t0,-112(s0)
  li    t0,1
  ld    t1,-112(s0)
  sub   t1,t1,t0
  seqz  t0,t1
  sd    t0,-112(s0)
  ld    t1,-112(s0)
  xori  t0,t1,1
  ld    t1,-104(s0)
  mul   t0,t0,t1
  bnez  t0,.L21
#code for while condition ((tmp Gre 0 ) And (Not((flag = 1 ) ) ) )  not met: 
#code after if (flag = 1 ) 
.L15:
  #count2 := ((count2 - count3 ) - count4 ) 
  #label: 34
  mv  t0,s8
  sd    t0,-104(s0)
  mv  t0,s2
  ld    t1,-104(s0)
  sub   t0,t1,t0
  sd    t0,-104(s0)
  mv  t0,s5
  ld    t1,-104(s0)
  sub   t0,t1,t0
  mv  s8,t0
#IF condition: ((0 - count2 ) Gre= (2 * count3 ) ) 
  #label: 35
  li    t0,0
  sd    t0,-104(s0)
  mv  t0,s8
  ld    t1,-104(s0)
  sub   t0,t1,t0
  sd    t0,-104(s0)
  li    t0,2
  sd    t0,-112(s0)
  mv  t0,s2
  ld    t1,-112(s0)
  mul   t0,t0,t1
  ld    t1,-104(s0)
  sub   t1,t0,t1
  sgtz  t0,t1
  xori  t0,t0,1
#go to .L22 if condition not met
  beqz  t0,.L22
#Things to do when IF condition: ((0 - count2 ) Gre= (2 * count3 ) )  is met
  #count1 := (count1 + (0 - count2 ) ) 
  #label: 36
  mv  t0,s10
  sd    t0,-104(s0)
  li    t0,0
  sd    t0,-112(s0)
  mv  t0,s8
  ld    t1,-112(s0)
  sub   t0,t1,t0
  ld    t1,-104(s0)
  add   t0,t0,t1
  mv  s10,t0
  j     .L23
#Things to do when IF condition: ((0 - count2 ) Gre= (2 * count3 ) )  is Not met
.L22:
  #count1 := ((count1 + count3 ) + (count4 * count2 ) ) 
  #label: 37
  mv  t0,s10
  sd    t0,-104(s0)
  mv  t0,s2
  ld    t1,-104(s0)
  add   t0,t0,t1
  sd    t0,-104(s0)
  mv  t0,s5
  sd    t0,-112(s0)
  mv  t0,s8
  ld    t1,-112(s0)
  mul   t0,t0,t1
  ld    t1,-104(s0)
  add   t0,t0,t1
  mv  s10,t0
#code after if ((0 - count2 ) Gre= (2 * count3 ) ) 
.L23:
  #d := c 
  #label: 38
  mv  t0,s7
  mv  s6,t0
  #c := b 
  #label: 39
  mv  t0,s9
  mv  s7,t0
  #b := a 
  #label: 40
  mv  t0,s1
  mv  s9,t0
  #a := 0 
  #label: 41
  li    t0,0
  mv  s1,t0
#while condition: ((((a Gre 0 ) or (b Gre 0 ) ) or (c Gre 0 ) ) or (d Gre 0 ) ) 
  #label: 4
.L2:
  mv  t0,s1
  sd    t0,-104(s0)
  li    t0,0
  ld    t1,-104(s0)
  sub   t1,t1,t0
  sgtz  t0,t1
  sd    t0,-104(s0)
  mv  t0,s9
  sd    t0,-112(s0)
  li    t0,0
  ld    t1,-112(s0)
  sub   t1,t1,t0
  sgtz  t0,t1
  ld    t1,-104(s0)
  add   t0,t0,t1
  snez  t0,t0
  sd    t0,-104(s0)
  mv  t0,s7
  sd    t0,-112(s0)
  li    t0,0
  ld    t1,-112(s0)
  sub   t1,t1,t0
  sgtz  t0,t1
  ld    t1,-104(s0)
  add   t0,t0,t1
  snez  t0,t0
  sd    t0,-104(s0)
  mv  t0,s6
  sd    t0,-112(s0)
  li    t0,0
  ld    t1,-112(s0)
  sub   t1,t1,t0
  sgtz  t0,t1
  ld    t1,-104(s0)
  add   t0,t0,t1
  snez  t0,t0
  bnez  t0,.L3
#code for while condition ((((a Gre 0 ) or (b Gre 0 ) ) or (c Gre 0 ) ) or (d Gre 0 ) )  not met: 
nop
nop
nop
  sd    s10,-152(s0)
  sd    s8,-168(s0)
  sd    s2,-208(s0)
  sd    s5,-224(s0)
  sd    s1,-160(s0)
  sd    s2,-208(s0)
  sd    s4,-192(s0)
  sd    s5,-224(s0)
  sd    s6,-200(s0)
  sd    s7,-184(s0)
  sd    s8,-168(s0)
  sd    s9,-176(s0)
  sd    s10,-152(s0)
  sd    s11,-240(s0)
  ld    a0,-256(s0)
  ld    t0,-160(s0)
  sd    t0,0(a0)
  ld    t0,-176(s0)
  sd    t0,8(a0)
  ld    t0,-184(s0)
  sd    t0,16(a0)
  ld    t0,-152(s0)
  sd    t0,24(a0)
  ld    t0,-168(s0)
  sd    t0,32(a0)
  ld    t0,-208(s0)
  sd    t0,40(a0)
  ld    t0,-224(s0)
  sd    t0,48(a0)
  ld    t0,-200(s0)
  sd    t0,56(a0)
  ld    t0,-192(s0)
  sd    t0,64(a0)
  ld    t0,-232(s0)
  sd    t0,72(a0)
  ld    t0,-240(s0)
  sd    t0,80(a0)
  ld    t0,-216(s0)
  sd    t0,88(a0)
nop
  ld    s3,208(sp)
  ld    s4,200(sp)
  ld    s5,192(sp)
  ld    s11,184(sp)
  ld    s6,176(sp)
  ld    s10,168(sp)
  ld    s7,160(sp)
  ld    s8,152(sp)
  ld    s9,144(sp)
  ld    s0,136(sp)
  ld    s1,128(sp)
  ld    s2,120(sp)
  addi  sp,sp,216
jr  ra
    .size   nosense, .-nosense
    .ident "GCC: (GNU) 9.0.1 20190123 (Red Hat 9.0.1-0.1)"
    .section        .note.GNU-stack,"",@progbits

