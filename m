From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: Build regressions/improvements in v3.4-rc7
Date: Wed, 16 May 2012 15:46:03 +0100
Message-ID: <1337179563.2985.80.camel@dabdike.int.hansenpartnership.com>
References: <1337157034-22773-1-git-send-email-geert@linux-m68k.org>
	 <CAMuHMdUtL4_mv-e-EQAZmNcb9dAT=PXB59i7Vuj2vf8NnaBFzQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: linux-kernel@vger.kernel.org,
	Linuxppc-dev <linuxppc-dev@ozlabs.org>,
	Parisc List <linux-parisc@vger.kernel.org>,
	the arch/x86 maintainers <x86@kernel.org>,
	Dmitry Kasatkin <dmitry.kasatkin@intel.com>,
	James Morris <jmorris@namei.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdUtL4_mv-e-EQAZmNcb9dAT=PXB59i7Vuj2vf8NnaBFzQ@mail.gmail.com>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, 2012-05-16 at 10:47 +0200, Geert Uytterhoeven wrote:
> On Wed, May 16, 2012 at 10:30 AM, Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
>   + lib/mpi/generic_mpih-mul1.c: error: inconsistent operand
> constraints in an 'asm':  => 50:70
>   + lib/mpi/generic_mpih-mul2.c: error: inconsistent operand
> constraints in an 'asm':  => 49:70
>   + lib/mpi/generic_mpih-mul3.c: error: inconsistent operand
> constraints in an 'asm':  => 49:70
>   + lib/mpi/mpih-div.c: error: inconsistent operand constraints in an
> 'asm':  => 135:122, 135:371, 97:122, 106:121, 106:370, 97:371
> 
> parisc-allmodconfig

Wow, lib/mpi/ is a complete horror: it's full of hand crafted asm code.
The error in this case appears to be that umul_ppm() is implemented as
an xmpyu instruction.  That's a floating point instruction.  We
deliberately compile the kernel with floating point disabled because we
don't want to save and restore the floating point register file on each
context switch, hence the operand constraints are unsatisfiable.

It appears to be completely untested on non-x86 and to have been
imported via the security tree ... what are we supposed to do with this?
I thought the general principle was that asm code was really supposed to
be confined to the arch directories?

James
