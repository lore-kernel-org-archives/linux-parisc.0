Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from front.linuxcare.com.au (linuxcare.com.au [203.29.91.49])
	by dsl2.external.hp.com (Postfix) with ESMTP id 417E24A1C
	for <parisc-linux@lists.parisc-linux.org>; Wed,  7 Feb 2001 16:29:55 -0700 (MST)
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id KAA20534;
	Thu, 8 Feb 2001 10:28:24 +1100
Date: Thu, 8 Feb 2001 10:28:24 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: =?iso-8859-1?Q?R=FCdiger?= Scholz <rscholz@hrzpub.tu-darmstadt.de>
Cc: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Re: Failure making current gcc
In-Reply-To: <3A8183B9.751575EB@hrzpub.tu-darmstadt.de>
Message-ID: <Pine.LNX.4.21.0102081025280.7974-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=X-UNKNOWN
List-ID: <linux-parisc.vger.kernel.org>

On Wed, 7 Feb 2001, [iso-8859-1] R=FCdiger Scholz wrote:

> /tmp/cc0dgVTi.s: Assembler messages:
> /tmp/cc0dgVTi.s:74: Internal error, aborting at
> /opt/puffin/palinux/binutils/gas/write.c line 2852 in number_to_chars_big=
endian
> Please report this bug.

Arrgh.  My fault, and it didn't show up in testing because I was using
"--target=3Dhppa-linux --enable-targets=3Dhppa64-linux" when building my
assembler.  Give me a few minutes and I'll have this fixed.

Thanks for the report.

Alan Modra
--=20
Linuxcare.  Support for the Revolution.
