Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id FAA29637
	for <parisc-linux@puffin.external.hp.com>; Sat, 11 Nov 2000 05:57:25 -0700
Received: from optushome.com.au (IDENT:yendor@rods.home.net.au [192.168.3.1])
	by rods.home.net.au (8.9.3/8.8.7) with ESMTP id MAA02719
	for <parisc-linux@thepuffingroup.com>; Sat, 11 Nov 2000 12:57:44 GMT
Sender: yendor@rods.home.net.au
Message-ID: <3A0D4245.1C8FB2B5@optushome.com.au>
Date: Sat, 11 Nov 2000 23:57:43 +1100
From: Rod Smart <snaketails@optushome.com.au>
MIME-Version: 1.0
To: parisc-linux@thepuffingroup.com
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] PA-RISC newbie
List-ID: <linux-parisc.vger.kernel.org>

    Hi there.

    I just purchased at a **VERY** cheap price, a HP Visualize C-180
RISC system from a CAD drafting company, this box included a 4Gb Hard
disk, a video card with unknown amount of memory (& daughter board,
assuming its memory upgrade) and system board RAM is fully loaded
(768Megs).

    I would like to run this system on Linux, and found the PA-RISC web
site from the www.linux.org web site :o)

    The system currently has HP-UX installed, but not having any
usernames or passwords, I cannot access the system from the prompt.

    I have read how to NFS-boot the HPbox from the message board, but I
couldn't figgure out where to find the kernel sources (or how I would be
able to compile them on the HPbox anyway).

    I downloaded the vmlinux kernel file from the ftp site and the
NFS-ROOT and installed both on my current Linux box (Pentium 133
pre-MMX) in the format of how it was layed out in ...

LINUX/PA-RISC NFSROOT HOWTO

    In there it states that you have to get the latest linux-2.3 tree
from CVS, but which CVS server I'm curious about as the ones on
ftp.kernel.org don't have "parisc" in the /arch/ branch, so where do I
find the CVS "tree" that I need to use?

    I seem to have the "STEP 2." section running, as from playing with
the system I had found my way into the PDC prompt and have played with
the "boot" function. I tried to boot the installation CD (on a drive I
have borrowed from work) of HP-UX and reinstall so I have access, as I
don't really care whats currently on the system..

    I'm not confident enough on how to create and burn a bootable CD to
try and boot the box that way, I still think the vmlinux kernel I
downloaded from the PA-RISC website has something to do with my problems
(or the permissions)

    I do know that the Hp is talking to the Linux box (apart from the
lack of logged info) I get a report in /var/log/secure and messages that
the HP box has attempted a bootp session, but the HP box reports
something along the lines that the booting code was not found.

    So, if anyone has any ideas on how to help me, I would be
appreciated ;o)

    Oh, what *is* the RAM modules in the Hp systems anyway (apart from
the obvious 64Mx72-pin SIMM)

    Thank you for your time and help :o)

    PS. I would prefer replies to my E-mail address as I generally
forget to surf the net reading mailing lists....
