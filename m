Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id TAA06940
	for <parisc-linux@puffin.external.hp.com>; Thu, 30 Nov 2000 19:29:29 -0700
Date: Thu, 30 Nov 2000 19:19:09 -0700
From: Randolph Chung <randolph@tausq.org>
To: Alex deVries <adevries@linuxcare.com>
Cc: Kailashnath V Rampure <kailasr@webcash.com>,
        parisc-linux@thepuffingroup.com, bame@noam.fc.hp.com,
        grundler@cup.hp.com
Subject: Re: [parisc-linux] Is there any sqlnet for Linux on HP
Message-ID: <20001130191909.D18385@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <5.0.0.25.0.20001130125058.00b02970@mail.webcash.com> <3A26C612.2A44AE6@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3A26C612.2A44AE6@linuxcare.com>; from adevries@linuxcare.com on Thu, Nov 30, 2000 at 04:26:42PM -0500
List-ID: <linux-parisc.vger.kernel.org>

> I'm assuming you mean HP PA-RISC Linux, not HP IA32/64 Linux.
> 
> No.  The only applications right now for parisc-linux are open source
> ones, and we haven't touched any SQL client libraries.
> 
> Conceivably the DBI stuff should work, but I don't think anyone's really
> tried.

presumably the DBD Oracle library still links the the oracle sqlnet
libraries, so i doubt this will work.

randolph
-- 
   @..@                                         http://www.TauSq.org/
  (----)
 ( >__< )
 ^^ ~~ ^^
