Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mx0.gmx.net (mx0.gmx.net [213.165.64.100])
	by dsl2.external.hp.com (Postfix) with SMTP id 007F6482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 19 Sep 2002 02:41:18 -0600 (MDT)
Date: Thu, 19 Sep 2002 10:41:14 +0200 (MEST)
From: j.steindlberger@gmx.de
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: moritz@freesources.org, parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
References: <20020916043004.B27754829@dsl2.external.hp.com>
Subject: Re: [parisc-linux] ide controller
Message-ID: <28859.1032424874@www2.gmx.net>
Content-Type: text/plain; charset="us-ascii"
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

together with Moritz I/we tried to get some new results. We took the latest
kernel (-pa18) and did the changes to the PDC202XX-definitions in pdc202xx.c.
But I don't believe that the kernel gets the chance to recognice this
change. I think the kernel crashes earlier. We reduced the kernel by the specific
drivers. We disabled the following:
[ ]     Generic PCI bus-master DMA support
After compiling wie had these three modules:
ide-mod.o
ide-probe-mod.o
ide-disk.o
An insmod ide-mod.o was possible. But after insmod ide-probe-mod the kernel
crashes. In some cases we got an output with about 50 pages of memory
addresses. At the beginning we got some messages told about the SYM-SCSI-device.
Could that be a conflict? We did not succeed to reproduce that and log it.

Here my questions:
Did You here about anyone to succeed in using an IDE-controller in a
HP-RISC-architecture?
Do You see a chance to use IDE-disks in future (with some none
HP-controller)
Do You know about more people who are interrested in what we tried to do?
That would be an argument for me to continue experimenting.

Thank You
Joerg

> #define PDC202XX_DEBUG_DRIVE_INFO               0
> #define PDC202XX_DECODE_REGISTER_INFO           0
> 
>   and rebuild the module with that.
> 
> 3) post the console log and "ser pim" output at PDC prompt.

-- 
GMX - Die Kommunikationsplattform im Internet.
http://www.gmx.net
