Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id UAA04841
	for <parisc-linux@puffin.external.hp.com>; Tue, 4 Jul 2000 20:36:50 -0600
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 5 Jul 2000 02:38:10 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id MAA01883;
	Wed, 5 Jul 2000 12:38:00 +1000
Date: Wed, 5 Jul 2000 12:38:00 +1000 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: bame@riverrock.org
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Get rid of %r8 linker stubs
In-Reply-To: <m139eMc-001VsnC@chalet>
Message-ID: <Pine.LNX.4.21.0007051204580.31061-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Tue, 4 Jul 2000 bame@riverrock.org wrote:

> So unless we get to change how .init works (ugly hacks to gas perhaps?
> I hope not) I think a special case in the linker is required.  I just
> hope there's some sort of attribute on these magic kludge segments which
> the linker can use rather than hard-coding the names or something.

The linker patch I just checked in to puffin cvs is of the "magic
kludge" variety.  ie. Input sections named .init* and .fini* are handled
specially.  A more general approach would be to group stubs by output
section, at least for output sections that are small enough to be sure
that the stubs can be reached.  The extra work to do this isn't that
difficult - but it's a bit more than my quick fix.

Regards, Alan Modra
-- 
Linuxcare.  Support for the Revolution.
