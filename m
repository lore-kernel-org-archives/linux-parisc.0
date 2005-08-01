From: Carlos O'Donell <carlos@systemhalted.org>
Subject: Re: [parisc-linux] pa_memcpy kernel crashing testcase == "glibc +nptl
	+testsuite", and some tests.
Date: Mon, 1 Aug 2005 12:42:54 -0400
Message-ID: <20050801164250.GX9703@systemhalted.org>
References: <20050801151506.GW9703@systemhalted.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050801151506.GW9703@systemhalted.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

parisc,

Another crash. Remember in the compat case that the source and destination
addresses may have sr's both set to zero since you are copying into a 
temporary kernel structure.

Backtrace:
 [<0000000010325ef4>] copy_to_user+0x34/0x40
 [<00000000101711dc>] sys_timer_create+0x294/0x8c8
 [<00000000101836f4>] compat_sys_timer_create+0x74/0xa8
 [<0000000010107f8c>] syscall_exit+0x0/0x14


Kernel Fault: Code=15 regs=0000000058fa0480 (Addr=00000000bffd6b48)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00001000000001001111111100001111 Not tainted
r00-03  0000000000000000 0000000010669a08 0000000010325ef4 0000000000000000
r04-07  00000000106d3ac0 0000000058f76e80 0000000000000000 00000000bffd6b48
r08-11  0000000058fa0190 0000000000000001 00000000000e8608 0000000000000000
r12-15  00000000000e8648 00000000000e88e8 00000000000aa000 00000000000eac08
r16-19  00000000000ecc08 00000000000e8648 0000000000000000 0000000000000000
r20-23  0000000058fa0000 0000000058fa0280 0000000058fa0281 00000000bffd6b48
r24-27  0000000000000004 0000000058fa0280 00000000bffd6b48 00000000106d3ac0
r28-31  0000000000000000 00000000bffd6b48 0000000058fa0480 0000000000000004
sr0-3   0000000000ae3800 0000000000000000 0000000000000000 0000000000ae3800
sr4-7   0000000000000000 0000000000000000 0000000000000000 0000000000000000

      VZOUICununcqcqcqcqcqcrmunTDVZOUI
FPSR: 00000000000000000000000000000000
FPER1: 00000000 
fr00-03  0000000000000000 0000000000000000 0000000000000000 0000000000000000
fr04-07  00000000101f3d2c 00000000107575f8 0000000012603c18 0000000000000000
fr08-11  00000000106d3ac0 0000000000000002 00000000106d3ac0 0000000000000802
fr12-15  0000000010199b48 0000000000000020 00000000101c7cd4 00000000125ae000
fr16-19  00000000125ae000 0000000000000000 00000000106d3ac0 000f41fa2f8c1980
fr20-23  0000000000000020 00000000101c7cd4 0000000065378f74 000dae5bffe932bc
fr24-27  00000000001fec2c 3fe0000000000000 412e848000000000 00000000106d3ac0
fr28-31  000000006f8b3dc8 000000000000000b 0000000000000020 0000000000000043
  
IASQ: 0000000000000000 0000000000000000 IAOQ: 0000000010325bd8 0000000010325bdc
 IIR: 0fb39222    ISR: 0000000000000000  IOR: 00000000bffd6b48
 CPU:        0   CR30: 0000000058fa0000 CR31: 0000000010694000
 ORIG_R28: 00000000107733e0     
 IAOQ[0]: pa_memcpy+0x118/0x2d0 
 IAOQ[1]: pa_memcpy+0x11c/0x2d0 
 RP(r2): copy_to_user+0x34/0x40 
Kernel panic - not syncing: Kernel Fault
 <0>Rebooting in 180 seconds..  


For the interested parties, here is a disassembly of pa_memcpy:


0000000010325ac0 <pa_memcpy>:
    10325ac0:	0f c2 12 c1 	std rp,-10(,sp)
    10325ac4:	37 de 01 00 	ldo 80(sp),sp
    10325ac8:	73 c8 3f 41 	std r8,-60(sp)
    10325acc:	73 c6 3f 51 	std r6,-58(sp)
    10325ad0:	73 c5 3f 61 	std r5,-50(sp)
    10325ad4:	73 c4 3f 71 	std r4,-48(sp)
    10325ad8:	73 c3 3f 81 	std r3,-40(sp)
    10325adc:	08 18 02 5f 	copy r24,r31
    10325ae0:	08 1a 02 57 	copy r26,r23
    10325ae4:	08 19 02 55 	copy r25,r21
    10325ae8:	08 19 02 56 	copy r25,r22
    10325aec:	ef 1e 81 b0 	cmpib,*>>= f,r24,10325bcc <pa_memcpy+0x10c>
    10325af0:	08 1a 02 5d 	copy r26,ret1
    10325af4:	0b 59 02 b4 	xor r25,r26,r20
    10325af8:	da 93 0b fd 	extrd,u r20,63,3,r19
    10325afc:	ee 60 a2 72 	cmpib,*<>,n 0,r19,10325c3c <pa_memcpy+0x17c>
    10325b00:	db 34 0b fd 	extrd,u r25,63,3,r20
    10325b04:	ee 80 a1 fa 	cmpib,*<>,n 0,r20,10325c08 <pa_memcpy+0x148>
    10325b08:	08 16 02 57 	copy r22,r23
    10325b0c:	34 1a 00 3e 	ldi 1f,r26
    10325b10:	bf 1a 80 d8 	cmpb,*>>= r26,r24,10325b84 <pa_memcpy+0xc4>
    10325b14:	08 1d 02 59 	copy ret1,r25
    10325b18:	0e e8 50 b6 	ldw,ma 4(sr1,r23),r22
    10325b1c:	da d6 0b e0 	extrd,u r22,63,32,r22
    10325b20:	0e e8 50 b5 	ldw,ma 4(sr1,r23),r21
    10325b24:	da b5 0b e0 	extrd,u r21,63,32,r21
    10325b28:	0e e8 50 b4 	ldw,ma 4(sr1,r23),r20
    10325b2c:	da 94 0b e0 	extrd,u r20,63,32,r20
    10325b30:	0e e8 50 b3 	ldw,ma 4(sr1,r23),r19
    10325b34:	da 73 0b e0 	extrd,u r19,63,32,r19
    10325b38:	0f 36 92 a8 	stw,ma r22,4(sr2,r25)
    10325b3c:	0f 35 92 a8 	stw,ma r21,4(sr2,r25)
    10325b40:	0f 34 92 a8 	stw,ma r20,4(sr2,r25)
    10325b44:	0f 33 92 a8 	stw,ma r19,4(sr2,r25)
    10325b48:	0e e8 50 b6 	ldw,ma 4(sr1,r23),r22
    10325b4c:	da d6 0b e0 	extrd,u r22,63,32,r22
    10325b50:	0e e8 50 b5 	ldw,ma 4(sr1,r23),r21
    10325b54:	da b5 0b e0 	extrd,u r21,63,32,r21
    10325b58:	0e e8 50 b4 	ldw,ma 4(sr1,r23),r20
    10325b5c:	da 94 0b e0 	extrd,u r20,63,32,r20
    10325b60:	0e e8 50 b3 	ldw,ma 4(sr1,r23),r19
    10325b64:	da 73 0b e0 	extrd,u r19,63,32,r19
    10325b68:	0f 36 92 a8 	stw,ma r22,4(sr2,r25)
    10325b6c:	0f 35 92 a8 	stw,ma r21,4(sr2,r25)
    10325b70:	0f 34 92 a8 	stw,ma r20,4(sr2,r25)
    10325b74:	0f 33 92 a8 	stw,ma r19,4(sr2,r25)
    10325b78:	37 18 3f c1 	ldo -20(r24),r24
    10325b7c:	9f 1a 9f 2d 	cmpb,*<< r26,r24,10325b18 <pa_memcpy+0x58>
    10325b80:	08 00 02 40 	nop
    10325b84:	ef 1e 80 78 	cmpib,*>>= f,r24,10325bc8 <pa_memcpy+0x108>
    10325b88:	08 17 02 56 	copy r23,r22
    10325b8c:	0e e8 50 b6 	ldw,ma 4(sr1,r23),r22
    10325b90:	da d6 0b e0 	extrd,u r22,63,32,r22
    10325b94:	0e e8 50 b5 	ldw,ma 4(sr1,r23),r21
    10325b98:	da b5 0b e0 	extrd,u r21,63,32,r21
    10325b9c:	0e e8 50 b4 	ldw,ma 4(sr1,r23),r20
    10325ba0:	da 94 0b e0 	extrd,u r20,63,32,r20
    10325ba4:	0e e8 50 b3 	ldw,ma 4(sr1,r23),r19
    10325ba8:	da 73 0b e0 	extrd,u r19,63,32,r19
    10325bac:	0f 36 92 a8 	stw,ma r22,4(sr2,r25)
    10325bb0:	0f 35 92 a8 	stw,ma r21,4(sr2,r25)
    10325bb4:	0f 34 92 a8 	stw,ma r20,4(sr2,r25)
    10325bb8:	0f 33 92 a8 	stw,ma r19,4(sr2,r25)
    10325bbc:	37 18 3f e1 	ldo -10(r24),r24
    10325bc0:	ef 1e 1f 8d 	cmpib,*<< f,r24,10325b8c <pa_memcpy+0xcc>
    10325bc4:	08 17 02 56 	copy r23,r22
    10325bc8:	08 19 02 5d 	copy r25,ret1
    10325bcc:	ef 00 20 28 	cmpib,*= 0,r24,10325be8 <pa_memcpy+0x128>
    10325bd0:	34 1c 00 00 	ldi 0,ret0
    10325bd4:	0e c2 50 33 	ldb,ma 1(sr1,r22),r19
    10325bd8:	0f b3 92 22 	stb,ma r19,1(sr2,ret1)
    10325bdc:	37 18 3f ff 	ldo -1(r24),r24
    10325be0:	ef 00 bf dd 	cmpib,*<> 0,r24,10325bd4 <pa_memcpy+0x114>
    10325be4:	34 1c 00 00 	ldi 0,ret0
    10325be8:	53 c2 3e e1 	ldd -90(sp),rp
    10325bec:	53 c8 3f 41 	ldd -60(sp),r8
    10325bf0:	53 c6 3f 51 	ldd -58(sp),r6
    10325bf4:	53 c5 3f 61 	ldd -50(sp),r5
    10325bf8:	53 c4 3f 71 	ldd -48(sp),r4
    10325bfc:	53 c3 3f 81 	ldd -40(sp),r3
    10325c00:	e8 40 d0 00 	bve (rp)
    10325c04:	37 de 3f 01 	ldo -80(sp),sp
    10325c08:	96 94 00 10 	subi 8,r20,r20
    10325c0c:	0a 80 52 73 	or,*>= r0,r20,r19
    10325c10:	96 73 00 00 	subi 0,r19,r19
    10325c14:	0a 60 04 33 	sub r0,r19,r19
    10325c18:	ef 00 3d d5 	cmpib,*= 0,r24,10325b08 <pa_memcpy+0x48>
    10325c1c:	da 73 00 1f 	extrd,u r19,0,1,r19
    10325c20:	86 60 3d cd 	cmpib,= 0,r19,10325b0c <pa_memcpy+0x4c>
    10325c24:	08 16 02 57 	copy r22,r23
    10325c28:	0e c2 50 33 	ldb,ma 1(sr1,r22),r19
    10325c2c:	37 18 3f ff 	ldo -1(r24),r24
    10325c30:	0f b3 92 22 	stb,ma r19,1(sr2,ret1)
    10325c34:	e8 1f 1f a5 	b,l 10325c0c <pa_memcpy+0x14c>,r0
    10325c38:	36 94 3f ff 	ldo -1(r20),r20
    10325c3c:	da 93 0b fe 	extrd,u r20,63,2,r19
    10325c40:	ee 60 24 80 	cmpib,*= 0,r19,10325e88 <cda_ldw_exc+0xa0>
    10325c44:	db 53 0b fe 	extrd,u r26,63,2,r19
    10325c48:	ee 60 a4 20 	cmpib,*<> 0,r19,10325e60 <cda_ldw_exc+0x78>
    10325c4c:	96 74 00 08 	subi 4,r19,r20
    10325c50:	da b3 0b fe 	extrd,u r21,63,2,r19
    10325c54:	db 05 1b a2 	extrd,u r24,61,62,r5
    10325c58:	f2 73 10 63 	depd,z r19,60,61,r19
    10325c5c:	08 17 02 5c 	copy r23,ret0
    10325c60:	96 73 00 40 	subi 20,r19,r19
    10325c64:	34 04 00 00 	ldi 0,r4
    10325c68:	da 62 0f e0 	extrd,s r19,63,32,rp
    10325c6c:	34 01 00 00 	ldi 0,r1
    10325c70:	d8 b3 0b fe 	extrd,u r5,63,2,r19
    10325c74:	ee 66 00 e0 	cmpib,*<< 3,r19,10325cec <pa_memcpy+0x22c>
    10325c78:	f6 a0 04 1e 	depdi 0,63,2,r21
    10325c7c:	86 66 80 d2 	cmpib,<<,n 3,r19,10325cec <pa_memcpy+0x22c>
    10325c80:	e8 13 40 00 	blr r19,r0
    10325c84:	08 00 02 40 	nop
    10325c88:	e8 00 02 e8 	b,l 10325e04 <cda_ldw_exc+0x1c>,r0
    10325c8c:	08 00 02 40 	nop
    10325c90:	e8 00 03 20 	b,l 10325e28 <cda_ldw_exc+0x40>,r0
    10325c94:	08 00 02 40 	nop
    10325c98:	e8 00 00 10 	b,l 10325ca8 <pa_memcpy+0x1e8>,r0
    10325c9c:	08 00 02 40 	nop
    10325ca0:	e8 00 03 38 	b,l 10325e44 <cda_ldw_exc+0x5c>,r0
    10325ca4:	08 00 02 40 	nop
    10325ca8:	0e a0 50 93 	ldw 0(sr1,r21),r19
    10325cac:	da 66 0b e0 	extrd,u r19,63,32,r6
    10325cb0:	0e a8 50 94 	ldw 4(sr1,r21),r20
    10325cb4:	36 b5 3f f9 	ldo -4(r21),r21
    10325cb8:	da 84 0b e0 	extrd,u r20,63,32,r4
    10325cbc:	34 a5 00 04 	ldo 2(r5),r5
    10325cc0:	36 fc 3f e9 	ldo -c(r23),ret0
    10325cc4:	0e b8 50 94 	ldw c(sr1,r21),r20
    10325cc8:	da 81 0b e0 	extrd,u r20,63,32,r1
    10325ccc:	01 62 18 40 	mtsar rp
    10325cd0:	d0 86 00 13 	shrpw r6,r4,%sar,r19
    10325cd4:	da 73 0b e0 	extrd,u r19,63,32,r19
    10325cd8:	0f 93 92 98 	stw r19,c(sr2,ret0)
    10325cdc:	36 b5 00 20 	ldo 10(r21),r21
    10325ce0:	37 9c 00 20 	ldo 10(ret0),ret0
    10325ce4:	34 a5 3f f9 	ldo -4(r5),r5
    10325ce8:	ec a0 20 92 	cmpib,*=,n 0,r5,10325d38 <pa_memcpy+0x278>
    10325cec:	0e a0 50 94 	ldw 0(sr1,r21),r20
    10325cf0:	da 83 0b e0 	extrd,u r20,63,32,r3
    10325cf4:	01 62 18 40 	mtsar rp
    10325cf8:	d0 24 00 13 	shrpw r4,r1,%sar,r19
    10325cfc:	da 73 0b e0 	extrd,u r19,63,32,r19
    10325d00:	0f 93 92 80 	stw r19,0(sr2,ret0)
    10325d04:	0e a8 50 94 	ldw 4(sr1,r21),r20
    10325d08:	da 86 0b e0 	extrd,u r20,63,32,r6
    10325d0c:	01 62 18 40 	mtsar rp
    10325d10:	d0 61 00 13 	shrpw r1,r3,%sar,r19
    10325d14:	da 73 0b e0 	extrd,u r19,63,32,r19
    10325d18:	0f 93 92 88 	stw r19,4(sr2,ret0)
    10325d1c:	0e b0 50 94 	ldw 8(sr1,r21),r20
    10325d20:	da 84 0b e0 	extrd,u r20,63,32,r4
    10325d24:	01 62 18 40 	mtsar rp
    10325d28:	d0 c3 00 13 	shrpw r3,r6,%sar,r19
    10325d2c:	da 73 0b e0 	extrd,u r19,63,32,r19
    10325d30:	0f 93 92 90 	stw r19,8(sr2,ret0)
    10325d34:	e8 1f 1f 17 	b,l,n 10325cc4 <pa_memcpy+0x204>,r0
    10325d38:	01 62 18 40 	mtsar rp
    10325d3c:	d0 24 00 13 	shrpw r4,r1,%sar,r19
    10325d40:	da 73 0b e0 	extrd,u r19,63,32,r19
    10325d44:	0f 93 92 80 	stw r19,0(sr2,ret0)
    10325d48:	4b d4 3f 21 	ldw -70(sp),r20
    10325d4c:	4b d3 3f 21 	ldw -70(sp),r19
    10325d50:	8a 93 21 22 	cmpb,<>,n r19,r20,10325de8 <cda_ldw_exc>
    10325d54:	4b d4 3f 21 	ldw -70(sp),r20
    10325d58:	4b d3 3f 21 	ldw -70(sp),r19
    10325d5c:	8a 93 20 b8 	cmpb,<> r19,r20,10325dc0 <cda_stw_exc>
    10325d60:	08 18 02 53 	copy r24,r19
    10325d64:	4b d5 3f 21 	ldw -70(sp),r21
    10325d68:	db 18 0b fe 	extrd,u r24,63,2,r24
    10325d6c:	4b d4 3f 21 	ldw -70(sp),r20
    10325d70:	f6 60 04 1e 	depdi 0,63,2,r19
    10325d74:	0a 76 0a 36 	add,l r22,r19,r22
    10325d78:	8a b4 20 50 	cmpb,<> r20,r21,10325da8 <pmc_load_exc>
    10325d7c:	0a 7d 0a 3d 	add,l ret1,r19,ret1
    10325d80:	4b d4 3f 21 	ldw -70(sp),r20
    10325d84:	4b d3 3f 21 	ldw -70(sp),r19
    10325d88:	82 93 3c 7d 	cmpb,= r19,r20,10325bcc <pa_memcpy+0x10c>
    10325d8c:	08 00 02 40 	nop


c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
