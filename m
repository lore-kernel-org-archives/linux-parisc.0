Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc2-hems4-0-cust95.bre.cable.ntl.com [213.107.176.95])
	by dsl2.external.hp.com (Postfix) with ESMTP id 28B49482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 12 Jul 2001 06:55:01 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id B952BB00C; Thu, 12 Jul 2001 13:53:36 +0100 (BST)
Date: Thu, 12 Jul 2001 13:53:36 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: rpengelly <rpengelly@ati.stlawrencec.on.ca>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 0.92 install iso problems
Message-ID: <20010712135336.B18375@linuxcare.com>
References: <002c01c10a40$ba3143a0$0f809b8e@ati.stlawrencec.on.ca> <20010712124932.Y18375@linuxcare.com> <000b01c10acd$be18bbf0$0f809b8e@ati.stlawrencec.on.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <000b01c10acd$be18bbf0$0f809b8e@ati.stlawrencec.on.ca>; from rpengelly@ati.stlawrencec.on.ca on Thu, Jul 12, 2001 at 08:25:31AM -0400
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Jul 12, 2001 at 08:25:31AM -0400, rpengelly wrote:
> We did boot from an older lifimage due to problems with the new lifimage on
> the 0.92 install. For some reason it wouldn't netboot off the lifimage.
> 
> I'm currently downloading the 0.92 full iso to see if that yeilds any luck.

0.9.2 and 0.9.2-install have the same lifimage on them.  Post more
details if it still wont netboot.

> How exactly do you check the md5sums?

Typical linux systems, at least, have a utility md5sum, so you just
enter "md5sum <filename>" at the shell prompt.  A web search for
md5sum.exe should help if you use certain other OSes.

Richard
