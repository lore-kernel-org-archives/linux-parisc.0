Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from irongate.swansea.linux.org.uk (pc1-cwma1-5-cust128.swa.cable.ntl.com [80.5.120.128])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9AF5A4829
	for <parisc-linux@lists.parisc-linux.org>; Thu, 19 Sep 2002 04:03:03 -0600 (MDT)
Received: from irongate.swansea.linux.org.uk (localhost [127.0.0.1])
	by irongate.swansea.linux.org.uk (8.12.5/8.12.5) with ESMTP id g8JA6l5a026763;
	Thu, 19 Sep 2002 11:06:48 +0100
Received: (from alan@localhost)
	by irongate.swansea.linux.org.uk (8.12.5/8.12.5/Submit) id g8JA6iq1026761;
	Thu, 19 Sep 2002 11:06:44 +0100
Subject: Re: [parisc-linux] ide controller
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
To: j.steindlberger@gmx.de
Cc: Grant Grundler <grundler@dsl2.external.hp.com>,
	moritz@freesources.org, parisc-linux@lists.parisc-linux.org
In-Reply-To: <28859.1032424874@www2.gmx.net>
References: <20020916043004.B27754829@dsl2.external.hp.com>
	<28859.1032424874@www2.gmx.net>
Content-Type: text/plain
Date: 19 Sep 2002 11:06:44 +0100
Message-Id: <1032430004.26669.1.camel@irongate.swansea.linux.org.uk>
Mime-Version: 1.0
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

On Thu, 2002-09-19 at 09:41, j.steindlberger@gmx.de wrote:
> together with Moritz I/we tried to get some new results. We took the latest
> kernel (-pa18) and did the changes to the PDC202XX-definitions in pdc202xx.c.
> But I don't believe that the kernel gets the chance to recognice this
> change. I think the kernel crashes earlier. We reduced the kernel by the specific
> drivers. We disabled the following:
> [ ]     Generic PCI bus-master DMA support
> After compiling wie had these three modules:
> ide-mod.o
> ide-probe-mod.o
> ide-disk.o
> An insmod ide-mod.o was possible. But after insmod ide-probe-mod the kernel
> crashes. In some cases we got an output with about 50 pages of memory
> addresses. At the beginning we got some messages told about the SYM-SCSI-device.
> Could that be a conflict? We did not succeed to reproduce that and log it.

Our IDE code has been run on non x86 platforms. It does require that the
defaults are set right for the platform so that it doesnt do stuff like
blindly probe I/O 0x170. 

I don't know if the Promise card needs its BIOS to have run, I would
suspect not but can't be sure.
