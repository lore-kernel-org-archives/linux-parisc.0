Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA11292
	for <parisc-linux@puffin.external.hp.com>; Sat, 9 Dec 2000 16:33:58 -0700
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 9 Dec 2000 23:36:31 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id KAA32209;
	Sun, 10 Dec 2000 10:35:57 +1100
Date: Sun, 10 Dec 2000 10:35:57 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Richard Henderson <rth@redhat.com>
cc: Jeffrey A Law <law@redhat.com>,
        John David Anglin <dave@hiauly1.hia.nrc.ca>,
        Richard Hirst <rhirst@linuxcare.com>, parisc-linux@thepuffingroup.com,
        gcc-bugs@gcc.gnu.org
Subject: Re: pa reload problem
In-Reply-To: <20001209105607.A5191@redhat.com>
Message-ID: <Pine.LNX.4.21.0012101028320.31734-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Sat, 9 Dec 2000, Richard Henderson wrote:

> On Sun, Dec 10, 2000 at 12:57:03AM +1100, Alan Modra wrote:
> > Grrr, that allocates r1 first, which loses on 32-bit hppa.
> 
> Err, elaborate on "loses".

Like so

/src/parisc/gcc-20001208/gcc/libgcc2.c: In function `__throw':
/src/parisc/gcc-20001208/gcc/libgcc2.c:4121: Unable to find a register to
spill in class `R1_REGS'.
/src/parisc/gcc-20001208/gcc/libgcc2.c:4121: This is the insn:

(insn 161 190 163 (set (reg/f:SI 21 %r21)
        (label_ref:SI 169)) 79 {*pa.md:2287} (nil)
    (expr_list:REG_EQUIV (label_ref:SI 169)
        (insn_list:REG_LABEL 169 (nil))))

> >       When allocating registers, do so according to REG_ALLOC_ORDER and
> > 	choose GENERAL_REGS.
> 
> The problem with this is that you've broken the ABI for all
> extant targets.

Pity.  It looked like a nice solution to me.

-- 
Linuxcare.  Support for the Revolution.
