Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA08033
	for <parisc-linux@puffin.external.hp.com>; Mon, 13 Nov 2000 10:40:21 -0700
Received: from unknown (HELO smtp.linuxcare.com) (216.88.157.131)
  by mailserv2.iuinc.com with SMTP; 13 Nov 2000 17:42:22 -0000
Received: from ottawa.linuxcare.com (HELO linuxcare.com) (216.208.98.2)
  by smtp.linuxcare.com with SMTP; 13 Nov 2000 17:42:09 -0000
Sender: adevries@mailserv2.iuinc.com
Message-ID: <3A1037F0.826C9D8C@linuxcare.com>
Date: Mon, 13 Nov 2000 13:50:24 -0500
From: Alex deVries <adevries@linuxcare.com>
MIME-Version: 1.0
To: dhazeghi@pacbell.net
CC: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] [Semi OT] SOM Linker
References: <3A0F7D5B.4A70CB73@pacbell.net>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

dhazeghi@pacbell.net wrote:
> However I would like to know what work if any has been done on the SOM
> linker which HP released to the public last November(?). It seems that
> as of right now, it has not been touched since February 14, and the FSF
> binutils snapshots still do not have any SOM support for ld. Has there
> been any movement in merging this in, or is anybody working on this?

The initial plan was to do our 32-bit userspace with SOM, worrying about
ELF32 much later in the game.  But ELF32 development happened a lot
quicker than expected, and so nobody's really done much on the SOM
linker.

I suspect it'd be very hard to use the SOM linker code to incorporate it
into binutils, but I could be wrong.

What are you actually trying to do?

- Alex

-- 
Alex deVries, Principal Solutions Architect, The Puffins at Linuxcare
613.562.2759 tel
alex@linuxcare.com, http://www.linuxcare.com/
Linuxcare, Support for the revolution.
