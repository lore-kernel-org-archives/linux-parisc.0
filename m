Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id AAA13988
	for <parisc-linux@puffin.external.hp.com>; Sat, 2 Oct 1999 00:53:09 -0600
To: Grant Grundler <grundler@cup.hp.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] commit FP coproc enable code? 
Reply-To: law@cygnus.com
In-reply-to: Your message of Fri, 01 Oct 1999 13:52:53 PDT.
             <199910012052.NAA13364@milano.cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sat, 02 Oct 1999 00:03:57 -0600
Message-ID: <24837.938844237@upchuck.cygnus.com>
From: Jeffrey A Law <law@cygnus.com>
List-ID: <linux-parisc.vger.kernel.org>

  In message <199910012052.NAA13364@milano.cup.hp.com>you write:

  > > Why is not using PDC_COPROC not the right way ?
  > > It should do exactly the same
  > > thing, modulo machines without FPU (for which we do not provide emulation
  > > anyway) and firmware bugs ...
  > 
  > You are right.
  > But I'm lazy and I don't care right now about machines older than PA 1.1.
  > Someone who cares about PA 1.0 can implement that.
I would recommend ignoring PA1.0 -- the only machines with PA1.0 processors
are radically different than the machines y'all are targeting.  The effort
would be spent on PA2.0 :-)


jeff
