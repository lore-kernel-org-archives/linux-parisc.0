Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id JAA31749
	for <parisc-linux@puffin.external.hp.com>; Tue, 7 Dec 1999 09:51:32 -0700
Message-Id: <199912071653.JAA18644@debian.fc.hp.com>
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] a pretty big change 
In-reply-to: Your message of "Mon, 06 Dec 1999 23:50:01 EST."
             <199912070450.XAA01363@hiauly1.hia.nrc.ca>
Date: Tue, 07 Dec 1999 09:53:02 -0700
From: Paul Bame <bame@debian.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

= After a day of hacking, I was finally able to link the kernel successfully.
= It booted through to the end of realmode_setup.  Probably, further work is
= needed on the TLB handler.  I wonder if calls between real and virt, and
= visa versa are working.  No change to som_relocate was necessary.

Glad you had better luck with the HPUX boot loader than I had.

= There is one problem.  I now have to turn off the system power to get the
= system to reboot.  Formerly, I could just press the TOC button.

That happens pretty frequently to me but I've not tracked down why
it happens.  Did you try holding the TOC button in for several seconds?
On some workstations I've been told that generates a hard reset.

= It also looks like the "real_" defines and protos can be eliminated.

As I merge in your changes I'll look into that.

	-P
