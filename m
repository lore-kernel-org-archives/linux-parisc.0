Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA12569
	for <parisc-linux@puffin.external.hp.com>; Mon, 27 Mar 2000 11:56:44 -0700
From: Steven Pritchard <steve@silug.org>
Message-Id: <200003271854.MAA20907@osiris.silug.org>
Subject: Re: [parisc-linux] some questions
In-Reply-To: <20000326185256.A29700@thepuffingroup.com> from "willy@thepuffingroup.com"
 at "Mar 26, 2000 06:52:56 pm"
To: willy@thepuffingroup.com
Date: Mon, 27 Mar 2000 12:54:21 -0600 (CST)
CC: parisc-linux@thepuffingroup.com
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

willy@thepuffingroup.com said:
> cool, I didn't know XFree had been ported to hpux 10.10.  In fact,
> I can't see any mention of it on the XFree site, so this intrigues me
> quite a lot.

X11R6.4 compiles on HP-UX (10.20, at least), right out of the box.  I
ran it on a 715 (or was that a 735?) for a while (for some reason that
I can't remember).  I seem to recall that I compiled the server from
the XFree 3.3.x sources once also.  (I really only wanted the XFree
xterm.)

Anyway, it works, but it doesn't have any of the fancy color-recovery
extensions that the "real" HP-UX X server comes with.  It probably
also won't work with anything but really old graphics hardware, but it
would be worth a try...

Steve
-- 
steve@silug.org           | Linux Users of Central Illinois
(618)398-7320             | Meetings the 4th Tuesday of every month
Steven Pritchard          | http://www.luci.org/ for more info
