Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id OAA31433
	for <parisc-linux@puffin.external.hp.com>; Thu, 30 Nov 2000 14:22:31 -0700
Received: from unknown (HELO smtp.linuxcare.com) (216.88.157.131)
  by mailserv2.iuinc.com with SMTP; 30 Nov 2000 21:24:59 -0000
Received: from ottawa.linuxcare.com (HELO linuxcare.com) (216.208.98.2)
  by smtp.linuxcare.com with SMTP; 30 Nov 2000 21:24:56 -0000
Sender: adevries@mailserv2.iuinc.com
Message-ID: <3A26C612.2A44AE6@linuxcare.com>
Date: Thu, 30 Nov 2000 16:26:42 -0500
From: Alex deVries <adevries@linuxcare.com>
MIME-Version: 1.0
To: Kailashnath V Rampure <kailasr@webcash.com>
CC: parisc-linux@thepuffingroup.com, bame@noam.fc.hp.com, grundler@cup.hp.com
Subject: Re: [parisc-linux] Is there any sqlnet for Linux on HP
References: <5.0.0.25.0.20001130125058.00b02970@mail.webcash.com>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Kailashnath V Rampure wrote:
> I need to connect to database from the HP linux box to oracle. Is there any
> sqlnet client that can be installed on the server.

I'm assuming you mean HP PA-RISC Linux, not HP IA32/64 Linux.

No.  The only applications right now for parisc-linux are open source
ones, and we haven't touched any SQL client libraries.

Conceivably the DBI stuff should work, but I don't think anyone's really
tried.

- alex

- 
Alex deVries, Principal Solutions Architect, The Puffins at Linuxcare
613.562.2759 tel
alex@linuxcare.com, http://www.linuxcare.com/
Linuxcare, Support for the revolution.
