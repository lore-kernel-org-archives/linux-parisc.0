Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id OAA15702
	for <parisc-linux@puffin.external.hp.com>; Wed, 16 Aug 2000 14:18:00 -0600
Received: from ottawa.linuxcare.com (HELO localhost) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 16 Aug 2000 14:18:23 -0000
To: "T. Martin" <catfish@alltel.net>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Question about compatibility...
References: <Pine.LNX.4.10.10008151425530.28284-100000@jesse.crash.lan> <20000815144305.A7757@vodka.thepuffingroup.com>
From: David Huggins-Daines <dhd@linuxcare.com>
Date: 16 Aug 2000 10:18:01 -0400
In-Reply-To: Matthew Wilcox's message of "Tue, 15 Aug 2000 14:43:05 -0400"
Message-ID: <8766p18f3a.fsf@linuxcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Matthew Wilcox <matthew@wil.cx> writes:

> On Tue, Aug 15, 2000 at 02:31:45PM -0500, T. Martin wrote:
> >  Hey I just had a thought is there anyway that Linux is going to be
> > binary compatible with HP-Unix like Alpha-Linux can run Tru64 bins if
> > theyre statically compiled. 
> 
> linux-2.3/arch/parisc/hpux/ say anything to you?  :-)

I might add that Linux on Alpha can run dynamically linked Tru64
binaries too as long as you have the Tru64 dynamic loader and libs
installed :-)

We're hoping that this will eventually work on Linux/PA-RISC too.

-- 
dhd@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.
