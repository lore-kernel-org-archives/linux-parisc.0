From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [RFC] Patch for glibc
	getcontext()/makecontext()/setcontext()/swapcontext()
Date: Sat, 19 Jul 2008 22:33:42 -0400
Message-ID: <20080720023342.GB6427@phobos.i.cabal.ca>
References: <200807190011.02042.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc <linux-parisc@vger.kernel.org>,
	John David Anglin <dave@hiauly1.hia.nrc.ca>,
	carlos@systemhalted.org, Randolph Chung <tausq@parisc-linux.org>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <200807190011.02042.deller@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, Jul 19, 2008 at 12:11:01AM +0200, Helge Deller wrote:
> - only integer parameters allowed (but that's usual on most arches)
> - 32bit userspace implementation only
> - do I need to save the FP regs?
> - maybe more?
> 
> Any feedback is very much appreciated.
> (Please be kind, my hppa assembler knowledge isn't that good)
> 

You probably need to save fpregs as well, but you could just steal all
that from setjmp (ordering matters with fprs.)

r, Kyle
