Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA04508
	for <parisc-linux@puffin.external.hp.com>; Tue, 21 Nov 2000 11:57:09 -0700
Message-Id: <200011211859.KAA20186@milano.cup.hp.com>
To: Robert Reilly <robert.reilly@gecapital.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] cd .5 
In-reply-to: Your message of "Tue, 21 Nov 2000 18:26:41 PST."
             <20001121.18264100@opti.rfs.capital.ge.com>
Date: Tue, 21 Nov 2000 10:59:24 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Robert Reilly wrote:
> Hi All,
> I have HP9000/d212 I was able to boot off the cdrom image no problem, 
> however when I get the login prompt I am only able to type in two 
> characters and the screen redraws itself and prompts me for a login. I am 
> using a HP700 serial terminal on ttyS0. I briefly scanned the mailing list 
> but did not find anything. Any help would be appreciated.

Robert,
I would suspent the terminal isn't configured correctly for the
serial connection. Is it set up for 9600 baud, 8 data bits, no parity,
1 stop bit?

I'm pretty sure you have the baud rate correct since you get a login
prompt. I'm not sure all the other things must be correct to get 
that far.

I'm not familiar with "HP700 serial terminal". But all the HP terminals
I've worked with in the past also support vt100 emulation mode. You
probably want to set that too.

grant

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
