Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA03073
	for <parisc-linux@puffin.external.hp.com>; Wed, 23 Aug 2000 12:02:59 -0600
Date: Wed, 23 Aug 2000 14:02:07 -0400 (EDT)
From: Andrew Park <apark@cdf.toronto.edu>
To: Andrew Shugg <andrew@neep.com.au>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] disk required?
In-Reply-To: <20000824014831.A25471@neep.com.au>
Message-ID: <Pine.SOL.4.21.0008231357430.10293-100000@misty.cdf>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Thu, 24 Aug 2000, Andrew Shugg wrote:

> There isn't any requirement for locally attached devices to have
> readable filesystems if you can boot and nfs-root from the network.
> 
> The local disks in my HP hold HP/UX on them, I just network boot to test
> Linux kernels.  This is essentially the same thing as having no disk at
> all as far as Linux is concerned.  =)

Thanks for the reply.
I asked that because I wanted to narrow down the possibility of my
machine's inability to boot from the net.  It gets to a part where it says

	pdc_cons die !!

then it stops.  On the server, tftp log says "Connection Refused", but
the funny thing is that the client refused the connection.  I traced
the code where it printed "connection refused" and verified that the
server actually sent some data (do not know which file) and tried to
receive acknowledgement for it and failed to get any.
Do you have any ideas?
Thanks


Andrew Park
           
________________________________________________________________________ 
CDFlab Systems Administrator                       www.cdf.utoronto.ca |
GnuPG Signature              www.cdf.utoronto.ca/~apark/public_key.txt |
------------------------------------------------------------------------
