Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id HAA20114
	for <parisc-linux@puffin.external.hp.com>; Fri, 11 Aug 2000 07:33:27 -0600
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 11 Aug 2000 07:33:38 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id RAA08071;
	Fri, 11 Aug 2000 17:32:33 +1000
Date: Fri, 11 Aug 2000 17:32:33 +1000 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: David Huggins-Daines <dhd@linuxcare.com>
cc: parisc-linux@thepuffingroup.com, parisc@lists.linuxcare.com
Subject: Re: Millicode calls, GP register, ld -r
In-Reply-To: <Pine.LNX.4.21.0008111413410.29780-100000@front.linuxcare.com.au>
Message-ID: <Pine.LNX.4.21.0008111648380.29780-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On 10 Aug 2000, David Huggins-Daines wrote:

> Oh boy, it's worse.  It looks like $$dyncall has been clobbering %r19
> with bogus values all along, actually, because we're only using four
> bytes for our PLABELs, and it wants to load the linkage table pointer
> from the second (non-existent) word:
>

Hi David,

On thinking about this $$dyncall issue a bit more, what use are PLABELs in
PIC code anyway?  As far as I can see, PLABELs are used for two things:
1) to provide an unique address for a function
2) as a place to hang argument relocation information

We're not doing (2), and (1) is satisfied by the value in the PLTGOT.

So...  I can turn a PLABEL reference into a GOT reference, which will
magically fix the $$dyncall problem.

Comments?

Alan Modra
-- 
Linuxcare.  Support for the Revolution.
