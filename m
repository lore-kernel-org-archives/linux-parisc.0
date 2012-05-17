From: John David Anglin <dave.anglin@bell.net>
Subject: Re: Build regressions/improvements in v3.4-rc7
Date: Wed, 16 May 2012 20:27:35 -0400
Message-ID: <BLU0-SMTP3215D3E80BA82F3C6A654197190@phx.gbl>
References: <1337157034-22773-1-git-send-email-geert@linux-m68k.org> <CAMuHMdUtL4_mv-e-EQAZmNcb9dAT=PXB59i7Vuj2vf8NnaBFzQ@mail.gmail.com> <1337179563.2985.80.camel@dabdike.int.hansenpartnership.com>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-kernel@vger.kernel.org,
	Linuxppc-dev <linuxppc-dev@ozlabs.org>,
	Parisc List <linux-parisc@vger.kernel.org>,
	the arch/x86 maintainers <x86@kernel.org>,
	Dmitry Kasatkin <dmitry.kasatkin@intel.com>,
	James Morris <jmorris@namei.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1337179563.2985.80.camel@dabdike.int.hansenpartnership.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 16-May-12, at 10:46 AM, James Bottomley wrote:

> Wow, lib/mpi/ is a complete horror: it's full of hand crafted asm  
> code.
> The error in this case appears to be that umul_ppm() is implemented as
> an xmpyu instruction.  That's a floating point instruction.  We
> deliberately compile the kernel with floating point disabled because  
> we
> don't want to save and restore the floating point register file on  
> each
> context switch, hence the operand constraints are unsatisfiable.

I haven't tried this but I think the parisc implementation of umul_ppmm
can be deleted.  There is a generic version in the file.

Dave
--
John David Anglin	dave.anglin@bell.net



