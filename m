Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id IAA25675
	for <parisc-linux@puffin.external.hp.com>; Thu, 25 May 2000 08:41:36 -0600
From: willy@thepuffingroup.com
Date: Thu, 25 May 2000 11:41:46 -0400
To: Richard Hirst <rhirst@linuxcare.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] [MERGE] trouble files
Message-ID: <20000525114146.K25884@thepuffingroup.com>
References: <20000523200750.F17536@thepuffingroup.com> <20000525093530.C1338@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20000525093530.C1338@linuxcare.com>; from Richard Hirst on Thu, May 25, 2000 at 09:35:30AM +0100
List-ID: <linux-parisc.vger.kernel.org>

On Thu, May 25, 2000 at 09:35:30AM +0100, Richard Hirst wrote:
> > drivers/net/82596.c
> 
> I don't believe we use that; I guess we started modifying it and then
> created our own lasi_82596.c from it.  I'll check if anything that
> changed in 82596.c needs feeding back in to lasi_82596.c.

Helge already mailed me to inform me we can lose all our current
modifications to that file.  You don't need to check it; thanks for
noticing :-)
