From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] parisc: add CALLER_ADDR{0-6} macros
Date: Tue, 27 Oct 2009 14:41:46 +0100
Message-ID: <20091027134146.GA2223@p100.box>
References: <20091025214836.GA15038@p100.box> <4AE67BED.8040705@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: Randolph Chung <randolph@tausq.org>, linux-parisc@vger.kernel.org,
	Kyle McMartin <kyle@mcmartin.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4AE67BED.8040705@tausq.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

* Randolph Chung <randolph@tausq.org>:
>> +unsigned long return_address(unsigned int level)
>> +{
>> +	struct unwind_frame_info info;
>> +	struct pt_regs r;
>> +	unsigned long sp;
>> +
>> +	/* initialize unwind info */
>> +	asm volatile ("copy %%r30, %0" : "=r"(sp));
>> +	memset(&r, 0, sizeof(struct pt_regs));
>> +	r.iaoq[0] = (unsigned long) current_text_addr();
>> +	r.gr[2] = (unsigned long) __builtin_return_address(0);
>> +	r.gr[30] = sp;
>> +	unwind_frame_init(&info, current, &r);
>> +
>> +	/* unwind stack */
>> +	++level;
>> +	do {
>> +		if (unwind_once(&info) < 0 || info.ip == 0)
>> +			return 0;
>> +		if (!__kernel_text_address(info.ip)) {
>> +			return 0;
>> +		}
>> +	} while (info.ip && level--);
>> +
>> +	return info.ip;
>> +}
>> +
>
> Can you show an objdump of this function once it is compiled? I suspect  
> the stack pointer initialization here is not reliable.

> Ideally unwind_frame_init is called with the frame address in gr[30].  
> With a big struct like pt_regs on the stack, the sp initialization might  
> be quite far from the actual frame address.
>
> The unwind_once() code uses like heuristics to try to recover from  
> inaccurate stack pointers (by aligning and stepping the frame 64 bytes  
> at a time) but that is really a brute force guess.
>
> I realize I used a similar construct in traps.c, but even there I think  
> it doesn't work reliably.

Hi Randolph,

I agree, that those kind of implementations may not always be reliable.
Nevertheless, I started off with a copy of your code, but it didn't
worked at all. I assume due to some compiler-trickery to include the
static local functions in other functions it does work in traps.c 
nevertheless.

I did sucessfully tested the patch I submitted here, both in 32- and 64-bit.

Below is the disassembly of the code which you asked for...

Helge


Disassembly of section .text.return_address:

00000000 <return_address>:
   0:	08 03 02 41 	copy r3,r1
   4:	6b c2 3f d9 	stw rp,-14(sp)
   8:	08 1e 02 43 	copy sp,r3
   c:	6f c1 04 80 	stw,ma r1,240(sp)
  10:	68 67 04 00 	stw r7,200(r3)
  14:	08 02 02 47 	copy rp,r7
  18:	68 66 04 08 	stw r6,204(r3)
  1c:	08 1a 02 46 	copy r26,r6
  20:	68 65 04 10 	stw r5,208(r3)
  24:	68 64 04 18 	stw r4,20c(r3)
  28:	08 1e 02 44 	copy sp,r4
  2c:	34 65 00 50 	ldo 28(r3),r5
  30:	34 19 00 00 	ldi 0,r25
  34:	08 05 02 5a 	copy r5,r26
  38:	e8 40 00 00 	b,l 40 <return_address+0x40>,rp
  3c:	34 18 03 b0 	ldi 1d8,r24
  40:	68 67 00 60 	stw r7,30(r3)
  44:	eb 80 40 00 	blr r0,ret0
  48:	08 00 02 40 	nop
  4c:	68 64 01 40 	stw r4,a0(r3)
  50:	68 7c 03 a0 	stw ret0,1d0(r3)
  54:	03 c0 08 bc 	mfctl tr6,ret0
  58:	34 64 00 10 	ldo 8(r3),r4
  5c:	0f 80 10 99 	ldw 0(ret0),r25
  60:	08 04 02 5a 	copy r4,r26
  64:	e8 40 00 00 	b,l 6c <return_address+0x6c>,rp
  68:	08 05 02 58 	copy r5,r24
  6c:	08 04 02 5a 	copy r4,r26
  70:	e8 40 00 00 	b,l 78 <return_address+0x78>,rp
  74:	34 c6 00 02 	ldo 1(r6),r6
  78:	8f 80 60 80 	cmpib,> 0,ret0,c0 <return_address+0xc0>
  7c:	34 1c 00 00 	ldi 0,ret0
  80:	48 7c 00 20 	ldw 10(r3),ret0
  84:	87 80 20 68 	cmpib,= 0,ret0,c0 <return_address+0xc0>
  88:	08 1c 02 5a 	copy ret0,r26
  8c:	e8 40 00 00 	b,l 94 <return_address+0x94>,rp
  90:	08 00 02 40 	nop
  94:	87 80 20 40 	cmpib,= 0,ret0,bc <return_address+0xbc>
  98:	48 7c 00 20 	ldw 10(r3),ret0
  9c:	87 80 20 40 	cmpib,= 0,ret0,c4 <return_address+0xc4>
  a0:	48 62 3f d9 	ldw -14(r3),rp
  a4:	84 c0 20 30 	cmpib,= 0,r6,c4 <return_address+0xc4>
  a8:	08 04 02 5a 	copy r4,r26
  ac:	e8 40 00 00 	b,l b4 <return_address+0xb4>,rp
  b0:	34 c6 3f ff 	ldo -1(r6),r6
  b4:	87 80 7f 95 	cmpib,<= 0,ret0,84 <return_address+0x84>
  b8:	48 7c 00 20 	ldw 10(r3),ret0
  bc:	34 1c 00 00 	ldi 0,ret0
  c0:	48 62 3f d9 	ldw -14(r3),rp
  c4:	48 67 04 00 	ldw 200(r3),r7
  c8:	48 66 04 08 	ldw 204(r3),r6
  cc:	48 65 04 10 	ldw 208(r3),r5
  d0:	48 64 04 18 	ldw 20c(r3),r4
  d4:	34 7e 00 80 	ldo 40(r3),sp
  d8:	e8 40 c0 00 	bv r0(rp)
  dc:	4f c3 3f 81 	ldw,mb -40(sp),r3

