Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id UAA24632
	for <parisc-linux@puffin.external.hp.com>; Fri, 11 Aug 2000 20:24:13 -0600
Received: from ottawa.linuxcare.com (HELO localhost) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 11 Aug 2000 20:24:28 -0000
To: Alan Modra <alan@linuxcare.com.au>
Cc: parisc-linux@thepuffingroup.com, parisc@lists.linuxcare.com
Subject: Re: Millicode calls, GP register, ld -r
References: <Pine.LNX.4.21.0008111648380.29780-100000@front.linuxcare.com.au>
From: David Huggins-Daines <dhd@linuxcare.com>
Date: 11 Aug 2000 16:23:56 -0400
In-Reply-To: Alan Modra's message of "Fri, 11 Aug 2000 17:32:33 +1000 (EST)"
Message-ID: <87zomjmtr7.fsf@linuxcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Alan Modra <alan@linuxcare.com.au> writes:

> So...  I can turn a PLABEL reference into a GOT reference, which will
> magically fix the $$dyncall problem.

Yes, that's the right idea.  However it only works for external
symbols, and you still need a PLABEL32 relocation for function
pointers to local symbols within a shared object (like dl_main for
instance, hint hint :-)

I'll try to take a shot at it but I still don't fully comprehend the
BFD code.

-- 
dhd@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.
