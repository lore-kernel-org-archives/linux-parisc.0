Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id NAA30004
	for <parisc-linux@puffin.external.hp.com>; Tue, 19 Oct 1999 13:44:16 -0600
Message-ID: <19991019161327.A15943@thepuffingroup.com>
Date: Tue, 19 Oct 1999 16:13:27 -0400
From: Phil Schwan <pschwan@thepuffingroup.com>
To: Grant Grundler <grundler@cup.hp.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] LASI and serial port initialization
References: <199910191732.LAA14850@fast.cs.utah.edu> <199910191836.LAA27611@milano.cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <199910191836.LAA27611@milano.cup.hp.com>; from Grant Grundler on Tue, Oct 19, 1999 at 11:36:50AM -0700
List-ID: <linux-parisc.vger.kernel.org>

On Oct 19, Grant Grundler wrote:
> I agree the pre-init buffering is perfectly acceptable. No problem.

I think the point that many people have noted (regarding ports to new
platforms and seeing data before the console is up) is worth thinking
about.  Why not register an IODC console immediately, and then
register a preferred console once it becomes available?

-Phil
