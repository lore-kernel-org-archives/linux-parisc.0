Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from the-village.bc.nu (lightning.swansea.linux.org.uk [194.168.151.1])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9EB104831
	for <parisc-linux@lists.parisc-linux.org>; Wed,  6 Mar 2002 09:30:43 -0700 (MST)
Subject: Re: [parisc-linux] not freeing initmem?
To: helge.deller@sap.com (Helge Deller)
Date: Wed, 6 Mar 2002 16:45:59 +0000 (GMT)
Cc: Ralf.Hildebrandt@charite.de (Ralf Hildebrandt),
	parisc-linux@lists.parisc-linux.org
In-Reply-To: <E16idHP-0003pp-00@linuxlab.wdf.sap-ag.de> from "Helge Deller" at Mar 06, 2002 04:24:35 PM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-Id: <E16ieYB-0007Ml-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
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

> There is still one or more __init 's too much somewhere. 
> If we would free the memory without fixing/finding this place first, 
> the kernel will crash.

Disable interrupts, memset all the freed pages to an invalid instruction in
parisc asm at the point you free the init pages, then re-enable ints and
the traceback should give you a direct stack trace to the offender
