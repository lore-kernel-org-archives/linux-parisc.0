Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id VAA26694
	for <parisc-linux@puffin.external.hp.com>; Mon, 6 Dec 1999 21:49:29 -0700
Message-Id: <199912070450.XAA01363@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] a pretty big change
To: bame@debian.fc.hp.com (Paul Bame)
Date: Mon, 6 Dec 1999 23:50:01 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@thepuffingroup.com
In-Reply-To: <199912040128.SAA29635@debian.fc.hp.com> from "Paul Bame" at Dec 3, 99 06:28:23 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

After a day of hacking, I was finally able to link the kernel successfully.
It booted through to the end of realmode_setup.  Probably, further work is
needed on the TLB handler.  I wonder if calls between real and virt, and
visa versa are working.  No change to som_relocate was necessary.

There is one problem.  I now have to turn off the system power to get the
system to reboot.  Formerly, I could just press the TOC button.

It also looks like the "real_" defines and protos can be eliminated.

Dave
> 
> 
> Bad failures occur (for me) with the hpux boot loader.  I have no
> idea whether I introduced them, but I might have.  It looks
> like the first instruction of vmlinux doesn't even get executed,
> so probably something in the SOM header is telling the hpux boot loader to
> do something stupid.  som_relocate may need an upgrade, but I'm
> stumped about what's going wrong.
> 
> 	-P
> 
> ---------------------------------------------------------------------------
> To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com with
> `unsubscribe' as the subject.
> 
> 


-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
