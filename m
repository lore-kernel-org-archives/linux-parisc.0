Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA05553
	for <parisc-linux@puffin.external.hp.com>; Tue, 29 Feb 2000 11:03:01 -0700
From: willy@thepuffingroup.com
Date: Tue, 29 Feb 2000 12:03:49 -0500
To: Ulrich Strelow <ulrich_strelow@yahoo.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] make Image fails
Message-ID: <20000229120349.E9944@thepuffingroup.com>
References: <20000229143417.6180.qmail@web507.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20000229143417.6180.qmail@web507.mail.yahoo.com>; from Ulrich Strelow on Tue, Feb 29, 2000 at 06:34:16AM -0800
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Feb 29, 2000 at 06:34:16AM -0800, Ulrich Strelow wrote:
> Building the cvs version 20000227 with defconfig fails
> with unsatified symbol __cmpdi2.

[snip]

> I did not find any reference in the source code.
> Grepping through object files as well finds a
> reference in arch/parisc/hpux/fs.o and hpux.o.

__cmpdi2 is one of the `help, help, i don't know how to compile this
arithmetic op' symbols that gcc puts into libgcc1.  Let me have a look
and wee what's producing this.  It may vary depending on gcc version;
what version of gcc are you using?
