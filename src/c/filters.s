	.text
	.file	"filters.c"
	.hidden	rnd                     # -- Begin function rnd
	.globl	rnd
	.type	rnd,@function
rnd:                                    # @rnd
	.param  	f32
	.result 	i32
	.local  	i32
# BB#0:
	i32.trunc_s/f32	$push6=, $0
	tee_local	$push5=, $1=, $pop6
	f32.convert_s/i32	$push0=, $pop5
	f32.sub 	$push1=, $0, $pop0
	f32.const	$push2=, 0x1p-1
	f32.ge  	$push3=, $pop1, $pop2
	i32.add 	$push4=, $pop3, $1
                                        # fallthrough-return: $pop4
	.endfunc
.Lfunc_end0:
	.size	rnd, .Lfunc_end0-rnd
                                        # -- End function
	.hidden	min                     # -- Begin function min
	.globl	min
	.type	min,@function
min:                                    # @min
	.param  	i32, i32, i32
	.result 	i32
# BB#0:
	i32.lt_u	$push0=, $0, $1
	i32.select	$push4=, $0, $1, $pop0
	tee_local	$push3=, $0=, $pop4
	i32.lt_u	$push1=, $0, $2
	i32.select	$push2=, $pop3, $2, $pop1
                                        # fallthrough-return: $pop2
	.endfunc
.Lfunc_end1:
	.size	min, .Lfunc_end1-min
                                        # -- End function
	.hidden	max                     # -- Begin function max
	.globl	max
	.type	max,@function
max:                                    # @max
	.param  	i32, i32, i32
	.result 	i32
# BB#0:
	i32.lt_u	$push0=, $0, $1
	i32.select	$push4=, $1, $0, $pop0
	tee_local	$push3=, $0=, $pop4
	i32.lt_u	$push1=, $0, $2
	i32.select	$push2=, $2, $pop3, $pop1
                                        # fallthrough-return: $pop2
	.endfunc
.Lfunc_end2:
	.size	max, .Lfunc_end2-max
                                        # -- End function
	.hidden	wasm_invert             # -- Begin function wasm_invert
	.globl	wasm_invert
	.type	wasm_invert,@function
wasm_invert:                            # @wasm_invert
	.param  	i32, i32, i32
	.local  	i32, i32
# BB#0:
	block   	
	i32.mul 	$push0=, $1, $2
	i32.const	$push12=, 2
	i32.shl 	$push11=, $pop0, $pop12
	tee_local	$push10=, $3=, $pop11
	i32.const	$push9=, 1
	i32.lt_s	$push1=, $pop10, $pop9
	br_if   	0, $pop1        # 0: down to label0
# BB#1:
	i32.const	$2=, 0
.LBB3_2:                                # =>This Inner Loop Header: Depth=1
	loop    	                # label1:
	i32.add 	$push26=, $0, $2
	tee_local	$push25=, $1=, $pop26
	i32.load8_u	$push2=, 0($1)
	i32.const	$push24=, -1
	i32.xor 	$push3=, $pop2, $pop24
	i32.store8	0($pop25), $pop3
	i32.const	$push23=, 1
	i32.add 	$push22=, $1, $pop23
	tee_local	$push21=, $4=, $pop22
	i32.load8_u	$push4=, 0($4)
	i32.const	$push20=, -1
	i32.xor 	$push5=, $pop4, $pop20
	i32.store8	0($pop21), $pop5
	i32.const	$push19=, 2
	i32.add 	$push18=, $1, $pop19
	tee_local	$push17=, $1=, $pop18
	i32.load8_u	$push6=, 0($1)
	i32.const	$push16=, -1
	i32.xor 	$push7=, $pop6, $pop16
	i32.store8	0($pop17), $pop7
	i32.const	$push15=, 4
	i32.add 	$push14=, $2, $pop15
	tee_local	$push13=, $2=, $pop14
	i32.lt_s	$push8=, $pop13, $3
	br_if   	0, $pop8        # 0: up to label1
.LBB3_3:
	end_loop
	end_block                       # label0:
                                        # fallthrough-return
	.endfunc
.Lfunc_end3:
	.size	wasm_invert, .Lfunc_end3-wasm_invert
                                        # -- End function
	.hidden	wasm_grayscale_averaging # -- Begin function wasm_grayscale_averaging
	.globl	wasm_grayscale_averaging
	.type	wasm_grayscale_averaging,@function
wasm_grayscale_averaging:               # @wasm_grayscale_averaging
	.param  	i32, i32, i32
	.local  	i32, i32, i32
# BB#0:
	block   	
	i32.mul 	$push0=, $1, $2
	i32.const	$push11=, 2
	i32.shl 	$push10=, $pop0, $pop11
	tee_local	$push9=, $3=, $pop10
	i32.const	$push8=, 1
	i32.lt_s	$push1=, $pop9, $pop8
	br_if   	0, $pop1        # 0: down to label2
# BB#1:
	i32.const	$2=, 0
.LBB4_2:                                # =>This Inner Loop Header: Depth=1
	loop    	                # label3:
	i32.add 	$push25=, $0, $2
	tee_local	$push24=, $1=, $pop25
	i32.const	$push23=, 1
	i32.add 	$push22=, $1, $pop23
	tee_local	$push21=, $4=, $pop22
	i32.load8_u	$push3=, 0($pop21)
	i32.load8_u	$push2=, 0($1)
	i32.add 	$push4=, $pop3, $pop2
	i32.const	$push20=, 2
	i32.add 	$push19=, $1, $pop20
	tee_local	$push18=, $5=, $pop19
	i32.load8_u	$push5=, 0($pop18)
	i32.add 	$push6=, $pop4, $pop5
	i32.const	$push17=, 3
	i32.div_u	$push16=, $pop6, $pop17
	tee_local	$push15=, $1=, $pop16
	i32.store8	0($pop24), $pop15
	i32.store8	0($4), $1
	i32.store8	0($5), $1
	i32.const	$push14=, 4
	i32.add 	$push13=, $2, $pop14
	tee_local	$push12=, $2=, $pop13
	i32.lt_s	$push7=, $pop12, $3
	br_if   	0, $pop7        # 0: up to label3
.LBB4_3:
	end_loop
	end_block                       # label2:
                                        # fallthrough-return
	.endfunc
.Lfunc_end4:
	.size	wasm_grayscale_averaging, .Lfunc_end4-wasm_grayscale_averaging
                                        # -- End function
	.hidden	wasm_grayscale_luminance # -- Begin function wasm_grayscale_luminance
	.globl	wasm_grayscale_luminance
	.type	wasm_grayscale_luminance,@function
wasm_grayscale_luminance:               # @wasm_grayscale_luminance
	.param  	i32, i32, i32
	.local  	i32, i32, i32
# BB#0:
	block   	
	i32.mul 	$push0=, $1, $2
	i32.const	$push17=, 2
	i32.shl 	$push16=, $pop0, $pop17
	tee_local	$push15=, $3=, $pop16
	i32.const	$push14=, 1
	i32.lt_s	$push1=, $pop15, $pop14
	br_if   	0, $pop1        # 0: down to label4
# BB#1:
	i32.const	$2=, 0
.LBB5_2:                                # =>This Inner Loop Header: Depth=1
	loop    	                # label5:
	i32.add 	$push33=, $0, $2
	tee_local	$push32=, $1=, $pop33
	i32.load8_u	$push2=, 0($1)
	f64.convert_u/i32	$push3=, $pop2
	f64.const	$push31=, 0x1.3333333333333p-2
	f64.mul 	$push4=, $pop3, $pop31
	i32.const	$push30=, 1
	i32.add 	$push29=, $1, $pop30
	tee_local	$push28=, $4=, $pop29
	i32.load8_u	$push5=, 0($pop28)
	f64.convert_u/i32	$push6=, $pop5
	f64.const	$push27=, 0x1.2e147ae147ae1p-1
	f64.mul 	$push7=, $pop6, $pop27
	f64.add 	$push8=, $pop4, $pop7
	i32.const	$push26=, 2
	i32.add 	$push25=, $1, $pop26
	tee_local	$push24=, $5=, $pop25
	i32.load8_u	$push9=, 0($pop24)
	f64.convert_u/i32	$push10=, $pop9
	f64.const	$push23=, 0x1.c28f5c28f5c29p-4
	f64.mul 	$push11=, $pop10, $pop23
	f64.add 	$push12=, $pop8, $pop11
	i32.trunc_u/f64	$push22=, $pop12
	tee_local	$push21=, $1=, $pop22
	i32.store8	0($pop32), $pop21
	i32.store8	0($4), $1
	i32.store8	0($5), $1
	i32.const	$push20=, 4
	i32.add 	$push19=, $2, $pop20
	tee_local	$push18=, $2=, $pop19
	i32.lt_s	$push13=, $pop18, $3
	br_if   	0, $pop13       # 0: up to label5
.LBB5_3:
	end_loop
	end_block                       # label4:
                                        # fallthrough-return
	.endfunc
.Lfunc_end5:
	.size	wasm_grayscale_luminance, .Lfunc_end5-wasm_grayscale_luminance
                                        # -- End function
	.hidden	wasm_grayscale_desaturation # -- Begin function wasm_grayscale_desaturation
	.globl	wasm_grayscale_desaturation
	.type	wasm_grayscale_desaturation,@function
wasm_grayscale_desaturation:            # @wasm_grayscale_desaturation
	.param  	i32, i32, i32
	.local  	i32, i32, i32, i32, i32, i32, i32
# BB#0:
	block   	
	i32.mul 	$push0=, $1, $2
	i32.const	$push11=, 2
	i32.shl 	$push10=, $pop0, $pop11
	tee_local	$push9=, $3=, $pop10
	i32.const	$push8=, 1
	i32.lt_s	$push1=, $pop9, $pop8
	br_if   	0, $pop1        # 0: down to label6
# BB#1:
	i32.const	$2=, 0
.LBB6_2:                                # =>This Inner Loop Header: Depth=1
	loop    	                # label7:
	i32.add 	$push37=, $0, $2
	tee_local	$push36=, $1=, $pop37
	i32.load8_u	$push35=, 0($1)
	tee_local	$push34=, $4=, $pop35
	i32.const	$push33=, 1
	i32.add 	$push32=, $1, $pop33
	tee_local	$push31=, $5=, $pop32
	i32.load8_u	$push30=, 0($pop31)
	tee_local	$push29=, $6=, $pop30
	i32.lt_u	$push28=, $4, $6
	tee_local	$push27=, $7=, $pop28
	i32.select	$push26=, $pop34, $pop29, $pop27
	tee_local	$push25=, $9=, $pop26
	i32.const	$push24=, 2
	i32.add 	$push23=, $1, $pop24
	tee_local	$push22=, $8=, $pop23
	i32.load8_u	$push21=, 0($pop22)
	tee_local	$push20=, $1=, $pop21
	i32.lt_u	$push4=, $9, $1
	i32.select	$push5=, $pop25, $pop20, $pop4
	i32.select	$push19=, $6, $4, $7
	tee_local	$push18=, $4=, $pop19
	i32.lt_u	$push2=, $4, $1
	i32.select	$push3=, $1, $pop18, $pop2
	i32.add 	$push6=, $pop5, $pop3
	i32.const	$push17=, 1
	i32.shr_u	$push16=, $pop6, $pop17
	tee_local	$push15=, $1=, $pop16
	i32.store8	0($pop36), $pop15
	i32.store8	0($5), $1
	i32.store8	0($8), $1
	i32.const	$push14=, 4
	i32.add 	$push13=, $2, $pop14
	tee_local	$push12=, $2=, $pop13
	i32.lt_s	$push7=, $pop12, $3
	br_if   	0, $pop7        # 0: up to label7
.LBB6_3:
	end_loop
	end_block                       # label6:
                                        # fallthrough-return
	.endfunc
.Lfunc_end6:
	.size	wasm_grayscale_desaturation, .Lfunc_end6-wasm_grayscale_desaturation
                                        # -- End function
	.hidden	wasm_grayscale_decomposition_min # -- Begin function wasm_grayscale_decomposition_min
	.globl	wasm_grayscale_decomposition_min
	.type	wasm_grayscale_decomposition_min,@function
wasm_grayscale_decomposition_min:       # @wasm_grayscale_decomposition_min
	.param  	i32, i32, i32
	.local  	i32, i32, i32, i32
# BB#0:
	block   	
	i32.mul 	$push0=, $1, $2
	i32.const	$push8=, 2
	i32.shl 	$push7=, $pop0, $pop8
	tee_local	$push6=, $3=, $pop7
	i32.const	$push5=, 1
	i32.lt_s	$push1=, $pop6, $pop5
	br_if   	0, $pop1        # 0: down to label8
# BB#1:
	i32.const	$2=, 0
.LBB7_2:                                # =>This Inner Loop Header: Depth=1
	loop    	                # label9:
	i32.add 	$push29=, $0, $2
	tee_local	$push28=, $1=, $pop29
	i32.load8_u	$push27=, 0($1)
	tee_local	$push26=, $4=, $pop27
	i32.const	$push25=, 1
	i32.add 	$push24=, $1, $pop25
	tee_local	$push23=, $5=, $pop24
	i32.load8_u	$push22=, 0($pop23)
	tee_local	$push21=, $6=, $pop22
	i32.lt_u	$push2=, $4, $6
	i32.select	$push20=, $pop26, $pop21, $pop2
	tee_local	$push19=, $4=, $pop20
	i32.const	$push18=, 2
	i32.add 	$push17=, $1, $pop18
	tee_local	$push16=, $6=, $pop17
	i32.load8_u	$push15=, 0($pop16)
	tee_local	$push14=, $1=, $pop15
	i32.lt_u	$push3=, $4, $1
	i32.select	$push13=, $pop19, $pop14, $pop3
	tee_local	$push12=, $1=, $pop13
	i32.store8	0($pop28), $pop12
	i32.store8	0($5), $1
	i32.store8	0($6), $1
	i32.const	$push11=, 4
	i32.add 	$push10=, $2, $pop11
	tee_local	$push9=, $2=, $pop10
	i32.lt_s	$push4=, $pop9, $3
	br_if   	0, $pop4        # 0: up to label9
.LBB7_3:
	end_loop
	end_block                       # label8:
                                        # fallthrough-return
	.endfunc
.Lfunc_end7:
	.size	wasm_grayscale_decomposition_min, .Lfunc_end7-wasm_grayscale_decomposition_min
                                        # -- End function
	.hidden	wasm_grayscale_decomposition_max # -- Begin function wasm_grayscale_decomposition_max
	.globl	wasm_grayscale_decomposition_max
	.type	wasm_grayscale_decomposition_max,@function
wasm_grayscale_decomposition_max:       # @wasm_grayscale_decomposition_max
	.param  	i32, i32, i32
	.local  	i32, i32, i32, i32, i32
# BB#0:
	block   	
	i32.mul 	$push0=, $1, $2
	i32.const	$push8=, 2
	i32.shl 	$push7=, $pop0, $pop8
	tee_local	$push6=, $3=, $pop7
	i32.const	$push5=, 1
	i32.lt_s	$push1=, $pop6, $pop5
	br_if   	0, $pop1        # 0: down to label10
# BB#1:
	i32.const	$2=, 0
.LBB8_2:                                # =>This Inner Loop Header: Depth=1
	loop    	                # label11:
	i32.add 	$push29=, $0, $2
	tee_local	$push28=, $1=, $pop29
	i32.const	$push27=, 2
	i32.add 	$push26=, $1, $pop27
	tee_local	$push25=, $6=, $pop26
	i32.load8_u	$push24=, 0($pop25)
	tee_local	$push23=, $7=, $pop24
	i32.const	$push22=, 1
	i32.add 	$push21=, $1, $pop22
	tee_local	$push20=, $4=, $pop21
	i32.load8_u	$push19=, 0($pop20)
	tee_local	$push18=, $5=, $pop19
	i32.load8_u	$push17=, 0($1)
	tee_local	$push16=, $1=, $pop17
	i32.lt_u	$push2=, $1, $5
	i32.select	$push15=, $pop18, $pop16, $pop2
	tee_local	$push14=, $1=, $pop15
	i32.lt_u	$push3=, $1, $7
	i32.select	$push13=, $pop23, $pop14, $pop3
	tee_local	$push12=, $1=, $pop13
	i32.store8	0($pop28), $pop12
	i32.store8	0($4), $1
	i32.store8	0($6), $1
	i32.const	$push11=, 4
	i32.add 	$push10=, $2, $pop11
	tee_local	$push9=, $2=, $pop10
	i32.lt_s	$push4=, $pop9, $3
	br_if   	0, $pop4        # 0: up to label11
.LBB8_3:
	end_loop
	end_block                       # label10:
                                        # fallthrough-return
	.endfunc
.Lfunc_end8:
	.size	wasm_grayscale_decomposition_max, .Lfunc_end8-wasm_grayscale_decomposition_max
                                        # -- End function
	.hidden	wasm_grayscale_dithering # -- Begin function wasm_grayscale_dithering
	.globl	wasm_grayscale_dithering
	.type	wasm_grayscale_dithering,@function
wasm_grayscale_dithering:               # @wasm_grayscale_dithering
	.param  	i32, i32, i32
	.local  	i32, i32, i32, i32, f32, i32, i32, i32, i32, i32
# BB#0:
	i32.mul 	$push0=, $1, $2
	i32.const	$push1=, 2
	i32.shl 	$3=, $pop0, $pop1
	i32.const	$11=, 0
.LBB9_1:                                # =>This Inner Loop Header: Depth=1
	loop    	                # label12:
	i32.add 	$push3=, $3, $11
	i32.const	$push28=, 3
	i32.div_u	$push2=, $11, $pop28
	i32.store8	0($pop3), $pop2
	i32.const	$push27=, 1
	i32.add 	$push26=, $11, $pop27
	tee_local	$push25=, $11=, $pop26
	i32.const	$push24=, 766
	i32.ne  	$push4=, $pop25, $pop24
	br_if   	0, $pop4        # 0: up to label12
# BB#2:
	end_loop
	block   	
	i32.const	$push29=, 1
	i32.lt_s	$push5=, $2, $pop29
	br_if   	0, $pop5        # 0: down to label13
# BB#3:
	i32.const	$push30=, 1
	i32.lt_s	$push6=, $1, $pop30
	br_if   	0, $pop6        # 0: down to label13
# BB#4:
	i32.const	$push7=, 2
	i32.shl 	$4=, $1, $pop7
	i32.const	$push31=, 2
	i32.add 	$9=, $0, $pop31
	i32.const	$10=, 0
.LBB9_5:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB9_6 Depth 2
	loop    	                # label14:
	copy_local	$11=, $9
	copy_local	$12=, $1
	i32.const	$0=, 0
.LBB9_6:                                #   Parent Loop BB9_5 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	loop    	                # label15:
	i32.const	$push61=, -2
	i32.add 	$push60=, $11, $pop61
	tee_local	$push59=, $8=, $pop60
	i32.const	$push58=, -1
	i32.const	$push57=, -1
	i32.add 	$push56=, $11, $pop57
	tee_local	$push55=, $5=, $pop56
	i32.load8_u	$push9=, 0($pop55)
	i32.load8_u	$push8=, 0($8)
	i32.add 	$push10=, $pop9, $pop8
	i32.load8_u	$push11=, 0($11)
	i32.add 	$push12=, $pop10, $pop11
	i32.add 	$push13=, $3, $pop12
	i32.load8_u	$push14=, 0($pop13)
	i32.add 	$push54=, $0, $pop14
	tee_local	$push53=, $6=, $pop54
	i32.const	$push52=, 17
	i32.div_s	$push15=, $pop53, $pop52
	f32.convert_s/i32	$push51=, $pop15
	tee_local	$push50=, $7=, $pop51
	i32.trunc_s/f32	$push49=, $7
	tee_local	$push48=, $0=, $pop49
	f32.convert_s/i32	$push16=, $pop48
	f32.sub 	$push17=, $pop50, $pop16
	f32.const	$push47=, 0x1p-1
	f32.ge  	$push18=, $pop17, $pop47
	i32.add 	$push19=, $pop18, $0
	i32.const	$push46=, 17
	i32.mul 	$push45=, $pop19, $pop46
	tee_local	$push44=, $8=, $pop45
	i32.const	$push43=, 8
	i32.add 	$push42=, $pop44, $pop43
	tee_local	$push41=, $0=, $pop42
	i32.const	$push40=, 0
	i32.const	$push39=, 0
	i32.gt_s	$push20=, $0, $pop39
	i32.select	$push21=, $pop41, $pop40, $pop20
	i32.const	$push38=, 247
	i32.gt_s	$push22=, $8, $pop38
	i32.select	$push37=, $pop58, $pop21, $pop22
	tee_local	$push36=, $8=, $pop37
	i32.store8	0($pop59), $pop36
	i32.store8	0($5), $8
	i32.store8	0($11), $8
	i32.sub 	$0=, $6, $0
	i32.const	$push35=, 4
	i32.add 	$11=, $11, $pop35
	i32.const	$push34=, -1
	i32.add 	$push33=, $12, $pop34
	tee_local	$push32=, $12=, $pop33
	br_if   	0, $pop32       # 0: up to label15
# BB#7:                                 #   in Loop: Header=BB9_5 Depth=1
	end_loop
	i32.add 	$9=, $9, $4
	i32.const	$push64=, 1
	i32.add 	$push63=, $10, $pop64
	tee_local	$push62=, $10=, $pop63
	i32.ne  	$push23=, $pop62, $2
	br_if   	0, $pop23       # 0: up to label14
.LBB9_8:
	end_loop
	end_block                       # label13:
                                        # fallthrough-return
	.endfunc
.Lfunc_end9:
	.size	wasm_grayscale_dithering, .Lfunc_end9-wasm_grayscale_dithering
                                        # -- End function
	.hidden	wasm_gaussian_blur      # -- Begin function wasm_gaussian_blur
	.globl	wasm_gaussian_blur
	.type	wasm_gaussian_blur,@function
wasm_gaussian_blur:                     # @wasm_gaussian_blur
	.param  	i32, i32, i32
	.local  	f32, i32, i32, i32, i32, i32, i32, i32, i32, i32, f32, i32, i32, i32, i32, f32, f32
# BB#0:
	block   	
	i32.const	$push37=, 1
	i32.lt_s	$push4=, $2, $pop37
	br_if   	0, $pop4        # 0: down to label16
# BB#1:
	i32.const	$push38=, 1
	i32.lt_s	$push7=, $1, $pop38
	br_if   	0, $pop7        # 0: down to label16
# BB#2:
	i32.const	$push1=, 0
	f32.load	$push44=, PI($pop1)
	tee_local	$push43=, $18=, $pop44
	f32.add 	$push2=, $pop43, $18
	f32.const	$push3=, 0x1p2
	f32.mul 	$3=, $pop2, $pop3
	i32.const	$push42=, 255
	i32.add 	$push5=, $2, $pop42
	i32.const	$push41=, 255
	i32.and 	$5=, $pop5, $pop41
	i32.const	$push40=, 255
	i32.add 	$push6=, $1, $pop40
	i32.const	$push39=, 255
	i32.and 	$4=, $pop6, $pop39
	i32.const	$14=, 0
.LBB10_3:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB10_4 Depth 2
                                        #       Child Loop BB10_5 Depth 3
                                        #         Child Loop BB10_6 Depth 4
	loop    	                # label17:
	i32.const	$push46=, 6
	i32.add 	$8=, $14, $pop46
	i32.mul 	$7=, $14, $1
	i32.const	$push45=, -6
	i32.add 	$6=, $14, $pop45
	i32.const	$15=, 0
.LBB10_4:                               #   Parent Loop BB10_3 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB10_5 Depth 3
                                        #         Child Loop BB10_6 Depth 4
	loop    	                # label18:
	i32.const	$push47=, 6
	i32.add 	$9=, $15, $pop47
	f32.const	$18=, 0x0p0
	copy_local	$16=, $6
	f32.const	$19=, 0x0p0
.LBB10_5:                               #   Parent Loop BB10_3 Depth=1
                                        #     Parent Loop BB10_4 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB10_6 Depth 4
	loop    	                # label19:
	i32.const	$push52=, 255
	i32.and 	$push51=, $16, $pop52
	tee_local	$push50=, $17=, $pop51
	i32.lt_u	$push8=, $5, $17
	i32.select	$push9=, $5, $pop50, $pop8
	i32.mul 	$11=, $pop9, $1
	i32.sub 	$push49=, $16, $14
	tee_local	$push48=, $17=, $pop49
	i32.mul 	$10=, $pop48, $17
	i32.const	$17=, 0
.LBB10_6:                               #   Parent Loop BB10_3 Depth=1
                                        #     Parent Loop BB10_4 Depth=2
                                        #       Parent Loop BB10_5 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	loop    	                # label20:
	i32.const	$push67=, -6
	i32.add 	$push66=, $17, $pop67
	tee_local	$push65=, $12=, $pop66
	i32.mul 	$push17=, $pop65, $12
	i32.add 	$push18=, $pop17, $10
	i32.const	$push64=, -4
	i32.div_s	$push19=, $pop18, $pop64
	f32.convert_s/i32	$push20=, $pop19
	f32.call	$push21=, js_exp@FUNCTION, $pop20
	f32.div 	$push63=, $pop21, $3
	tee_local	$push62=, $13=, $pop63
	i32.add 	$push10=, $15, $17
	i32.const	$push61=, -6
	i32.add 	$push11=, $pop10, $pop61
	i32.const	$push60=, 255
	i32.and 	$push59=, $pop11, $pop60
	tee_local	$push58=, $12=, $pop59
	i32.lt_u	$push12=, $4, $12
	i32.select	$push13=, $4, $pop58, $pop12
	i32.add 	$push14=, $pop13, $11
	i32.const	$push57=, 2
	i32.shl 	$push15=, $pop14, $pop57
	i32.add 	$push16=, $0, $pop15
	i32.load8_u	$push22=, 0($pop16)
	f32.convert_u/i32	$push23=, $pop22
	f32.mul 	$push24=, $pop62, $pop23
	f32.add 	$18=, $18, $pop24
	f32.add 	$19=, $19, $13
	i32.const	$push56=, 1
	i32.add 	$push55=, $17, $pop56
	tee_local	$push54=, $17=, $pop55
	i32.add 	$push25=, $15, $pop54
	i32.const	$push53=, -7
	i32.add 	$push26=, $pop25, $pop53
	i32.lt_s	$push27=, $pop26, $9
	br_if   	0, $pop27       # 0: up to label20
# BB#7:                                 #   in Loop: Header=BB10_5 Depth=3
	end_loop
	i32.lt_s	$17=, $16, $8
	i32.const	$push68=, 1
	i32.add 	$push0=, $16, $pop68
	copy_local	$16=, $pop0
	br_if   	0, $17          # 0: up to label19
# BB#8:                                 #   in Loop: Header=BB10_4 Depth=2
	end_loop
	i32.add 	$push32=, $15, $7
	i32.const	$push77=, 2
	i32.shl 	$push33=, $pop32, $pop77
	i32.add 	$push34=, $0, $pop33
	f32.div 	$push76=, $18, $19
	tee_local	$push75=, $18=, $pop76
	i32.trunc_s/f32	$push74=, $18
	tee_local	$push73=, $17=, $pop74
	f32.convert_s/i32	$push28=, $pop73
	f32.sub 	$push29=, $pop75, $pop28
	f32.const	$push72=, 0x1p-1
	f32.ge  	$push30=, $pop29, $pop72
	i32.add 	$push31=, $pop30, $17
	i32.store8	0($pop34), $pop31
	i32.const	$push71=, 1
	i32.add 	$push70=, $15, $pop71
	tee_local	$push69=, $15=, $pop70
	i32.ne  	$push35=, $pop69, $1
	br_if   	0, $pop35       # 0: up to label18
# BB#9:                                 #   in Loop: Header=BB10_3 Depth=1
	end_loop
	i32.const	$push80=, 1
	i32.add 	$push79=, $14, $pop80
	tee_local	$push78=, $14=, $pop79
	i32.ne  	$push36=, $pop78, $2
	br_if   	0, $pop36       # 0: up to label17
.LBB10_10:
	end_loop
	end_block                       # label16:
                                        # fallthrough-return
	.endfunc
.Lfunc_end10:
	.size	wasm_gaussian_blur, .Lfunc_end10-wasm_gaussian_blur
                                        # -- End function
	.hidden	PI                      # @PI
	.type	PI,@object
	.data
	.globl	PI
	.p2align	2
PI:
	.int32	1078530000              # float 3.14159012
	.size	PI, 4


	.ident	"clang version 6.0.0 (https://github.com/llvm-mirror/clang.git 9df566f7bbb4927b16ccc0e0770fa43a52eb759d) (https://github.com/llvm-mirror/llvm.git 22e4b9737b9aeda5a19ebe3e98fd91bbb3d76964)"
	.functype	js_exp, f32, f32
