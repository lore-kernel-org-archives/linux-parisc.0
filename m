Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from front.linuxcare.com.au (linuxcare.com.au [203.29.91.49])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5EBFF4A19
	for <parisc-linux@lists.parisc-linux.org>; Mon, 19 Feb 2001 01:49:41 -0700 (MST)
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id TAA24097;
	Mon, 19 Feb 2001 19:49:35 +1100
Date: Mon, 19 Feb 2001 19:49:34 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: "Rafael E. Herrera" <raffo@neuronet.pitt.edu>
Cc: PL <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Cannot build 02/18/2001 glibc
In-Reply-To: <3A90C77A.634C2FBF@neuronet.pitt.edu>
Message-ID: <Pine.LNX.4.21.0102191946290.23583-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Mon, 19 Feb 2001, Rafael E. Herrera wrote:

> checking for assembler line separator... *** You need a newer assembler
> to compile glibc
>[snip]
>  /usr/i486-suse-linux/bin/as -V -Qy -v -o conftest.o conftest.s

Oops, this is an x86 assembler.

> The binaries called and the version numbers are shown. Do I need to
> upgrade the assembler or is it a PATH misconfiguration? Thanks.

You need the hppa-linux assembler installed and available on your PATH.

Alan Modra
-- 
Linuxcare.  Support for the Revolution.
