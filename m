Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA01462
	for <parisc-linux@puffin.external.hp.com>; Sat, 11 Nov 2000 16:31:49 -0700
Message-Id: <200011112338.PAA09398@milano.cup.hp.com>
To: Rod Smart <snaketails@optushome.com.au>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] PA-RISC newbie 
In-reply-to: Your message of "Sat, 11 Nov 2000 23:57:43 PST."
             <3A0D4245.1C8FB2B5@optushome.com.au>
Date: Sat, 11 Nov 2000 15:38:58 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Rod Smart wrote:
>     Hi there.
> 
>     I just purchased at a **VERY** cheap price, a HP Visualize C-180
> RISC system from a CAD drafting company, this box included a 4Gb Hard
> disk, a video card with unknown amount of memory (& daughter board,
> assuming its memory upgrade) and system board RAM is fully loaded
> (768Megs).
> 
>     I would like to run this system on Linux, and found the PA-RISC web
> site from the www.linux.org web site :o)
> 
>     The system currently has HP-UX installed, but not having any
> usernames or passwords, I cannot access the system from the prompt.

Yes you can. You just need to know how.

Interrupt the boot process to get a "BOOT ADMIN" prompt (or whatever
it's called - Boot Console Handler).
Then "boot primary isl" (shortened to bo pri isl)
You should have an "ISL>" prompt now.
ISL> hpux -is
And you will boot to single user state with a shell.
mountall and you should have the regular tools too.
vi /etc/passwd to your hearts content.

"There is no such thing at security with out physical security".

..
>     I'm not confident enough on how to create and burn a bootable CD to
> try and boot the box that way, I still think the vmlinux kernel I
> downloaded from the PA-RISC website has something to do with my problems
> (or the permissions)
>

You can dd the ISO image to a regular hard disk (ie /dev/sdc) and move
that disk over to the C180. Then boot from that disk.
