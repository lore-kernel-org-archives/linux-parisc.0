Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA21740
	for <parisc-linux@puffin.external.hp.com>; Fri, 11 Aug 2000 12:31:57 -0600
Received: from upchuck.cygnus.com (cse.cygnus.com [205.180.230.236])
	by runyon.cygnus.com (8.8.7-cygnus/8.8.7) with ESMTP id FAA05324
	for <parisc-linux@thepuffingroup.com>; Fri, 11 Aug 2000 05:30:58 -0700 (PDT)
To: Alan Modra <alan@linuxcare.com.au>
cc: David Huggins-Daines <dhd@linuxcare.com>, parisc-linux@thepuffingroup.com,
        parisc@lists.linuxcare.com
Subject: Re: Millicode calls, GP register, ld -r 
Reply-To: law@cygnus.com
In-reply-to: Your message of Fri, 11 Aug 2000 17:32:33 +1000.
             <Pine.LNX.4.21.0008111648380.29780-100000@front.linuxcare.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 11 Aug 2000 06:30:36 -0600
Message-ID: <1523.965997036@upchuck>
From: Jeffrey A Law <law@cygnus.com>
List-ID: <linux-parisc.vger.kernel.org>


  In message <Pine.LNX.4.21.0008111648380.29780-100000@front.linuxcare.com.au>y
ou write:
  > 
  > Hi David,
  > 
  > On thinking about this $$dyncall issue a bit more, what use are PLABELs in
  > PIC code anyway?  As far as I can see, PLABELs are used for two things:
  > 1) to provide an unique address for a function
  > 2) as a place to hang argument relocation information
  > 
  > We're not doing (2), and (1) is satisfied by the value in the PLTGOT.
  > 
  > So...  I can turn a PLABEL reference into a GOT reference, which will
  > magically fix the $$dyncall problem.
  > 
  > Comments?
The other way it's used is to handle intra-space calls/returns.  I don't know
if that's an issue for y'all or not.

jeff

jeff
