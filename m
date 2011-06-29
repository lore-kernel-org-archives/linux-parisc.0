From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: [PATCH] fix backtrace on PA-RISC
Date: Tue, 28 Jun 2011 21:25:44 -0400
Message-ID: <20110629012544.GA9039@hiauly1.hia.nrc.ca>
References: <alpine.DEB.2.00.1106290043170.32272@artax.karlin.mff.cuni.cz>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: jejb@parisc-linux.org, linux-parisc@vger.kernel.org
To: Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, 28 Jun 2011, John David Anglin wrote:

> > @@ -305,18 +310,16 @@ static void unwind_frame_regs(struct unw
> >  
> >  			insn = *(unsigned int *)npc;
> >  
> > -			if ((insn & 0xffffc000) == 0x37de0000 ||
> > -			    (insn & 0xffe00000) == 0x6fc00000) {
> > +			if ((insn & 0xffffc001) == 0x37de0000 ||
> > +			    (insn & 0xffe00001) == 0x6fc00000) {
> >  				/* ldo X(sp), sp, or stwm X,D(sp) */
> > -				frame_size += (insn & 0x1 ? -1 << 13 : 0) | 
> > -					((insn & 0x3fff) >> 1);
> > +				frame_size += (insn & 0x3fff) >> 1;
> 
> This doesn't look correct to me.  Look at the disassembly code
> in binutils.  In wide mode, an extract_16 operation needs to be
> used for ldo.  In non wide mode and for stwm, extract_14 needs
> to be used.  extract_14 is a simple 14-bit extraction followed 
> low sign extension.
> 
> I believe the problem with the original code is that it doesn't
> handle wide mode (64-bit kernels) for ldo.

Here are the sign extension routines from binutils:

static inline int
sign_extend (int x, int len)
{
  int signbit = (1 << (len - 1));
  int mask = (signbit << 1) - 1;
  return ((x & mask) ^ signbit) - signbit;
}

static inline int
low_sign_extend (int x, int len)
{
  return (x >> 1) - ((x & 1) << (len - 1));
}

It probably doesn't matter too much but they are written in a manner
to avoid conditional tests.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
