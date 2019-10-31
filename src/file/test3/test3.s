    .file   "test3.c"
    .option nopic
    .text
    .align 1
    .global test3
    .type test3, @function
test3:

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
  ld    t0,-64(s0)
  sd    t0,-80(s0)
  j     .L4
#code for while condition (false or (((Not(true ) ) or ((b Gre a ) And (c Less= a ) ) ) or ((a * 100 ) Gre= c ) ) )  met: 
.L5:
  #c := (c + 1 ) 
  ld    t0,-72(s0)
  sd    t0,-16(s0)
  li    t0,1
  ld    t1,-16(s0)
  add   t0,t0,t1
  sd    t0,-72(s0)
  #d := (d + 1 ) 
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
  ld    t0,-72(s0)
  sd    t0,-16(s0)
  li    t0,2
  ld    t1,-16(s0)
  mul   t0,t0,t1
  sd    t0,-72(s0)
  #d := (d - 500 ) 
  ld    t0,-80(s0)
  sd    t0,-16(s0)
  li    t0,500
  ld    t1,-16(s0)
  sub   t0,t1,t0
  sd    t0,-80(s0)
  #count := 2 
  li    t0,2
  sd    t0,-88(s0)
  j     .L8
#code for while condition (count Gre= 0 )  met: 
.L9:
  #a := (a + 2 ) 
  ld    t0,-56(s0)
  sd    t0,-16(s0)
  li    t0,2
  ld    t1,-16(s0)
  add   t0,t0,t1
  sd    t0,-56(s0)
  #count := (count - 1 ) 
  ld    t0,-88(s0)
  sd    t0,-16(s0)
  li    t0,1
  ld    t1,-16(s0)
  sub   t0,t1,t0
  sd    t0,-88(s0)
#while condition: (count Gre= 0 ) 
.L8:
  ld    t0,-88(s0)
  sd    t0,-16(s0)
  li    t0,0
  ld    t1,-16(s0)
  sub   t1,t0,t1
  sgtz  t0,t1
  xori  t0,t0,1
  bnez  t0,.L9
#code for while condition (count Gre= 0 )  not met: 
#while condition: (d Gre 0 ) 
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
  ld    t1,-16(s0)
  add   t0,t0,t1
  bnez  t0,.L5
#code for while condition (false or (((Not(true ) ) or ((b Gre a ) And (c Less= a ) ) ) or ((a * 100 ) Gre= c ) ) )  not met: 
  #a := (a - 1 ) 
  ld    t0,-56(s0)
  sd    t0,-16(s0)
  li    t0,1
  ld    t1,-16(s0)
  sub   t0,t1,t0
  sd    t0,-56(s0)
#while condition: (0 Less= a ) 
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
    .size   test3, .-test3
    .ident "GCC: (GNU) 9.0.1 20190123 (Red Hat 9.0.1-0.1)"
    .section        .note.GNU-stack,"",@progbits

