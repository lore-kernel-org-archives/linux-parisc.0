Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id E94EB482A
	for <parisc-linux@lists.parisc-linux.org>; Fri,  4 Jul 2003 13:29:38 -0600 (MDT)
Message-Id: <200307041929.h64JTbD5020079@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] binutils_2.14.90 bug
To: grundler@parisc-linux.org (Grant Grundler)
Date: Fri, 4 Jul 2003 15:29:36 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <20030704191042.GB7885@dsl2.external.hp.com> from "Grant Grundler" at Jul 4, 2003 01:10:42 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Hi Grant,

Due to an "improvement" made for the detection of labels on ia64,
the PA assembler no longer tolerants whitespace in the operand field.
The only whitespace that is allowed is after `,'.  So, you need to
remove the whitespace around `+' and `*'.  If you look at the HP
assembler docs, you will see that they never show any whitespace
in the operands field.

Previously, the assembler used to strip the whitespace by default.
The reason that we can strip whitespace after `,' is that `,' never
ends an opcode.

This came up before on this list.

> Hi binutils lovers,
> 
> I can't build a 32-bit parisc kernel with binutils*2.14.90.0.4-0.1_hppa.deb
> packages.  It dies with an error in arch/parisc/kernel/real2.S:
> 
> real2.S:126: Error: too many positional arguments
> 
> The offending line reads:
>         load32  PA(save_cr_space + (N_SAVED_REGS * REG_SZ)), %r26
> 
> this gets reduced to:
>         load32  ((save_cr_space + (9 * 4))-(0x10000000)), %r26
> 
> 
> Older binutils*_2.12.90.0.1-4_hppa.deb works.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
