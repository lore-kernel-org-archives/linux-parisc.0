Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id OAA29158
	for <parisc-linux@puffin.external.hp.com>; Thu, 13 Apr 2000 14:41:35 -0600
From: willy@thepuffingroup.com
Date: Thu, 13 Apr 2000 17:41:19 -0400
To: Sam Creasey <sammy@sammy.net>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] page colouring....
Message-ID: <20000413174119.A15697@thepuffingroup.com>
References: <Pine.LNX.4.21.0004092320450.32368-100000@sammyville.sammy.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.21.0004092320450.32368-100000@sammyville.sammy.net>; from Sam Creasey on Sun, Apr 09, 2000 at 11:42:33PM -0400
List-ID: <linux-parisc.vger.kernel.org>

On Sun, Apr 09, 2000 at 11:42:33PM -0400, Sam Creasey wrote:
> [why do we have page colouring?]

Originally, we thought it was necessary to get Linux working correctly
on the PA-RISC architecture.  At the puffinfest, we decided that was
incorrect.  [prumpf & jsm did most of the talking; pb & I listened in.]
The existing calls should be sufficient.  So go ahead and rip them out
and commit that code.  Or I can do it if you don't want to.

> # uname -a
> Linux 10.0.0.5 2.3.99-pre1 #41 Sun Apr 9 21:07:39 EDT 2000 parisc unknown

_sweet_.
