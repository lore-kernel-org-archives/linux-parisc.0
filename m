Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id HAA06806
	for <parisc-linux@puffin.external.hp.com>; Fri, 8 Oct 1999 07:30:18 -0600
From: Steven Pritchard <steve@silug.org>
Message-Id: <199910081331.IAA25529@osiris.silug.org>
Subject: Re: [parisc-linux] compiling on a 735?
In-Reply-To: <199909271923.VAA29471@online.no> from Simen Thoresen at "Sep 27, 99 09:29:20 pm"
To: simen-tt@online.no (Simen Thoresen)
Date: Fri, 8 Oct 1999 08:31:22 -0500 (CDT)
Cc: parisc-linux@thepuffingroup.com
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

Simen Thoresen said:
[...]
> I've installed the 
> egcs, flex and make depots (the bash-depot seems to be non-
> existent, so I've compiled and installed it from gnu.org myself.

I couldn't figure this comment out when I first read it, but today I
finally noticed that the permissions on the 10.20 bash depot file were
wrong.  (Darn umask.)

It's fixed now.  Sorry about that.

Steve
-- 
steve@silug.org           | Linux Users of Central Illinois
(217)698-1694             | Meetings the 4th Tuesday of every month
Steven Pritchard          | http://www.luci.org/ for more info
