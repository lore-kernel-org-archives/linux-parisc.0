Return-Path: <James.Bottomley@SteelEye.com>
Received: from hancock.sc.steeleye.com (stat1.steeleye.com [65.114.3.130])
	by dsl2.external.hp.com (Postfix) with ESMTP id 43DE74854
	for <parisc-linux@lists.parisc-linux.org>;
	Thu, 11 Dec 2003 11:48:36 -0700 (MST)
Received: from mulgrave-w.il.steeleye.com (il-ppp.sc.steeleye.com
	[172.17.6.240])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id
	hBBImWa15161; Thu, 11 Dec 2003 13:48:33 -0500
Subject: Re: [parisc-linux] C180 - cannot get KDE nor Gnome get running
From: James Bottomley <James.Bottomley@steeleye.com>
To: Achim Stolze <Achim.Stolze@t-online.de>
In-Reply-To: <3FD8B777.2060105@t-online.de>
References: <3FD8B777.2060105@t-online.de>
Content-Type: text/plain
Date: 11 Dec 2003 13:48:14 -0500
Message-Id: <1071168495.1779.25.camel@mulgrave>
Mime-Version: 1.0
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Thu, 2003-12-11 at 13:29, Achim Stolze wrote:
> Hello all!
> Woody is now running on my C180. But I cannot get KDE or Gnome started.
> I tried to configure XFree before starting XServer, but the command 
> startx causes the error message 
> "... XIO: fatal IO error 232 (connection reset by peer) on X Server ":0.0" after 0 requests ... with 0 events 
> remaining."
>  
> I am not sure which graphics driver I should use ...
> 
> How can I get KDE running?

There were a number of compiler caused bugs in libXt that prevent it
from executing.

I can get gnome (and presumably kde) running happily on my B180, but
only if I use the debian testing release, which does have the fixed Xt
library.

The Xserver you should be using is the framebuffer one (and it *must* be
configured to match the STI framebuffer settings as output by the kernel
on boot up exactly).

James
