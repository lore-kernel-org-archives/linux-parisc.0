Received: from mailserv2.iuinc.com (mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id CAA03115
	for <parisc-linux@puffin.external.hp.com>; Mon, 2 Aug 1999 02:36:35 -0600
Received: from security.hp.com (cranston.fc.hp.com [15.6.91.224])
	by palrel3.hp.com (8.8.6 (PHNE_17135)/8.8.5tis) with ESMTP id BAA15992
	for <parisc-linux@thepuffingroup.com>; Mon, 2 Aug 1999 01:37:01 -0700 (PDT)
To: Matthew Wilcox <Matthew.Wilcox@genedata.com>
Cc: LaMont Jones <lamont@security.hp.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] HPUX syscall ABI? 
In-reply-to: Your message of "Mon, 02 Aug 1999 08:26:12 +0200."
             <19990802082612.X25925@mencheca.ch.genedata.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Date: Mon, 02 Aug 1999 02:36:58 -0600
From: LaMont Jones <lamont@security.hp.com>
Message-Id: <19990802083658.D666618708@security.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

> Yep, that's exactly what I need.  Urgh, so I have to grab the arguments
> off the user-mode stack before switching to the kernel-mode stack..
> 
> What's the greatest number of parameters to an HPUX syscall?
> Linux's mmap() has six parameters (and you should see the kludges some
> architectures go through to support that.  We're cleaner).

The routine _syscall(), which calls an aribitrary system call for you,
takes 9 arguments:  the system call number followed by 8 args.  While
that's not a complete guarantee, you'ld be in good company if you supported
up to 8 args...

lamont
