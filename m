Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA05637
	for <parisc-linux@puffin.external.hp.com>; Tue, 14 Nov 2000 16:16:16 -0700
Message-Id: <200011142318.PAA12473@milano.cup.hp.com>
To: Ian Zink <ian.zink@maryville.com>
Cc: "'parisc-linux@thepuffingroup.com'" <parisc-linux@thepuffingroup.com>
Subject: Re: [parisc-linux] Palinux on a 712/60 
In-reply-to: Your message of "Tue, 14 Nov 2000 17:08:33 PST."
             <C36304FE952AD411AC87002094120338029E7E@MTMAIL>
Date: Tue, 14 Nov 2000 15:18:10 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Ian Zink wrote:
> Thanks for the reply, Grant. However, the 712s do not have a serial console.
> They do have a com port, but it does not work as a console, unfortunately.

It does for linux. That's what the "Switching from PDC Console" is about.
Connect the serial cable to the com port and look at the output.
I've done it in the past and know it worked at least once.
I haven't tried it with the lasted ISO - no time to play w/712's now.

> So I need do need to get a STI enabled kernel. I dropped Paul Lahaie a note
> to see if he could send me such a kernel...

Paul just sent mail to the list indicating he's working on console issues.
Please let him work on it.
Trust me, he'll tell us when he's done. :^)

grant
