Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id CAA32571
	for <parisc-linux@puffin.external.hp.com>; Thu, 20 Jul 2000 02:22:12 -0600
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 20 Jul 2000 08:23:55 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id SAA24770;
	Thu, 20 Jul 2000 18:23:38 +1000
Date: Thu, 20 Jul 2000 18:23:38 +1000 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: parisc-linux@thepuffingroup.com
cc: lrisc-Linux <parisc-linux@thepuffingroup.com>
Subject: Re: [parisc-linux] Anonymous CVS out of sync ?
In-Reply-To: <20000720090508.A28972@grccd310.grc.hp.com>
Message-ID: <Pine.LNX.4.21.0007201806550.12268-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=X-UNKNOWN
List-ID: <linux-parisc.vger.kernel.org>

On Thu, 20 Jul 2000, Ingo Matthaes wrote:

> I wasn´t able to sync my tree with puffin´s since a couple of
> days. Especially I am missing amodras binutils-2.10 commits.
> I there a special tag for the latest changes ?

You've been peeking at the cvs commits? :-)  That should have told you
that the tag is "shared".

I wasn't going to make any public announcements here yet, as the PIC and
shared library stuff is still highly experimental (ie. doesn't work).
Don't switch to the "shared" tag unless you enjoy fixing bugs, and bugs of
the design variety rather than just simple typos/oversights.  For
instance, today I've been busy redoing the .plt handling which was
completely broken.

Alan Modra
-- 
Linuxcare.  Support for the Revolution.
