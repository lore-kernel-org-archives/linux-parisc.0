Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from front.linuxcare.com.au (linuxcare.com.au [203.29.91.49])
	by dsl2.external.hp.com (Postfix) with ESMTP id E0BEF4A19
	for <parisc-linux@lists.parisc-linux.org>; Mon, 26 Feb 2001 16:36:30 -0700 (MST)
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id KAA10255;
	Tue, 27 Feb 2001 10:36:17 +1100
Date: Tue, 27 Feb 2001 10:36:17 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Thomas Marteau <marteaut@esiee.fr>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] SMP: We have ignition
In-Reply-To: <3A9A715F.BDDC8A66@esiee.fr>
Message-ID: <Pine.LNX.4.21.0102271031580.18409-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Mon, 26 Feb 2001, Thomas Marteau wrote:

> /home/mkltom/cvs/linux/include/linux/string.h:27: warning: conflicting
> types for built-in function `strncpy'

These messages are harmless (but annoying!).  gcc is complaining about the
`len' param which for the built-in functions is `int', but the kernel
headers effectively use `long'

Alan
-- 
Linuxcare.  Support for the Revolution.
