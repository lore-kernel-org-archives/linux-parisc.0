From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc] [PATCH] timer_interrupt: Fix "SLOW!" warning on rp3440
Date: Sun, 13 Mar 2011 19:44:38 -0600
Message-ID: <20110314014438.GD29986@parisc-linux.org>
References: <20110312170831.GA15698@hiauly1.hia.nrc.ca> <20110313235837.GB29986@parisc-linux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org
To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20110313235837.GB29986@parisc-linux.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, Mar 13, 2011 at 05:58:37PM -0600, Grant Grundler wrote:
> Also, if the div/mul takes up to 0x7000 cycles, another alternative
> is to make the alternative faster.  What I suggested in the else case:
>         /* TODO: Reduce this to one fdiv op */
> 
> doesn't seem possible with fdiv in one op. My reading of the fdiv
> operator suggests it would need another FMUL and FSUB op in order
> to get the remainder. Still might be vary fast.
> 
> Looking through PA 2.0 arch book, looks like the PA2.0
> "Divide Step" (DS) operation (page 7-46) does what I was thinking of.

Besides spelling "vary" wrong, I wanted to note "ds" is also defined in PA1.1.

> But that's going to require a sequence of DS instructions that
> I don't quite understand at the moment and thus can't say how
> fast the worst case for DS might be.

As I expected, someone already implemented divu using DS in 1992:
    http://www.cs.bham.ac.uk/research/projects/poplog/src/master/C.hppa/src/aarith.s

Essentially the same code is in OpenBSD and also NetBSD:
  http://www.openssh.com/cgi-bin/cvsweb/src/sys/arch/hppa/spmath/divu.S?rev=1.10&content-type=text/x-cvsweb-markup

It's not obvious to me where divU is defined for linux kernel use but
that's probably the right thing to use here. I believe it's part of
"stdlib" and ISTR used by gcc.

cheers,
grant
