Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id JAA14187
	for <parisc-linux@puffin.external.hp.com>; Wed, 24 Jan 2001 09:57:38 -0700
Received: from parcelfarce.linux.theplanet.co.uk (HELO www.linux.org.uk) (195.92.249.252)
  by mailserv2.iuinc.com with SMTP; 24 Jan 2001 17:01:30 -0000
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14LTIE-0004br-00; Wed, 24 Jan 2001 17:01:10 +0000
Date: Wed, 24 Jan 2001 17:01:10 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: Christoph Plattner <christoph.plattner@alcatel.at>
Cc: Marek GROSSMAN <grossman@nspuh.cz>, parisc-linux@thepuffingroup.com,
        christoph.plattner@dot.at
Subject: Re: [parisc-linux] Boot from tape
Message-ID: <20010124170110.B4836@parcelfarce.linux.theplanet.co.uk>
References: <3A6EE1A6.D21F249F@nspuh.cz> <3A6F02F2.3C4A137C@alcatel.at>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3A6F02F2.3C4A137C@alcatel.at>; from christoph.plattner@alcatel.at on Wed, Jan 24, 2001 at 05:29:38PM +0100
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Jan 24, 2001 at 05:29:38PM +0100, Christoph Plattner wrote:
> How can you run Linux ?
> I thought, HP E55 (9000/856) is not full supported, as
> the SCSI driver and the serial multiplexer (8-port serial,
> where my console is configured to port 0) is not supported
> (no driver !).
> Or is there any, and I don't know it ??

If someone wants to put some effort into it... (hint: i don't)

the PDC spec (available from www.parisc-linux.org/documentation.html)
includes calls to perform block io.  there's no practical reason
someone couldn't write drivers/block/pdc.c which performed IO through
this mechanism.  performance would suck, but at least it would work.

-- 
Revolutions do not require corporate support.
