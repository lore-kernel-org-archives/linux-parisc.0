Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA22714
	for <parisc-linux@puffin.external.hp.com>; Fri, 11 Aug 2000 16:01:38 -0600
Received: from unknown (HELO smtp.linuxcare.com) (216.88.157.131)
  by mailserv2.iuinc.com with SMTP; 11 Aug 2000 16:01:48 -0000
Received: from dis.i.linuxcare.com (HELO vodka.thepuffingroup.com) (192.168.1.57)
  by db1.i.linuxcare.com with SMTP; 11 Aug 2000 16:01:24 -0000
Date: Fri, 11 Aug 2000 10:56:47 -0400
From: Matthew Wilcox <matthew@wil.cx>
To: Jeffrey A Law <law@cygnus.com>
Cc: Alan Modra <alan@linuxcare.com.au>,
        David Huggins-Daines <dhd@linuxcare.com>,
        parisc-linux@thepuffingroup.com, parisc@lists.linuxcare.com
Subject: Re: Millicode calls, GP register, ld -r
Message-ID: <20000811105647.N10843@vodka.thepuffingroup.com>
References: <Pine.LNX.4.21.0008111648380.29780-100000@front.linuxcare.com.au> <1523.965997036@upchuck>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1523.965997036@upchuck>; from Jeffrey A Law on Fri, Aug 11, 2000 at 06:30:36AM -0600
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Aug 11, 2000 at 06:30:36AM -0600, Jeffrey A Law wrote:
> The other way it's used is to handle intra-space calls/returns.  I don't know
> if that's an issue for y'all or not.

we just use one space for each process, so we never call into a different
space, except to do syscalls.

-- 
Revolutions do not require corporate support.
