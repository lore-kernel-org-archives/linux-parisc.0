Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from front.linuxcare.com.au (linuxcare.com.au [203.29.91.49])
	by dsl2.external.hp.com (Postfix) with ESMTP id 93C4B4A19
	for <parisc-linux@parisc-linux.org>; Sun,  4 Mar 2001 04:16:09 -0700 (MST)
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id WAA01670;
	Sun, 4 Mar 2001 22:15:52 +1100
Date: Sun, 4 Mar 2001 22:15:52 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Greg Ingram <ingram@symsys.com>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] C100 Self-Hosting
In-Reply-To: <Pine.LNX.4.21.0103021230140.12009-100000@maestro.symsys.com>
Message-ID: <Pine.LNX.4.21.0103042211020.32448-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Fri, 2 Mar 2001, Greg Ingram wrote:

> 2)  conflicting types for mem{cmp|cpy|set} built-ins 
> 
> Lots and lots of warnings.  Should I add -fno-builtin?

No.  I haven't heard any complaints about my proposed change to fix the
warnings, so I'm going to commit it.

Alan Modra
