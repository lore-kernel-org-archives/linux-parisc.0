Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from the-village.bc.nu (router-100M.swansea.linux.org.uk [194.168.151.17])
	by dsl2.external.hp.com (Postfix) with ESMTP id 00C204A19
	for <parisc-linux@lists.parisc-linux.org>; Tue, 27 Feb 2001 04:51:29 -0700 (MST)
Subject: Re: [parisc-linux] SMP: We have ignition
To: alan@linuxcare.com.au (Alan Modra)
Date: Tue, 27 Feb 2001 11:54:36 +0000 (GMT)
Cc: marteaut@esiee.fr (Thomas Marteau),
	parisc-linux@lists.parisc-linux.org
In-Reply-To: <Pine.LNX.4.21.0102271031580.18409-100000@front.linuxcare.com.au> from "Alan Modra" at Feb 27, 2001 10:36:17 AM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-Id: <E14XiiG-0003Ee-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

> On Mon, 26 Feb 2001, Thomas Marteau wrote:
> 
> > /home/mkltom/cvs/linux/include/linux/string.h:27: warning: conflicting
> > types for built-in function `strncpy'
> 
> These messages are harmless (but annoying!).  gcc is complaining about the
> `len' param which for the built-in functions is `int', but the kernel
> headers effectively use `long'

Why isnt gcc prototyping and defining

	__memcpy
	__strncpy

and #defining them across in libc header files ?

Is there a 'dont use builtins' flag ?
