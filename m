Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: "M. Grabert" <xam@cs.ucc.ie>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Hints to debug, was: Voodoo3 PCI on C200 experiment pending! 
In-Reply-To: Message from "M. Grabert" <xam@cs.ucc.ie>
   of "Sun, 18 Aug 2002 05:21:34 BST." <Pine.LNX.4.44.0208180453380.1348-100000@sal.ucc.ie>
References: <Pine.LNX.4.44.0208180453380.1348-100000@sal.ucc.ie> 
Date: Sat, 17 Aug 2002 23:05:25 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020818050525.0B27A4829@dsl2.external.hp.com>
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

"M. Grabert" wrote:
> Does anybody can give me some hints what to do to debug this issue?

Here's a start.

You want to get the HPMC state from firmware. interrupt the
boot process and type "ser pim" at the firmware prompt.
You want to look at gr02 (return pointer) and IOAQ (aka offset, IP).
IOAQ points at the instruction that tripped the HPMC handling.
It wasn't necessarily the cause. Look up the symbol in the
System.map with "buildtools/a.c" (another CVS repository on
cvs.parisc-linux.org).

IOAQ might point to user space if X11 server is involved.
We'll have to look at PSW bits and/or Space registers to determine that.

grant
