Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from the-village.bc.nu (router-100M.swansea.linux.org.uk [194.168.151.17])
	by dsl2.external.hp.com (Postfix) with ESMTP id 29E6F4A19
	for <parisc-linux@lists.parisc-linux.org>; Thu, 22 Feb 2001 04:50:09 -0700 (MST)
Subject: Re: [parisc-linux] Re: pipes
To: alan@linuxcare.com.au (Alan Modra)
Date: Thu, 22 Feb 2001 11:52:59 +0000 (GMT)
Cc: alan@lxorguk.ukuu.org.uk (Alan Cox),
	rhirst@linuxcare.com (Richard Hirst),
	parisc-linux@lists.parisc-linux.org
In-Reply-To: <Pine.LNX.4.21.0102222237440.14557-100000@front.linuxcare.com.au> from "Alan Modra" at Feb 22, 2001 10:39:57 PM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-Id: <E14VuIu-00040I-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

> > The return is ok. Its 'deep magic' strace sees
> 
> Err, are you saying I'm barking up the wrong gum tree, and there's nothing
> wrong with the read() in my strace output?

strace will see the magic ERESTARTSYS type codes, but the application will not
