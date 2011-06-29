From: Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>
Subject: Re: [PATCH] fix backtrace on PA-RISC
Date: Wed, 29 Jun 2011 17:00:09 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1106291643090.6496@artax.karlin.mff.cuni.cz>
References: <20110629005931.23E974EDA@hiauly1.hia.nrc.ca> <alpine.DEB.2.00.1106291537330.30885@artax.karlin.mff.cuni.cz>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: jejb@parisc-linux.org, linux-parisc@vger.kernel.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.1106291537330.30885@artax.karlin.mff.cuni.cz>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org



On Wed, 29 Jun 2011, Mikulas Patocka wrote:

> 
> 
> On Tue, 28 Jun 2011, John David Anglin wrote:
> 
> > > @@ -305,18 +310,16 @@ static void unwind_frame_regs(struct unw
> > >  
> > >  			insn = *(unsigned int *)npc;
> > >  
> > > -			if ((insn & 0xffffc000) == 0x37de0000 ||
> > > -			    (insn & 0xffe00000) == 0x6fc00000) {
> > > +			if ((insn & 0xffffc001) == 0x37de0000 ||
> > > +			    (insn & 0xffe00001) == 0x6fc00000) {
> > >  				/* ldo X(sp), sp, or stwm X,D(sp) */
> > > -				frame_size += (insn & 0x1 ? -1 << 13 : 0) | 
> > > -					((insn & 0x3fff) >> 1);
> > > +				frame_size += (insn & 0x3fff) >> 1;
> > 
> > This doesn't look correct to me.  Look at the disassembly code
> > in binutils.  In wide mode, an extract_16 operation needs to be
> > used for ldo.  In non wide mode and for stwm, extract_14 needs
> > to be used.  extract_14 is a simple 14-bit extraction followed 
> > low sign extension.
> 
> Such large frame size is disallowed in the kernel anyway.
> 
> BTW. gcc doesn't use these 16-bit offsets.
> 
> > I believe the problem with the original code is that it doesn't
> > handle wide mode (64-bit kernels) for ldo.
> 
> 64-bit ldo is the same as 32-bit ldo if the offset is in <-0x2000;0x1fff>.
> 
> > >  				dbg("analyzing func @ %lx, insn=%08x @ "
> > >  				    "%lx, frame_size = %ld\n", info->ip,
> > >  				    insn, npc, frame_size);
> > > -			} else if ((insn & 0xffe00008) == 0x73c00008) {
> > > +			} else if ((insn & 0xffe00009) == 0x73c00008) {
> > >  				/* std,ma X,D(sp) */
> > > -				frame_size += (insn & 0x1 ? -1 << 13 : 0) | 
> > > -					(((insn >> 4) & 0x3ff) << 3);
> > > +				frame_size += ((insn >> 4) & 0x3ff) << 3;
> > 
> > I believe the original code is correct for this case.
> 
> If insn & 0x1 is true, the code, it does
> frame_size += (unsigned)((int)-1 | (unsigned)(((insn >> 4) & 0x3ff) << 3))
> 
> Due to unsigned->long conversion, it doesn't decrease frame_size, but it 
> adds 0x100000000-X to it. The result is a crash.
> 
> 
> See this:
> void g(void);
> 
> int f(int a)
> {
>         if (__builtin_expect(a, 1))
>                 return a;
>         g();
>         return a;
> }
> 
> If we optimize it with -O2, it gets translated into
> f:
>         .PROC
>         .CALLINFO FRAME=144,CALLS,SAVE_RP,ENTRY_GR=3
>         .ENTRY
>         std %r2,-16(%r30)
>         ldo 144(%r30),%r30
>         extrd,s %r26,63,32,%r28
>         cmpb,*= %r0,%r28,.L4
>         std %r4,-128(%r30)
> .L2:
>         ldd -160(%r30),%r2
>         ldd -128(%r30),%r4
>         bve (%r2)
>         ldo -144(%r30),%r30
> .L4:
>         ldo -48(%r30),%r29
>         b,l g,%r2
>         std %r28,-136(%r30)
>         b .L2
>         ldd -136(%r30),%r28
>         .EXIT
>         .PROCEND
>         .size   f, .-f
> 
> Now, if we are getting stack trace from "g" function, the code scanner 
> sees both
>         ldo 144(%r30),%r30
>         ldo -144(%r30),%r30

No, it actually stops when frame_size == (e->Total_frame_size << 3)

But I still don't understand the purpose of decoding those stack pointer 
decrement instruction. Due to bug in the code, every such stack pointer 
decrement adds 0x100000000 to the frame size and causes a crash.

Mikulas
