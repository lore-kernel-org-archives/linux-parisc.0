Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from the-village.bc.nu (router-100M.swansea.linux.org.uk [194.168.151.17])
	by dsl2.external.hp.com (Postfix) with ESMTP id C98304A19
	for <parisc-linux@lists.parisc-linux.org>; Thu, 22 Feb 2001 04:23:36 -0700 (MST)
Subject: Re: [parisc-linux] Re: pipes
To: rhirst@linuxcare.com (Richard Hirst)
Date: Thu, 22 Feb 2001 11:26:06 +0000 (GMT)
Cc: alan@linuxcare.com.au (Alan Modra),
	parisc-linux@lists.parisc-linux.org
In-Reply-To: <20010222110949.B1129@linuxcare.com> from "Richard Hirst" at Feb 22, 2001 11:09:49 AM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-Id: <E14Vtsu-0003xc-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

> > thinking there is no data available.  Secondary problem is that the kernel
> > returns the wrong thing when the syscall is interrupted.
> 
> But I just tried this on my x86 as well (2.2 kernel):

The return is ok. Its 'deep magic' strace sees
