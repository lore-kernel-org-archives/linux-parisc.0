Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id JAA19523
	for <parisc-linux@puffin.external.hp.com>; Thu, 18 May 2000 09:32:56 -0600
To: Alan Modra <alan@linuxcare.com.au>
cc: Philipp Rumpf <prumpf@puffin.external.hp.com>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] New binutils available from cvs 
Reply-To: law@cygnus.com
In-reply-to: Your message of Thu, 18 May 2000 21:09:09 +1000.
             <Pine.LNX.4.21.0005182055320.6449-100000@front.linuxcare.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 18 May 2000 09:23:37 -0600
Message-ID: <2003.958663417@upchuck>
From: Jeffrey A Law <law@cygnus.com>
List-ID: <linux-parisc.vger.kernel.org>


  In message <Pine.LNX.4.21.0005182055320.6449-100000@front.linuxcare.com.au>yo
u write:
  > On Thu, 18 May 2000, Philipp Rumpf wrote:
  > 
  > > > Using `!' for comments
  > > > a) breaks fp condition codes.
  > > 
  > > No, it doesn't.  The condition code for fp "not equal" is "<>", not "!=".
  > 
  > I'm talking about floating point compare instruction conditions, for
  > example: "fcmp,dbl,!?>= %fr4,%fr5"
Alan is correct.  A large number of the FP comparisons use '!'.  

jeff
