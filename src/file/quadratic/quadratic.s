    .file   "quadratic.c"
    .option nopic
    .text
    .align 1
    .global quadratic
    .type quadratic, @function
quadratic:

  addi  sp,sp,-232
  sd    s0,224(sp)
  addi  s0,sp,232
  sd    a0,-184(s0)
  ld    a0,-184(s0)
  ld    t0,0(a0)
  sd    t0,-56(s0)
  ld    t0,8(a0)
  sd    t0,-64(s0)
  ld    t0,16(a0)
  sd    t0,-72(s0)
  ld    t0,24(a0)
  sd    t0,-120(s0)
  ld    t0,32(a0)
  sd    t0,-144(s0)
  ld    t0,40(a0)
  sd    t0,-136(s0)
  ld    t0,48(a0)
  sd    t0,-104(s0)
  ld    t0,56(a0)
  sd    t0,-112(s0)
  ld    t0,64(a0)
  sd    t0,-80(s0)
  ld    t0,72(a0)
  sd    t0,-88(s0)
  ld    t0,80(a0)
  sd    t0,-128(s0)
  ld    t0,88(a0)
  sd    t0,-168(s0)
  ld    t0,96(a0)
  sd    t0,-48(s0)
  ld    t0,104(a0)
  sd    t0,-160(s0)
  ld    t0,112(a0)
  sd    t0,-96(s0)
  ld    t0,120(a0)
  sd    t0,-152(s0)
nop
nop
nop
  #discriminant := ((b * b ) - (4 * (a * c ) ) ) 
  ld    t0,-64(s0)
  sd    t0,-16(s0)
  ld    t0,-64(s0)
  ld    t1,-16(s0)
  mul   t0,t0,t1
  sd    t0,-16(s0)
  li    t0,4
  sd    t0,-24(s0)
  ld    t0,-56(s0)
  sd    t0,-32(s0)
  ld    t0,-72(s0)
  ld    t1,-32(s0)
  mul   t0,t0,t1
  ld    t1,-24(s0)
  mul   t0,t0,t1
  ld    t1,-16(s0)
  sub   t0,t1,t0
  sd    t0,-144(s0)
#IF condition: (discriminant Less 0 ) 
  ld    t0,-144(s0)
  sd    t0,-16(s0)
  li    t0,0
  ld    t1,-16(s0)
  sub   t1,t0,t1
  sgtz  t0,t1
#go to .L2 if condition not met
  beqz  t0,.L2
#Things to do when IF condition: (discriminant Less 0 )  is met
  #roots := 0 
  li    t0,0
  sd    t0,-96(s0)
  j     .L3
#Things to do when IF condition: (discriminant Less 0 )  is Not met
.L2:
#IF condition: (discriminant = 0 ) 
  ld    t0,-144(s0)
  sd    t0,-16(s0)
  li    t0,0
  ld    t1,-16(s0)
  sub   t1,t1,t0
  seqz  t0,t1
#go to .L4 if condition not met
  beqz  t0,.L4
#Things to do when IF condition: (discriminant = 0 )  is met
  #roots := 1 
  li    t0,1
  sd    t0,-96(s0)
  #sqrt_discriminant := 0 
  li    t0,0
  sd    t0,-152(s0)
  j     .L5
#Things to do when IF condition: (discriminant = 0 )  is Not met
.L4:
  #roots := 2 
  li    t0,2
  sd    t0,-96(s0)
  #n := 50 
  li    t0,50
  sd    t0,-112(s0)
  #last_guess := 0 
  li    t0,0
  sd    t0,-104(s0)
  #guess := 1 
  li    t0,1
  sd    t0,-136(s0)
  j     .L6
#code for while condition ((n Gre 0 ) And (Not((last_guess = guess ) ) ) )  met: 
.L7:
  #last_guess := guess 
  ld    t0,-136(s0)
  sd    t0,-104(s0)
  #quotient := 0 
  li    t0,0
  sd    t0,-128(s0)
  #remainder := discriminant 
  ld    t0,-144(s0)
  sd    t0,-160(s0)
  j     .L8
#code for while condition (remainder Gre= guess )  met: 
.L9:
  #quotient := (quotient + 1 ) 
  ld    t0,-128(s0)
  sd    t0,-16(s0)
  li    t0,1
  ld    t1,-16(s0)
  add   t0,t0,t1
  sd    t0,-128(s0)
  #remainder := (remainder - guess ) 
  ld    t0,-160(s0)
  sd    t0,-16(s0)
  ld    t0,-136(s0)
  ld    t1,-16(s0)
  sub   t0,t1,t0
  sd    t0,-160(s0)
#while condition: (remainder Gre= guess ) 
.L8:
  ld    t0,-160(s0)
  sd    t0,-16(s0)
  ld    t0,-136(s0)
  ld    t1,-16(s0)
  sub   t1,t0,t1
  sgtz  t0,t1
  xori  t0,t0,1
  bnez  t0,.L9
#code for while condition (remainder Gre= guess )  not met: 
  #remainder := (guess + quotient ) 
  ld    t0,-136(s0)
  sd    t0,-16(s0)
  ld    t0,-128(s0)
  ld    t1,-16(s0)
  add   t0,t0,t1
  sd    t0,-160(s0)
  #quotient := 0 
  li    t0,0
  sd    t0,-128(s0)
  j     .L10
#code for while condition (remainder Gre= 2 )  met: 
.L11:
  #quotient := (quotient + 1 ) 
  ld    t0,-128(s0)
  sd    t0,-16(s0)
  li    t0,1
  ld    t1,-16(s0)
  add   t0,t0,t1
  sd    t0,-128(s0)
  #remainder := (remainder - 2 ) 
  ld    t0,-160(s0)
  sd    t0,-16(s0)
  li    t0,2
  ld    t1,-16(s0)
  sub   t0,t1,t0
  sd    t0,-160(s0)
#while condition: (remainder Gre= 2 ) 
.L10:
  ld    t0,-160(s0)
  sd    t0,-16(s0)
  li    t0,2
  ld    t1,-16(s0)
  sub   t1,t0,t1
  sgtz  t0,t1
  xori  t0,t0,1
  bnez  t0,.L11
#code for while condition (remainder Gre= 2 )  not met: 
  #guess := quotient 
  ld    t0,-128(s0)
  sd    t0,-136(s0)
#while condition: ((n Gre 0 ) And (Not((last_guess = guess ) ) ) ) 
.L6:
  ld    t0,-112(s0)
  sd    t0,-16(s0)
  li    t0,0
  ld    t1,-16(s0)
  sub   t1,t1,t0
  sgtz  t0,t1
  sd    t0,-16(s0)
  ld    t0,-104(s0)
  sd    t0,-24(s0)
  ld    t0,-136(s0)
  ld    t1,-24(s0)
  sub   t1,t1,t0
  seqz  t0,t1
  sd    t0,-24(s0)
  ld    t1,-24(s0)
  xori  t0,t1,1
  ld    t1,-16(s0)
  mul   t0,t0,t1
  bnez  t0,.L7
#code for while condition ((n Gre 0 ) And (Not((last_guess = guess ) ) ) )  not met: 
  #sqrt_discriminant := guess 
  ld    t0,-136(s0)
  sd    t0,-152(s0)
#code after if (discriminant = 0 ) 
.L5:
  #denominator := (2 * a ) 
  li    t0,2
  sd    t0,-16(s0)
  ld    t0,-56(s0)
  ld    t1,-16(s0)
  mul   t0,t0,t1
  sd    t0,-120(s0)
  #numerator1 := ((0 - b ) - sqrt_discriminant ) 
  li    t0,0
  sd    t0,-16(s0)
  ld    t0,-64(s0)
  ld    t1,-16(s0)
  sub   t0,t1,t0
  sd    t0,-16(s0)
  ld    t0,-152(s0)
  ld    t1,-16(s0)
  sub   t0,t1,t0
  sd    t0,-80(s0)
  #r1 := 0 
  li    t0,0
  sd    t0,-168(s0)
  j     .L12
#code for while condition (numerator1 Gre= denominator )  met: 
.L13:
  #r1 := (r1 + 1 ) 
  ld    t0,-168(s0)
  sd    t0,-16(s0)
  li    t0,1
  ld    t1,-16(s0)
  add   t0,t0,t1
  sd    t0,-168(s0)
  #numerator1 := (numerator1 - denominator ) 
  ld    t0,-80(s0)
  sd    t0,-16(s0)
  ld    t0,-120(s0)
  ld    t1,-16(s0)
  sub   t0,t1,t0
  sd    t0,-80(s0)
#while condition: (numerator1 Gre= denominator ) 
.L12:
  ld    t0,-80(s0)
  sd    t0,-16(s0)
  ld    t0,-120(s0)
  ld    t1,-16(s0)
  sub   t1,t0,t1
  sgtz  t0,t1
  xori  t0,t0,1
  bnez  t0,.L13
#code for while condition (numerator1 Gre= denominator )  not met: 
  j     .L14
#code for while condition (numerator1 Less= (0 - denominator ) )  met: 
.L15:
  #r1 := (r1 - 1 ) 
  ld    t0,-168(s0)
  sd    t0,-16(s0)
  li    t0,1
  ld    t1,-16(s0)
  sub   t0,t1,t0
  sd    t0,-168(s0)
  #numerator1 := (numerator1 + denominator ) 
  ld    t0,-80(s0)
  sd    t0,-16(s0)
  ld    t0,-120(s0)
  ld    t1,-16(s0)
  add   t0,t0,t1
  sd    t0,-80(s0)
#while condition: (numerator1 Less= (0 - denominator ) ) 
.L14:
  ld    t0,-80(s0)
  sd    t0,-16(s0)
  li    t0,0
  sd    t0,-24(s0)
  ld    t0,-120(s0)
  ld    t1,-24(s0)
  sub   t0,t1,t0
  ld    t1,-16(s0)
  sub   t1,t1,t0
  sgtz  t0,t1
  xori  t0,t0,1
  bnez  t0,.L15
#code for while condition (numerator1 Less= (0 - denominator ) )  not met: 
#IF condition: (roots Gre 1 ) 
  ld    t0,-96(s0)
  sd    t0,-16(s0)
  li    t0,1
  ld    t1,-16(s0)
  sub   t1,t1,t0
  sgtz  t0,t1
#go to .L16 if condition not met
  beqz  t0,.L16
#Things to do when IF condition: (roots Gre 1 )  is met
  #numerator2 := ((0 - b ) + sqrt_discriminant ) 
  li    t0,0
  sd    t0,-16(s0)
  ld    t0,-64(s0)
  ld    t1,-16(s0)
  sub   t0,t1,t0
  sd    t0,-16(s0)
  ld    t0,-152(s0)
  ld    t1,-16(s0)
  add   t0,t0,t1
  sd    t0,-88(s0)
  #r2 := 0 
  li    t0,0
  sd    t0,-48(s0)
  j     .L18
#code for while condition (numerator2 Gre= denominator )  met: 
.L19:
  #r2 := (r2 + 1 ) 
  ld    t0,-48(s0)
  sd    t0,-16(s0)
  li    t0,1
  ld    t1,-16(s0)
  add   t0,t0,t1
  sd    t0,-48(s0)
  #numerator2 := (numerator2 - denominator ) 
  ld    t0,-88(s0)
  sd    t0,-16(s0)
  ld    t0,-120(s0)
  ld    t1,-16(s0)
  sub   t0,t1,t0
  sd    t0,-88(s0)
#while condition: (numerator2 Gre= denominator ) 
.L18:
  ld    t0,-88(s0)
  sd    t0,-16(s0)
  ld    t0,-120(s0)
  ld    t1,-16(s0)
  sub   t1,t0,t1
  sgtz  t0,t1
  xori  t0,t0,1
  bnez  t0,.L19
#code for while condition (numerator2 Gre= denominator )  not met: 
  j     .L20
#code for while condition (numerator2 Less= (0 - denominator ) )  met: 
.L21:
  #r2 := (r2 - 1 ) 
  ld    t0,-48(s0)
  sd    t0,-16(s0)
  li    t0,1
  ld    t1,-16(s0)
  sub   t0,t1,t0
  sd    t0,-48(s0)
  #numerator2 := (numerator2 + denominator ) 
  ld    t0,-88(s0)
  sd    t0,-16(s0)
  ld    t0,-120(s0)
  ld    t1,-16(s0)
  add   t0,t0,t1
  sd    t0,-88(s0)
#while condition: (numerator2 Less= (0 - denominator ) ) 
.L20:
  ld    t0,-88(s0)
  sd    t0,-16(s0)
  li    t0,0
  sd    t0,-24(s0)
  ld    t0,-120(s0)
  ld    t1,-24(s0)
  sub   t0,t1,t0
  ld    t1,-16(s0)
  sub   t1,t1,t0
  sgtz  t0,t1
  xori  t0,t0,1
  bnez  t0,.L21
#code for while condition (numerator2 Less= (0 - denominator ) )  not met: 
  j     .L17
#Things to do when IF condition: (roots Gre 1 )  is Not met
.L16:
nop
#code after if (roots Gre 1 ) 
.L17:
#code after if (discriminant Less 0 ) 
.L3:
nop
nop
nop
  ld    a0,-184(s0)
  ld    t0,-56(s0)
  sd    t0,0(a0)
  ld    t0,-64(s0)
  sd    t0,8(a0)
  ld    t0,-72(s0)
  sd    t0,16(a0)
  ld    t0,-120(s0)
  sd    t0,24(a0)
  ld    t0,-144(s0)
  sd    t0,32(a0)
  ld    t0,-136(s0)
  sd    t0,40(a0)
  ld    t0,-104(s0)
  sd    t0,48(a0)
  ld    t0,-112(s0)
  sd    t0,56(a0)
  ld    t0,-80(s0)
  sd    t0,64(a0)
  ld    t0,-88(s0)
  sd    t0,72(a0)
  ld    t0,-128(s0)
  sd    t0,80(a0)
  ld    t0,-168(s0)
  sd    t0,88(a0)
  ld    t0,-48(s0)
  sd    t0,96(a0)
  ld    t0,-160(s0)
  sd    t0,104(a0)
  ld    t0,-96(s0)
  sd    t0,112(a0)
  ld    t0,-152(s0)
  sd    t0,120(a0)
nop
  ld    s0,224(sp)
  addi  sp,sp,232
jr  ra
    .size   quadratic, .-quadratic
    .ident "GCC: (GNU) 9.0.1 20190123 (Red Hat 9.0.1-0.1)"
    .section        .note.GNU-stack,"",@progbits

