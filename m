Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id UAA05527
	for <parisc-linux@puffin.external.hp.com>; Tue, 5 Dec 2000 20:51:39 -0700
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 6 Dec 2000 03:54:13 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id OAA00427;
	Wed, 6 Dec 2000 14:53:37 +1100
Date: Wed, 6 Dec 2000 14:53:37 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Matthew Wilcox <matthew@wil.cx>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] binary compatibility
In-Reply-To: <20001205193057.C12682@parcelfarce.linux.theplanet.co.uk>
Message-ID: <Pine.LNX.4.21.0012061440160.16721-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Tue, 5 Dec 2000, Matthew Wilcox wrote:

> how much do people care if i break binary compatibility again?

I'd be a hypocrite if I did, as I've broken it a number of times.  :)

> i suppose the pain of this would be mitigated if there were other changes
> to the abi that people wanted to make and we could make them all at the
> same time.
> 
> ideas?

o  Remove millicode stuff from libgcc, and make a libmill.a  Support code
   to automagically look for -lmilli is already in ld, but disabled as ld
   will complain if it can't find libmilli.a.
o  Switch over to using dwarf2 unwind for c++ exception handling.

Alan
-- 
Linuxcare.  Support for the Revolution.
