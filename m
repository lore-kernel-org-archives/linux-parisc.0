Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from the-village.bc.nu (router-100M.swansea.linux.org.uk [194.168.151.17])
	by dsl2.external.hp.com (Postfix) with ESMTP id 19F46482A
	for <parisc-linux@parisc-linux.org>; Sun, 25 Mar 2001 16:41:33 -0700 (MST)
Subject: Re: [parisc-linux] Building packages, problems with printf
To: alan@linuxcare.com.au (Alan Modra)
Date: Mon, 26 Mar 2001 00:42:46 +0100 (BST)
Cc: matthew@wil.cx (Matthew Wilcox), parisc-linux@parisc-linux.org
In-Reply-To: <Pine.LNX.4.21.0103260855260.3568-100000@front.linuxcare.com.au> from "Alan Modra" at Mar 26, 2001 09:03:34 AM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-Id: <E14hK9p-0000hh-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

> Earn brownie points sending off proper fixes to package maintainers. :)

Most package maintainers wont bother. printf as a macro breaks too much code
to be 'interesting' to fix. Many people take the address of printf for 
passing to functions using multiple I/O output methods

> > fixing glibc to not do that seems to not be an option.  ANSI explicitly
> > allows any of the functions in libc to also be defined as macros.

glibc may be ANSI compliant, its just useless if it does this. Useful and
standards compliant  interesect but dont 100% overlap

Alan
