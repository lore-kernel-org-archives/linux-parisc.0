Return-Path: <xam@cs.ucc.ie>
Received: from csmail.ucc.ie (csmail.ucc.ie [143.239.211.231])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6821D4919
	for <parisc-linux@lists.parisc-linux.org>;
	Tue,  9 Mar 2004 00:11:19 -0700 (MST)
Date: Tue, 9 Mar 2004 07:11:16 +0000 (GMT)
From: "M. Grabert" <xam@cs.ucc.ie>
To: Randolph Chung <randolph@tausq.org>
Subject: Re: [parisc-linux] Results of (IDE) kernel tests with modified io.c
In-Reply-To: <20040309063629.GM1113@tausq.org>
Message-ID: <Pine.LNX.4.58.0403090656070.13701@sal.ucc.ie>
References: <Pine.LNX.4.58.0403040044200.14527@sal.ucc.ie>
	<20040309063629.GM1113@tausq.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: Grant Grundler <grundler@parisc-linux.org>,
	parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Mon, 8 Mar 2004, Randolph Chung wrote:

> > Recent discussions on p-l led to the assumption that io.c may be
> > broken and tests with a modified arch/parisc/io.c would be helpful.
> > Therefore I took out all references to leXX_to_cpu and cpu_to_leXX in io.c
> > and built various kernels and ran them.
>
> as you found out in your tests, io.c is correct as it was before.... I
> think Grant got confused with our original pci mmio macros which had
> wrong endian.... but that was a very long time ago :)

Guessing from his last messages about this topic it seems so ;-P

> I am trying to bring up the ns87415 ide controller on my c3750.. not
> much luck yet :-(

I don't have any troubles with it since 2.4.21 on my C3000, just DMA is
not working. However I can't get it working on 2.6 either.

> for the other controllers, you might need a pci fixup to bring the
> devices into native mode (as Alan mentioned in his email). i wonder if
> it's safe to automatically set all IDE devices to native mode?

I don't have much knowledge about IDE and especially no knowledge how
different linux architectures are dealing with it.
But since some of the cards work on other linux architectures
(e.g. the Promise card is reproted to run on Linux/PPC), it is definitely
possible.

But what I'm wondering about is why the Silicon Image driver
(always) detects the Seagate ST311022A hard drive as "TS130220A2".
Since it uses mmio instead of PIO as the other drivers, maybe there is
some big-endian problem in the Linux/PA-RISC mmio code? But then this
problem must be somewhere in the IDE code, since all mmio in general
seems to be working fine!

Slightly confused,
  Max
