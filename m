Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id UAA14127
	for <parisc-linux@puffin.external.hp.com>; Sun, 26 Nov 2000 20:09:19 -0700
Message-Id: <200011270311.TAA24728@milano.cup.hp.com>
To: "Carl & Delores Walthall" <cwalthall@cwalthall.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] RPM and hppa 
In-reply-to: Your message of "Sun, 26 Nov 2000 11:47:24 PST."
             <008601c057d0$efcd5800$10f01618@ct44715a>
Date: Sun, 26 Nov 2000 19:11:41 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

"Carl & Delores Walthall" wrote:
> Hi All
> 
>  I have a HP9000 J200 server and would like to find the operating system
> software for it. Can you tell me where to look on the internet or who I may
> call?

Carl,
The short answer is a port of linux to the J200 is in progress.
See http://www.parisc-linux.org/ for status.

If you have more questions read the FAQ and check the mailing list
archives using http://puffin.external.hp.com/cgi-bin/mailgrep first please.


> The server has a OS installed but no one can remember the user or password
> information. So they gave it to me to take home, is there a way to boot
> it on a floppy and change this information?

Here's how to "fix" this:
During power up/boot press <ESC> key to get "BOOT ADMIN>" prompt.
type "bo pri isl".  At "ISL>" prompt, type "hpux -is".
HPUX should boot to single user. use "mountall" or "mount -a" to
mount all file systems. Then you can "vi /etc/passwd" or "passwd root".

If that doesn't work and you can afford to loan the box out for a
3-4 monthes, you might ask if someone could install parisc-linux
on it for you in exchange for a few monthes use.

grant

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
