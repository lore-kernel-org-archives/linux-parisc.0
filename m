Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from dsl2.external.hp.com (localhost [127.0.0.1])
	by dsl2.external.hp.com (Postfix) with ESMTP id 835DE482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 24 May 2002 01:14:08 -0600 (MDT)
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] PA8700 boots! 
In-Reply-To: Message from grundler@dsl2.external.hp.com (Grant Grundler)
   of "Fri, 24 May 2002 00:55:40 MDT." <20020524065540.DBFE4482A@dsl2.external.hp.com>
References: <20020524065540.DBFE4482A@dsl2.external.hp.com> 
Date: Fri, 24 May 2002 01:14:08 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020524071408.835DE482A@dsl2.external.hp.com>
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

> I also need to fixup the "unkown device" (PA8700 CPU)
> in the hardware listing.
...

bah...pasting into the xterm must have had a ^D and the
mail got sent prematurely...here's the most interesting
opart of the output.

grant

:~# cat /proc/cpuinfo
processor       : 0
cpu family      : PA-RISC 2.0
cpu             : PA8700 (PCX-W2)
cpu MHz         : 650.000000
model           : 9000/800/A500-6X
model name      : Unknown machine
hversion        : 0x00005e20
sversion        : 0x00000491
I-cache         : 768 KB
D-cache         : 1536 KB (WB)
ITLB entries    : 240
DTLB entries    : 240 - shared with ITLB
bogomips        : 1297.61
software id     : 1940077826

:~#
