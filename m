Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA03290
	for <parisc-linux@puffin.external.hp.com>; Wed, 23 Aug 2000 12:08:58 -0600
To: Andrew Park <apark@cdf.toronto.edu>
Cc: Andrew Shugg <andrew@neep.com.au>, parisc-linux@thepuffingroup.com
Subject: Switch to serial console ( was Re: [parisc-linux] disk required? ) 
In-Reply-To: Message from Andrew Park <apark@cdf.toronto.edu>
   of "Wed, 23 Aug 2000 14:02:07 EDT." <Pine.SOL.4.21.0008231357430.10293-100000@misty.cdf>
References: <Pine.SOL.4.21.0008231357430.10293-100000@misty.cdf> 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 23 Aug 2000 12:10:34 -0600
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20000823181034.19BAC381A0@carmen.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>


Andrew Park writes...

> Thanks for the reply.
> I asked that because I wanted to narrow down the possibility of my
> machine's inability to boot from the net.  It gets to a part where it says
> 
> 	pdc_cons die !!
> 
> then it stops.  On the server, tftp log says "Connection Refused", but
> the funny thing is that the client refused the connection.  I traced
> the code where it printed "connection refused" and verified that the
> server actually sent some data (do not know which file) and tried to
> receive acknowledgement for it and failed to get any.
> Do you have any ideas?

This is the point where the kernel switches over to serial console. The 
machine is still running, just attach a serial console or use minicom or 
something.

Unfortunately this is quickly becoming a FAQ. I wish we had documented it in 
the CD README. It doesn't help that the last message you see is "pdc_cons die".

-- 
Matt Taggart
taggart@fc.hp.com
