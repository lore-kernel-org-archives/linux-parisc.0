Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from the-village.bc.nu (lightning.swansea.linux.org.uk [194.168.151.1])
	by dsl2.external.hp.com (Postfix) with ESMTP id 429C8482C
	for <parisc-linux@lists.parisc-linux.org>; Fri, 16 Nov 2001 03:03:18 -0700 (MST)
Subject: Re: [parisc-linux] Linux/PA-RISC speed (was Re: C240 Graphics, 64bit kernel and more)
To: thunder7@xs4all.nl
Date: Fri, 16 Nov 2001 10:10:28 +0000 (GMT)
Cc: xam@student.cs.ucc.ie (Markus Grabert),
	parisc-linux@lists.parisc-linux.org
In-Reply-To: <20011116073418.A15527@alpha.of.nowhere> from "Jurriaan on Alpha" at Nov 16, 2001 07:34:18 AM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-Id: <E164fx6-0003VW-00@the-village.bc.nu>
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

> Alpha (gcc-2.95.4)        : real 5m45 user 5m13 system  9s
> Alpha (gcc-3.0.2 20010924): real 4m36 user 4m12 system 10s
> C200+ (gcc-3.0.2 20010922): real 8m23 user 7m48 system 33s
> dual P3/700 (gcc-2.95.4)  : real 1m20 user 1m17 system  3s

Be cautious. Unless you built cross compilers and each is building for
the same target you are doing different amounts of work for each target
CPU

Looking at the high system time I guess there is work to do on the hppa,
but it doesn't suprise me. It takes a lot of time to tune a port after it
actually works reliably
