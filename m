Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id VAA10265
	for <parisc-linux@puffin.external.hp.com>; Fri, 7 Jan 2000 21:46:40 -0700
From: Steven Pritchard <steve@silug.org>
Message-Id: <200001080449.WAA13881@osiris.silug.org>
Subject: Re: [parisc-linux] 9000/712 & Samsung Monitor
In-Reply-To: <20000108031537.A2522@gonzo.ns03.de.uu.net> from Michael Schulz at "Jan 8, 0 03:15:37 am"
To: micha28@gmx.de
Date: Fri, 7 Jan 2000 22:49:12 -0600 (CST)
Cc: parisc-linux@thepuffingroup.com
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

Michael Schulz said:
> I can get a 712/60 almost complete, but without a monitor.
> So my question is, is it possible to connect a Samsung
> Syncmaster 17GLsi with the HP.

I don't know the first thing about 712s, but I was amazed to discover
that if you do "path console graphics.7" (and then "reset") at the
"BOOT_ADMIN>" prompt on a 715/100, you'll get 640x480 graphics
suitable for a VGA monitor.  Doing "path console graphics" lists the
various choices...

BOOT_ADMIN> path console graphics
        Monitor Choices
Type     Resolution     Frequency
----     ----------     ---------
  1      1280x1024        72Hz
  2      1024x768         75Hz
  3      1024x768         70Hz
  4      1024x768         75Hz     Flat Panel
  5      1280x1024        60Hz
  6      1024x768         60Hz
  7       640x480         60Hz
  8      1280x1024        75Hz     VESA
  9      1024x768         75Hz     VESA
 10       800x600         75Hz     VESA
 11       640x480         75Hz     VESA
 12      1280x1024        72Hz     Greyscale
 13      1280x1024        50Hz

If a 712/60 will do the same, then surely when of the lower
resolutions or frequencies would work...

Steve
-- 
steve@silug.org           | Linux Users of Central Illinois
(217)698-1694             | Meetings the 4th Tuesday of every month
Steven Pritchard          | http://www.luci.org/ for more info
