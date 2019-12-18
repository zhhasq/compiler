    .file   "example33.c"
    .option nopic
    .text
    .align 1
    .global example33
    .type example33, @function
example33:

  addi  sp,sp,-384
  sd    s3,376(sp)
  sd    s4,368(sp)
  sd    s5,360(sp)
  sd    s11,352(sp)
  sd    s6,344(sp)
  sd    s10,336(sp)
  sd    s7,328(sp)
  sd    s8,320(sp)
  sd    s9,312(sp)
  sd    s0,304(sp)
  sd    s1,296(sp)
  sd    s2,288(sp)
  addi  s0,sp,384
  sd    a0,-424(s0)
  ld    a0,-424(s0)
  ld    t0,0(a0)
  sd    t0,-352(s0)
  ld    t0,8(a0)
  sd    t0,-128(s0)
  ld    t0,16(a0)
  sd    t0,-168(s0)
  ld    t0,24(a0)
  sd    t0,-192(s0)
  ld    t0,32(a0)
  sd    t0,-160(s0)
  ld    t0,40(a0)
  sd    t0,-184(s0)
  ld    t0,48(a0)
  sd    t0,-144(s0)
  ld    t0,56(a0)
  sd    t0,-176(s0)
  ld    t0,64(a0)
  sd    t0,-136(s0)
  ld    t0,72(a0)
  sd    t0,-152(s0)
  ld    t0,80(a0)
  sd    t0,-360(s0)
  ld    t0,88(a0)
  sd    t0,-208(s0)
  ld    t0,96(a0)
  sd    t0,-224(s0)
  ld    t0,104(a0)
  sd    t0,-256(s0)
  ld    t0,112(a0)
  sd    t0,-216(s0)
  ld    t0,120(a0)
  sd    t0,-248(s0)
  ld    t0,128(a0)
  sd    t0,-288(s0)
  ld    t0,136(a0)
  sd    t0,-240(s0)
  ld    t0,144(a0)
  sd    t0,-280(s0)
  ld    t0,152(a0)
  sd    t0,-320(s0)
  ld    t0,160(a0)
  sd    t0,-368(s0)
  ld    t0,168(a0)
  sd    t0,-344(s0)
  ld    t0,176(a0)
  sd    t0,-336(s0)
  ld    t0,184(a0)
  sd    t0,-312(s0)
  ld    t0,192(a0)
  sd    t0,-328(s0)
  ld    t0,200(a0)
  sd    t0,-304(s0)
  ld    t0,208(a0)
  sd    t0,-272(s0)
  ld    t0,216(a0)
  sd    t0,-296(s0)
  ld    t0,224(a0)
  sd    t0,-264(s0)
  ld    t0,232(a0)
  sd    t0,-232(s0)
  ld    t0,240(a0)
  sd    t0,-376(s0)
  ld    t0,248(a0)
  sd    t0,-384(s0)
  ld    t0,256(a0)
  sd    t0,-392(s0)
  ld    t0,264(a0)
  sd    t0,-200(s0)
  ld    t0,272(a0)
  sd    t0,-400(s0)
  ld    t0,280(a0)
  sd    t0,-408(s0)
  ld    s1,-376(s0)
  ld    s2,-144(s0)
  ld    s3,-256(s0)
  ld    s4,-216(s0)
  ld    s5,-192(s0)
  ld    s6,-152(s0)
  ld    s7,-288(s0)
  ld    s8,-280(s0)
  ld    s9,-352(s0)
  ld    s10,-360(s0)
  ld    s11,-328(s0)
nop
nop
nop
  #c_0_0 := 0 
  #label: 0
  li    t0,0
  sd    t0,-344(s0)
  #c_0_1 := 0 
  #label: 1
  li    t0,0
  sd    t0,-336(s0)
  #c_0_2 := 0 
  #label: 2
  li    t0,0
  sd    t0,-312(s0)
  #c_1_0 := 0 
  #label: 3
  li    t0,0
  mv  s11,t0
  #c_1_1 := 0 
  #label: 4
  li    t0,0
  sd    t0,-304(s0)
  #c_1_2 := 0 
  #label: 5
  li    t0,0
  sd    t0,-272(s0)
  #c_2_0 := 0 
  #label: 6
  li    t0,0
  sd    t0,-296(s0)
  #c_2_1 := 0 
  #label: 7
  li    t0,0
  sd    t0,-264(s0)
  #c_2_2 := 0 
  #label: 8
  li    t0,0
  sd    t0,-232(s0)
  #i := 0 
  #label: 9
  li    t0,0
  mv  s1,t0
  j     .L2
#code for while condition (i Less 3 )  met: 
.L3:
  #j := 0 
  #label: 11
  li    t0,0
  sd    t0,-384(s0)
  j     .L4
#code for while condition (j Less 3 )  met: 
.L5:
  #s := 0 
  #label: 13
  li    t0,0
  sd    t0,-400(s0)
  #k := 0 
  #label: 14
  li    t0,0
  sd    t0,-392(s0)
  j     .L6
#code for while condition (k Less 3 )  met: 
.L7:
#IF condition: (i = 0 ) 
  #label: 16
  mv  t0,s1
  sd    t0,-104(s0)
  li    t0,0
  ld    t1,-104(s0)
  sub   t1,t1,t0
  seqz  t0,t1
#go to .L8 if condition not met
  beqz  t0,.L8
#Things to do when IF condition: (i = 0 )  is met
#IF condition: (k = 0 ) 
  #label: 17
  ld    t0,-392(s0)
  sd    t0,-104(s0)
  li    t0,0
  ld    t1,-104(s0)
  sub   t1,t1,t0
  seqz  t0,t1
#go to .L10 if condition not met
  beqz  t0,.L10
#Things to do when IF condition: (k = 0 )  is met
  #a := a_0_0 
  #label: 18
  ld    t0,-128(s0)
  mv  s9,t0
  j     .L11
#Things to do when IF condition: (k = 0 )  is Not met
.L10:
#IF condition: (k = 1 ) 
  #label: 19
  ld    t0,-392(s0)
  sd    t0,-104(s0)
  li    t0,1
  ld    t1,-104(s0)
  sub   t1,t1,t0
  seqz  t0,t1
#go to .L12 if condition not met
  beqz  t0,.L12
#Things to do when IF condition: (k = 1 )  is met
  #a := a_0_1 
  #label: 20
  ld    t0,-168(s0)
  mv  s9,t0
  j     .L13
#Things to do when IF condition: (k = 1 )  is Not met
.L12:
#IF condition: (k = 2 ) 
  #label: 21
  ld    t0,-392(s0)
  sd    t0,-104(s0)
  li    t0,2
  ld    t1,-104(s0)
  sub   t1,t1,t0
  seqz  t0,t1
#go to .L14 if condition not met
  beqz  t0,.L14
#Things to do when IF condition: (k = 2 )  is met
  #a := a_0_2 
  #label: 22
  mv  t0,s5
  mv  s9,t0
  j     .L15
#Things to do when IF condition: (k = 2 )  is Not met
.L14:
  #a := 0 
  #label: 23
  li    t0,0
  mv  s9,t0
#code after if (k = 2 ) 
.L15:
#code after if (k = 1 ) 
.L13:
#code after if (k = 0 ) 
.L11:
  j     .L9
#Things to do when IF condition: (i = 0 )  is Not met
.L8:
#IF condition: (i = 1 ) 
  #label: 24
  mv  t0,s1
  sd    t0,-104(s0)
  li    t0,1
  ld    t1,-104(s0)
  sub   t1,t1,t0
  seqz  t0,t1
#go to .L16 if condition not met
  beqz  t0,.L16
#Things to do when IF condition: (i = 1 )  is met
#IF condition: (k = 0 ) 
  #label: 25
  ld    t0,-392(s0)
  sd    t0,-104(s0)
  li    t0,0
  ld    t1,-104(s0)
  sub   t1,t1,t0
  seqz  t0,t1
#go to .L18 if condition not met
  beqz  t0,.L18
#Things to do when IF condition: (k = 0 )  is met
  #a := a_1_0 
  #label: 26
  ld    t0,-160(s0)
  mv  s9,t0
  j     .L19
#Things to do when IF condition: (k = 0 )  is Not met
.L18:
#IF condition: (k = 1 ) 
  #label: 27
  ld    t0,-392(s0)
  sd    t0,-104(s0)
  li    t0,1
  ld    t1,-104(s0)
  sub   t1,t1,t0
  seqz  t0,t1
#go to .L20 if condition not met
  beqz  t0,.L20
#Things to do when IF condition: (k = 1 )  is met
  #a := a_1_1 
  #label: 28
  ld    t0,-184(s0)
  mv  s9,t0
  j     .L21
#Things to do when IF condition: (k = 1 )  is Not met
.L20:
#IF condition: (k = 2 ) 
  #label: 29
  ld    t0,-392(s0)
  sd    t0,-104(s0)
  li    t0,2
  ld    t1,-104(s0)
  sub   t1,t1,t0
  seqz  t0,t1
#go to .L22 if condition not met
  beqz  t0,.L22
#Things to do when IF condition: (k = 2 )  is met
  #a := a_1_2 
  #label: 30
  mv  t0,s2
  mv  s9,t0
  j     .L23
#Things to do when IF condition: (k = 2 )  is Not met
.L22:
  #a := 0 
  #label: 31
  li    t0,0
  mv  s9,t0
#code after if (k = 2 ) 
.L23:
#code after if (k = 1 ) 
.L21:
#code after if (k = 0 ) 
.L19:
  j     .L17
#Things to do when IF condition: (i = 1 )  is Not met
.L16:
#IF condition: (i = 2 ) 
  #label: 32
  mv  t0,s1
  sd    t0,-104(s0)
  li    t0,2
  ld    t1,-104(s0)
  sub   t1,t1,t0
  seqz  t0,t1
#go to .L24 if condition not met
  beqz  t0,.L24
#Things to do when IF condition: (i = 2 )  is met
#IF condition: (k = 0 ) 
  #label: 33
  ld    t0,-392(s0)
  sd    t0,-104(s0)
  li    t0,0
  ld    t1,-104(s0)
  sub   t1,t1,t0
  seqz  t0,t1
#go to .L26 if condition not met
  beqz  t0,.L26
#Things to do when IF condition: (k = 0 )  is met
  #a := a_2_0 
  #label: 34
  ld    t0,-176(s0)
  mv  s9,t0
  j     .L27
#Things to do when IF condition: (k = 0 )  is Not met
.L26:
#IF condition: (k = 1 ) 
  #label: 35
  ld    t0,-392(s0)
  sd    t0,-104(s0)
  li    t0,1
  ld    t1,-104(s0)
  sub   t1,t1,t0
  seqz  t0,t1
#go to .L28 if condition not met
  beqz  t0,.L28
#Things to do when IF condition: (k = 1 )  is met
  #a := a_2_1 
  #label: 36
  ld    t0,-136(s0)
  mv  s9,t0
  j     .L29
#Things to do when IF condition: (k = 1 )  is Not met
.L28:
#IF condition: (k = 2 ) 
  #label: 37
  ld    t0,-392(s0)
  sd    t0,-104(s0)
  li    t0,2
  ld    t1,-104(s0)
  sub   t1,t1,t0
  seqz  t0,t1
#go to .L30 if condition not met
  beqz  t0,.L30
#Things to do when IF condition: (k = 2 )  is met
  #a := a_2_2 
  #label: 38
  mv  t0,s6
  mv  s9,t0
  j     .L31
#Things to do when IF condition: (k = 2 )  is Not met
.L30:
  #a := 0 
  #label: 39
  li    t0,0
  mv  s9,t0
#code after if (k = 2 ) 
.L31:
#code after if (k = 1 ) 
.L29:
#code after if (k = 0 ) 
.L27:
  j     .L25
#Things to do when IF condition: (i = 2 )  is Not met
.L24:
  #a := 0 
  #label: 40
  li    t0,0
  mv  s9,t0
#code after if (i = 2 ) 
.L25:
#code after if (i = 1 ) 
.L17:
#code after if (i = 0 ) 
.L9:
#IF condition: (k = 0 ) 
  #label: 41
  ld    t0,-392(s0)
  sd    t0,-104(s0)
  li    t0,0
  ld    t1,-104(s0)
  sub   t1,t1,t0
  seqz  t0,t1
#go to .L32 if condition not met
  beqz  t0,.L32
#Things to do when IF condition: (k = 0 )  is met
#IF condition: (j = 0 ) 
  #label: 42
  ld    t0,-384(s0)
  sd    t0,-104(s0)
  li    t0,0
  ld    t1,-104(s0)
  sub   t1,t1,t0
  seqz  t0,t1
#go to .L34 if condition not met
  beqz  t0,.L34
#Things to do when IF condition: (j = 0 )  is met
  #b := b_0_0 
  #label: 43
  ld    t0,-208(s0)
  mv  s10,t0
  j     .L35
#Things to do when IF condition: (j = 0 )  is Not met
.L34:
#IF condition: (j = 1 ) 
  #label: 44
  ld    t0,-384(s0)
  sd    t0,-104(s0)
  li    t0,1
  ld    t1,-104(s0)
  sub   t1,t1,t0
  seqz  t0,t1
#go to .L36 if condition not met
  beqz  t0,.L36
#Things to do when IF condition: (j = 1 )  is met
  #b := b_0_1 
  #label: 45
  ld    t0,-224(s0)
  mv  s10,t0
  j     .L37
#Things to do when IF condition: (j = 1 )  is Not met
.L36:
#IF condition: (j = 2 ) 
  #label: 46
  ld    t0,-384(s0)
  sd    t0,-104(s0)
  li    t0,2
  ld    t1,-104(s0)
  sub   t1,t1,t0
  seqz  t0,t1
#go to .L38 if condition not met
  beqz  t0,.L38
#Things to do when IF condition: (j = 2 )  is met
  #b := b_0_2 
  #label: 47
  mv  t0,s3
  mv  s10,t0
  j     .L39
#Things to do when IF condition: (j = 2 )  is Not met
.L38:
  #b := 0 
  #label: 48
  li    t0,0
  mv  s10,t0
#code after if (j = 2 ) 
.L39:
#code after if (j = 1 ) 
.L37:
#code after if (j = 0 ) 
.L35:
  j     .L33
#Things to do when IF condition: (k = 0 )  is Not met
.L32:
#IF condition: (k = 1 ) 
  #label: 49
  ld    t0,-392(s0)
  sd    t0,-104(s0)
  li    t0,1
  ld    t1,-104(s0)
  sub   t1,t1,t0
  seqz  t0,t1
#go to .L40 if condition not met
  beqz  t0,.L40
#Things to do when IF condition: (k = 1 )  is met
#IF condition: (j = 0 ) 
  #label: 50
  ld    t0,-384(s0)
  sd    t0,-104(s0)
  li    t0,0
  ld    t1,-104(s0)
  sub   t1,t1,t0
  seqz  t0,t1
#go to .L42 if condition not met
  beqz  t0,.L42
#Things to do when IF condition: (j = 0 )  is met
  #b := b_1_0 
  #label: 51
  mv  t0,s4
  mv  s10,t0
  j     .L43
#Things to do when IF condition: (j = 0 )  is Not met
.L42:
#IF condition: (j = 1 ) 
  #label: 52
  ld    t0,-384(s0)
  sd    t0,-104(s0)
  li    t0,1
  ld    t1,-104(s0)
  sub   t1,t1,t0
  seqz  t0,t1
#go to .L44 if condition not met
  beqz  t0,.L44
#Things to do when IF condition: (j = 1 )  is met
  #b := b_1_1 
  #label: 53
  ld    t0,-248(s0)
  mv  s10,t0
  j     .L45
#Things to do when IF condition: (j = 1 )  is Not met
.L44:
#IF condition: (j = 2 ) 
  #label: 54
  ld    t0,-384(s0)
  sd    t0,-104(s0)
  li    t0,2
  ld    t1,-104(s0)
  sub   t1,t1,t0
  seqz  t0,t1
#go to .L46 if condition not met
  beqz  t0,.L46
#Things to do when IF condition: (j = 2 )  is met
  #b := b_1_2 
  #label: 55
  mv  t0,s7
  mv  s10,t0
  j     .L47
#Things to do when IF condition: (j = 2 )  is Not met
.L46:
  #b := 0 
  #label: 56
  li    t0,0
  mv  s10,t0
#code after if (j = 2 ) 
.L47:
#code after if (j = 1 ) 
.L45:
#code after if (j = 0 ) 
.L43:
  j     .L41
#Things to do when IF condition: (k = 1 )  is Not met
.L40:
#IF condition: (k = 2 ) 
  #label: 57
  ld    t0,-392(s0)
  sd    t0,-104(s0)
  li    t0,2
  ld    t1,-104(s0)
  sub   t1,t1,t0
  seqz  t0,t1
#go to .L48 if condition not met
  beqz  t0,.L48
#Things to do when IF condition: (k = 2 )  is met
#IF condition: (j = 0 ) 
  #label: 58
  ld    t0,-384(s0)
  sd    t0,-104(s0)
  li    t0,0
  ld    t1,-104(s0)
  sub   t1,t1,t0
  seqz  t0,t1
#go to .L50 if condition not met
  beqz  t0,.L50
#Things to do when IF condition: (j = 0 )  is met
  #b := b_2_0 
  #label: 59
  ld    t0,-240(s0)
  mv  s10,t0
  j     .L51
#Things to do when IF condition: (j = 0 )  is Not met
.L50:
#IF condition: (j = 1 ) 
  #label: 60
  ld    t0,-384(s0)
  sd    t0,-104(s0)
  li    t0,1
  ld    t1,-104(s0)
  sub   t1,t1,t0
  seqz  t0,t1
#go to .L52 if condition not met
  beqz  t0,.L52
#Things to do when IF condition: (j = 1 )  is met
  #b := b_2_1 
  #label: 61
  mv  t0,s8
  mv  s10,t0
  j     .L53
#Things to do when IF condition: (j = 1 )  is Not met
.L52:
#IF condition: (j = 2 ) 
  #label: 62
  ld    t0,-384(s0)
  sd    t0,-104(s0)
  li    t0,2
  ld    t1,-104(s0)
  sub   t1,t1,t0
  seqz  t0,t1
#go to .L54 if condition not met
  beqz  t0,.L54
#Things to do when IF condition: (j = 2 )  is met
  #b := b_2_2 
  #label: 63
  ld    t0,-320(s0)
  mv  s10,t0
  j     .L55
#Things to do when IF condition: (j = 2 )  is Not met
.L54:
  #b := 0 
  #label: 64
  li    t0,0
  mv  s10,t0
#code after if (j = 2 ) 
.L55:
#code after if (j = 1 ) 
.L53:
#code after if (j = 0 ) 
.L51:
  j     .L49
#Things to do when IF condition: (k = 2 )  is Not met
.L48:
  #b := 0 
  #label: 65
  li    t0,0
  mv  s10,t0
#code after if (k = 2 ) 
.L49:
#code after if (k = 1 ) 
.L41:
#code after if (k = 0 ) 
.L33:
  #s := (s + (a * b ) ) 
  #label: 66
  ld    t0,-400(s0)
  sd    t0,-104(s0)
  mv  t0,s9
  sd    t0,-112(s0)
  mv  t0,s10
  ld    t1,-112(s0)
  mul   t0,t0,t1
  ld    t1,-104(s0)
  add   t0,t0,t1
  sd    t0,-400(s0)
  #k := (k + 1 ) 
  #label: 67
  ld    t0,-392(s0)
  sd    t0,-104(s0)
  li    t0,1
  ld    t1,-104(s0)
  add   t0,t0,t1
  sd    t0,-392(s0)
#while condition: (k Less 3 ) 
  #label: 15
.L6:
  ld    t0,-392(s0)
  sd    t0,-104(s0)
  li    t0,3
  ld    t1,-104(s0)
  sub   t1,t0,t1
  sgtz  t0,t1
  bnez  t0,.L7
#code for while condition (k Less 3 )  not met: 
#IF condition: (i = 0 ) 
  #label: 68
  mv  t0,s1
  sd    t0,-104(s0)
  li    t0,0
  ld    t1,-104(s0)
  sub   t1,t1,t0
  seqz  t0,t1
#go to .L56 if condition not met
  beqz  t0,.L56
#Things to do when IF condition: (i = 0 )  is met
#IF condition: (j = 0 ) 
  #label: 69
  ld    t0,-384(s0)
  sd    t0,-104(s0)
  li    t0,0
  ld    t1,-104(s0)
  sub   t1,t1,t0
  seqz  t0,t1
#go to .L58 if condition not met
  beqz  t0,.L58
#Things to do when IF condition: (j = 0 )  is met
  #c_0_0 := s 
  #label: 70
  ld    t0,-400(s0)
  sd    t0,-344(s0)
  j     .L59
#Things to do when IF condition: (j = 0 )  is Not met
.L58:
#IF condition: (j = 1 ) 
  #label: 71
  ld    t0,-384(s0)
  sd    t0,-104(s0)
  li    t0,1
  ld    t1,-104(s0)
  sub   t1,t1,t0
  seqz  t0,t1
#go to .L60 if condition not met
  beqz  t0,.L60
#Things to do when IF condition: (j = 1 )  is met
  #c_0_1 := s 
  #label: 72
  ld    t0,-400(s0)
  sd    t0,-336(s0)
  j     .L61
#Things to do when IF condition: (j = 1 )  is Not met
.L60:
#IF condition: (j = 2 ) 
  #label: 73
  ld    t0,-384(s0)
  sd    t0,-104(s0)
  li    t0,2
  ld    t1,-104(s0)
  sub   t1,t1,t0
  seqz  t0,t1
#go to .L62 if condition not met
  beqz  t0,.L62
#Things to do when IF condition: (j = 2 )  is met
  #c_0_2 := s 
  #label: 74
  ld    t0,-400(s0)
  sd    t0,-312(s0)
  j     .L63
#Things to do when IF condition: (j = 2 )  is Not met
.L62:
  #label: 75
nop
#code after if (j = 2 ) 
.L63:
#code after if (j = 1 ) 
.L61:
#code after if (j = 0 ) 
.L59:
  j     .L57
#Things to do when IF condition: (i = 0 )  is Not met
.L56:
#IF condition: (i = 1 ) 
  #label: 76
  mv  t0,s1
  sd    t0,-104(s0)
  li    t0,1
  ld    t1,-104(s0)
  sub   t1,t1,t0
  seqz  t0,t1
#go to .L64 if condition not met
  beqz  t0,.L64
#Things to do when IF condition: (i = 1 )  is met
#IF condition: (j = 0 ) 
  #label: 77
  ld    t0,-384(s0)
  sd    t0,-104(s0)
  li    t0,0
  ld    t1,-104(s0)
  sub   t1,t1,t0
  seqz  t0,t1
#go to .L66 if condition not met
  beqz  t0,.L66
#Things to do when IF condition: (j = 0 )  is met
  #c_1_0 := s 
  #label: 78
  ld    t0,-400(s0)
  mv  s11,t0
  j     .L67
#Things to do when IF condition: (j = 0 )  is Not met
.L66:
#IF condition: (j = 1 ) 
  #label: 79
  ld    t0,-384(s0)
  sd    t0,-104(s0)
  li    t0,1
  ld    t1,-104(s0)
  sub   t1,t1,t0
  seqz  t0,t1
#go to .L68 if condition not met
  beqz  t0,.L68
#Things to do when IF condition: (j = 1 )  is met
  #c_1_1 := s 
  #label: 80
  ld    t0,-400(s0)
  sd    t0,-304(s0)
  j     .L69
#Things to do when IF condition: (j = 1 )  is Not met
.L68:
#IF condition: (j = 2 ) 
  #label: 81
  ld    t0,-384(s0)
  sd    t0,-104(s0)
  li    t0,2
  ld    t1,-104(s0)
  sub   t1,t1,t0
  seqz  t0,t1
#go to .L70 if condition not met
  beqz  t0,.L70
#Things to do when IF condition: (j = 2 )  is met
  #c_1_2 := s 
  #label: 82
  ld    t0,-400(s0)
  sd    t0,-272(s0)
  j     .L71
#Things to do when IF condition: (j = 2 )  is Not met
.L70:
  #label: 83
nop
#code after if (j = 2 ) 
.L71:
#code after if (j = 1 ) 
.L69:
#code after if (j = 0 ) 
.L67:
  j     .L65
#Things to do when IF condition: (i = 1 )  is Not met
.L64:
#IF condition: (i = 2 ) 
  #label: 84
  mv  t0,s1
  sd    t0,-104(s0)
  li    t0,2
  ld    t1,-104(s0)
  sub   t1,t1,t0
  seqz  t0,t1
#go to .L72 if condition not met
  beqz  t0,.L72
#Things to do when IF condition: (i = 2 )  is met
#IF condition: (j = 0 ) 
  #label: 85
  ld    t0,-384(s0)
  sd    t0,-104(s0)
  li    t0,0
  ld    t1,-104(s0)
  sub   t1,t1,t0
  seqz  t0,t1
#go to .L74 if condition not met
  beqz  t0,.L74
#Things to do when IF condition: (j = 0 )  is met
  #c_2_0 := s 
  #label: 86
  ld    t0,-400(s0)
  sd    t0,-296(s0)
  j     .L75
#Things to do when IF condition: (j = 0 )  is Not met
.L74:
#IF condition: (j = 1 ) 
  #label: 87
  ld    t0,-384(s0)
  sd    t0,-104(s0)
  li    t0,1
  ld    t1,-104(s0)
  sub   t1,t1,t0
  seqz  t0,t1
#go to .L76 if condition not met
  beqz  t0,.L76
#Things to do when IF condition: (j = 1 )  is met
  #c_2_1 := s 
  #label: 88
  ld    t0,-400(s0)
  sd    t0,-264(s0)
  j     .L77
#Things to do when IF condition: (j = 1 )  is Not met
.L76:
#IF condition: (j = 2 ) 
  #label: 89
  ld    t0,-384(s0)
  sd    t0,-104(s0)
  li    t0,2
  ld    t1,-104(s0)
  sub   t1,t1,t0
  seqz  t0,t1
#go to .L78 if condition not met
  beqz  t0,.L78
#Things to do when IF condition: (j = 2 )  is met
  #c_2_2 := s 
  #label: 90
  ld    t0,-400(s0)
  sd    t0,-232(s0)
  j     .L79
#Things to do when IF condition: (j = 2 )  is Not met
.L78:
  #label: 91
nop
#code after if (j = 2 ) 
.L79:
#code after if (j = 1 ) 
.L77:
#code after if (j = 0 ) 
.L75:
  j     .L73
#Things to do when IF condition: (i = 2 )  is Not met
.L72:
  #label: 92
nop
#code after if (i = 2 ) 
.L73:
#code after if (i = 1 ) 
.L65:
#code after if (i = 0 ) 
.L57:
  #j := (j + 1 ) 
  #label: 93
  ld    t0,-384(s0)
  sd    t0,-104(s0)
  li    t0,1
  ld    t1,-104(s0)
  add   t0,t0,t1
  sd    t0,-384(s0)
#while condition: (j Less 3 ) 
  #label: 12
.L4:
  ld    t0,-384(s0)
  sd    t0,-104(s0)
  li    t0,3
  ld    t1,-104(s0)
  sub   t1,t0,t1
  sgtz  t0,t1
  bnez  t0,.L5
#code for while condition (j Less 3 )  not met: 
  #i := (i + 1 ) 
  #label: 94
  mv  t0,s1
  sd    t0,-104(s0)
  li    t0,1
  ld    t1,-104(s0)
  add   t0,t0,t1
  mv  s1,t0
#while condition: (i Less 3 ) 
  #label: 10
.L2:
  mv  t0,s1
  sd    t0,-104(s0)
  li    t0,3
  ld    t1,-104(s0)
  sub   t1,t0,t1
  sgtz  t0,t1
  bnez  t0,.L3
#code for while condition (i Less 3 )  not met: 
  #t := 0 
  #label: 95
  li    t0,0
  mv  s2,t0
  #i := 0 
  #label: 96
  li    t0,0
  mv  s1,t0
  j     .L80
#code for while condition (i Less 3 )  met: 
.L81:
  #j := 0 
  #label: 98
  li    t0,0
  sd    t0,-384(s0)
  j     .L82
#code for while condition (j Less 3 )  met: 
.L83:
#IF condition: (i = 0 ) 
  #label: 100
  mv  t0,s1
  sd    t0,-104(s0)
  li    t0,0
  ld    t1,-104(s0)
  sub   t1,t1,t0
  seqz  t0,t1
#go to .L84 if condition not met
  beqz  t0,.L84
#Things to do when IF condition: (i = 0 )  is met
#IF condition: (j = 0 ) 
  #label: 101
  ld    t0,-384(s0)
  sd    t0,-104(s0)
  li    t0,0
  ld    t1,-104(s0)
  sub   t1,t1,t0
  seqz  t0,t1
#go to .L86 if condition not met
  beqz  t0,.L86
#Things to do when IF condition: (j = 0 )  is met
  #c := c_0_0 
  #label: 102
  ld    t0,-344(s0)
  mv  s3,t0
  j     .L87
#Things to do when IF condition: (j = 0 )  is Not met
.L86:
#IF condition: (j = 1 ) 
  #label: 103
  ld    t0,-384(s0)
  sd    t0,-104(s0)
  li    t0,1
  ld    t1,-104(s0)
  sub   t1,t1,t0
  seqz  t0,t1
#go to .L88 if condition not met
  beqz  t0,.L88
#Things to do when IF condition: (j = 1 )  is met
  #c := c_0_1 
  #label: 104
  ld    t0,-336(s0)
  mv  s3,t0
  j     .L89
#Things to do when IF condition: (j = 1 )  is Not met
.L88:
#IF condition: (j = 2 ) 
  #label: 105
  ld    t0,-384(s0)
  sd    t0,-104(s0)
  li    t0,2
  ld    t1,-104(s0)
  sub   t1,t1,t0
  seqz  t0,t1
#go to .L90 if condition not met
  beqz  t0,.L90
#Things to do when IF condition: (j = 2 )  is met
  #c := c_0_2 
  #label: 106
  ld    t0,-312(s0)
  mv  s3,t0
  j     .L91
#Things to do when IF condition: (j = 2 )  is Not met
.L90:
  #c := 0 
  #label: 107
  li    t0,0
  mv  s3,t0
#code after if (j = 2 ) 
.L91:
#code after if (j = 1 ) 
.L89:
#code after if (j = 0 ) 
.L87:
  j     .L85
#Things to do when IF condition: (i = 0 )  is Not met
.L84:
#IF condition: (i = 1 ) 
  #label: 108
  mv  t0,s1
  sd    t0,-104(s0)
  li    t0,1
  ld    t1,-104(s0)
  sub   t1,t1,t0
  seqz  t0,t1
#go to .L92 if condition not met
  beqz  t0,.L92
#Things to do when IF condition: (i = 1 )  is met
#IF condition: (j = 0 ) 
  #label: 109
  ld    t0,-384(s0)
  sd    t0,-104(s0)
  li    t0,0
  ld    t1,-104(s0)
  sub   t1,t1,t0
  seqz  t0,t1
#go to .L94 if condition not met
  beqz  t0,.L94
#Things to do when IF condition: (j = 0 )  is met
  #c := c_1_0 
  #label: 110
  mv  t0,s11
  mv  s3,t0
  j     .L95
#Things to do when IF condition: (j = 0 )  is Not met
.L94:
#IF condition: (j = 1 ) 
  #label: 111
  ld    t0,-384(s0)
  sd    t0,-104(s0)
  li    t0,1
  ld    t1,-104(s0)
  sub   t1,t1,t0
  seqz  t0,t1
#go to .L96 if condition not met
  beqz  t0,.L96
#Things to do when IF condition: (j = 1 )  is met
  #c := c_1_1 
  #label: 112
  ld    t0,-304(s0)
  mv  s3,t0
  j     .L97
#Things to do when IF condition: (j = 1 )  is Not met
.L96:
#IF condition: (j = 2 ) 
  #label: 113
  ld    t0,-384(s0)
  sd    t0,-104(s0)
  li    t0,2
  ld    t1,-104(s0)
  sub   t1,t1,t0
  seqz  t0,t1
#go to .L98 if condition not met
  beqz  t0,.L98
#Things to do when IF condition: (j = 2 )  is met
  #c := c_1_2 
  #label: 114
  ld    t0,-272(s0)
  mv  s3,t0
  j     .L99
#Things to do when IF condition: (j = 2 )  is Not met
.L98:
  #c := 0 
  #label: 115
  li    t0,0
  mv  s3,t0
#code after if (j = 2 ) 
.L99:
#code after if (j = 1 ) 
.L97:
#code after if (j = 0 ) 
.L95:
  j     .L93
#Things to do when IF condition: (i = 1 )  is Not met
.L92:
#IF condition: (i = 2 ) 
  #label: 116
  mv  t0,s1
  sd    t0,-104(s0)
  li    t0,2
  ld    t1,-104(s0)
  sub   t1,t1,t0
  seqz  t0,t1
#go to .L100 if condition not met
  beqz  t0,.L100
#Things to do when IF condition: (i = 2 )  is met
#IF condition: (j = 0 ) 
  #label: 117
  ld    t0,-384(s0)
  sd    t0,-104(s0)
  li    t0,0
  ld    t1,-104(s0)
  sub   t1,t1,t0
  seqz  t0,t1
#go to .L102 if condition not met
  beqz  t0,.L102
#Things to do when IF condition: (j = 0 )  is met
  #c := c_2_0 
  #label: 118
  ld    t0,-296(s0)
  mv  s3,t0
  j     .L103
#Things to do when IF condition: (j = 0 )  is Not met
.L102:
#IF condition: (j = 1 ) 
  #label: 119
  ld    t0,-384(s0)
  sd    t0,-104(s0)
  li    t0,1
  ld    t1,-104(s0)
  sub   t1,t1,t0
  seqz  t0,t1
#go to .L104 if condition not met
  beqz  t0,.L104
#Things to do when IF condition: (j = 1 )  is met
  #c := c_2_1 
  #label: 120
  ld    t0,-264(s0)
  mv  s3,t0
  j     .L105
#Things to do when IF condition: (j = 1 )  is Not met
.L104:
#IF condition: (j = 2 ) 
  #label: 121
  ld    t0,-384(s0)
  sd    t0,-104(s0)
  li    t0,2
  ld    t1,-104(s0)
  sub   t1,t1,t0
  seqz  t0,t1
#go to .L106 if condition not met
  beqz  t0,.L106
#Things to do when IF condition: (j = 2 )  is met
  #c := c_2_2 
  #label: 122
  ld    t0,-232(s0)
  mv  s3,t0
  j     .L107
#Things to do when IF condition: (j = 2 )  is Not met
.L106:
  #c := 0 
  #label: 123
  li    t0,0
  mv  s3,t0
#code after if (j = 2 ) 
.L107:
#code after if (j = 1 ) 
.L105:
#code after if (j = 0 ) 
.L103:
  j     .L101
#Things to do when IF condition: (i = 2 )  is Not met
.L100:
  #c := 0 
  #label: 124
  li    t0,0
  mv  s3,t0
#code after if (i = 2 ) 
.L101:
#code after if (i = 1 ) 
.L93:
#code after if (i = 0 ) 
.L85:
  #t := (t + c ) 
  #label: 125
  mv  t0,s2
  sd    t0,-104(s0)
  mv  t0,s3
  ld    t1,-104(s0)
  add   t0,t0,t1
  mv  s2,t0
  #j := (j + 1 ) 
  #label: 126
  ld    t0,-384(s0)
  sd    t0,-104(s0)
  li    t0,1
  ld    t1,-104(s0)
  add   t0,t0,t1
  sd    t0,-384(s0)
#while condition: (j Less 3 ) 
  #label: 99
.L82:
  ld    t0,-384(s0)
  sd    t0,-104(s0)
  li    t0,3
  ld    t1,-104(s0)
  sub   t1,t0,t1
  sgtz  t0,t1
  bnez  t0,.L83
#code for while condition (j Less 3 )  not met: 
  #i := (i + 1 ) 
  #label: 127
  mv  t0,s1
  sd    t0,-104(s0)
  li    t0,1
  ld    t1,-104(s0)
  add   t0,t0,t1
  mv  s1,t0
#while condition: (i Less 3 ) 
  #label: 97
.L80:
  mv  t0,s1
  sd    t0,-104(s0)
  li    t0,3
  ld    t1,-104(s0)
  sub   t1,t0,t1
  sgtz  t0,t1
  bnez  t0,.L81
#code for while condition (i Less 3 )  not met: 
  #output := t 
  #label: 128
  mv  t0,s2
  mv  s1,t0
nop
nop
nop
  sd    s1,-200(s0)
  sd    s4,-216(s0)
  sd    s5,-192(s0)
  sd    s6,-152(s0)
  sd    s7,-288(s0)
  sd    s8,-280(s0)
  sd    s9,-352(s0)
  sd    s10,-360(s0)
  sd    s11,-328(s0)
  ld    a0,-424(s0)
  ld    t0,-352(s0)
  sd    t0,0(a0)
  ld    t0,-128(s0)
  sd    t0,8(a0)
  ld    t0,-168(s0)
  sd    t0,16(a0)
  ld    t0,-192(s0)
  sd    t0,24(a0)
  ld    t0,-160(s0)
  sd    t0,32(a0)
  ld    t0,-184(s0)
  sd    t0,40(a0)
  ld    t0,-144(s0)
  sd    t0,48(a0)
  ld    t0,-176(s0)
  sd    t0,56(a0)
  ld    t0,-136(s0)
  sd    t0,64(a0)
  ld    t0,-152(s0)
  sd    t0,72(a0)
  ld    t0,-360(s0)
  sd    t0,80(a0)
  ld    t0,-208(s0)
  sd    t0,88(a0)
  ld    t0,-224(s0)
  sd    t0,96(a0)
  ld    t0,-256(s0)
  sd    t0,104(a0)
  ld    t0,-216(s0)
  sd    t0,112(a0)
  ld    t0,-248(s0)
  sd    t0,120(a0)
  ld    t0,-288(s0)
  sd    t0,128(a0)
  ld    t0,-240(s0)
  sd    t0,136(a0)
  ld    t0,-280(s0)
  sd    t0,144(a0)
  ld    t0,-320(s0)
  sd    t0,152(a0)
  ld    t0,-368(s0)
  sd    t0,160(a0)
  ld    t0,-344(s0)
  sd    t0,168(a0)
  ld    t0,-336(s0)
  sd    t0,176(a0)
  ld    t0,-312(s0)
  sd    t0,184(a0)
  ld    t0,-328(s0)
  sd    t0,192(a0)
  ld    t0,-304(s0)
  sd    t0,200(a0)
  ld    t0,-272(s0)
  sd    t0,208(a0)
  ld    t0,-296(s0)
  sd    t0,216(a0)
  ld    t0,-264(s0)
  sd    t0,224(a0)
  ld    t0,-232(s0)
  sd    t0,232(a0)
  ld    t0,-376(s0)
  sd    t0,240(a0)
  ld    t0,-384(s0)
  sd    t0,248(a0)
  ld    t0,-392(s0)
  sd    t0,256(a0)
  ld    t0,-200(s0)
  sd    t0,264(a0)
  ld    t0,-400(s0)
  sd    t0,272(a0)
  ld    t0,-408(s0)
  sd    t0,280(a0)
nop
  ld    s3,376(sp)
  ld    s4,368(sp)
  ld    s5,360(sp)
  ld    s11,352(sp)
  ld    s6,344(sp)
  ld    s10,336(sp)
  ld    s7,328(sp)
  ld    s8,320(sp)
  ld    s9,312(sp)
  ld    s0,304(sp)
  ld    s1,296(sp)
  ld    s2,288(sp)
  addi  sp,sp,384
jr  ra
    .size   example33, .-example33
    .ident "GCC: (GNU) 9.0.1 20190123 (Red Hat 9.0.1-0.1)"
    .section        .note.GNU-stack,"",@progbits

