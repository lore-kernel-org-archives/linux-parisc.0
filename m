Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from the-village.bc.nu (router-100M.swansea.linux.org.uk [194.168.151.17])
	by dsl2.external.hp.com (Postfix) with ESMTP id 56B884A19
	for <parisc-linux@lists.parisc-linux.org>; Tue, 27 Feb 2001 06:41:48 -0700 (MST)
Subject: Re: [parisc-linux] SMP: We have ignition
To: alan@linuxcare.com.au (Alan Modra)
Date: Tue, 27 Feb 2001 13:44:59 +0000 (GMT)
Cc: alan@lxorguk.ukuu.org.uk (Alan Cox),
	parisc-linux@lists.parisc-linux.org
In-Reply-To: <Pine.LNX.4.21.0102272335540.18409-100000@front.linuxcare.com.au> from "Alan Modra" at Feb 28, 2001 12:04:51 AM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-Id: <E14XkRA-0003RI-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

 > Is there a 'dont use builtins' flag ?
> 
> -fno-builtin
> 
> I'd be inclined to do this instead

Careful, if you use different typings to everyone else you will get a million
printf format warnings instead
