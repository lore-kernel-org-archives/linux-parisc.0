Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp.petescaff.com (petem.xs4all.nl [194.109.247.92])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1B3DE482A
	for <parisc-linux@parisc-linux.org>; Fri, 14 Dec 2001 07:37:25 -0700 (MST)
Date: Fri, 14 Dec 2001 15:37:20 +0100 (CET)
From: Peter Mottram <peter@petescaff.com>
To: Tommi Aihkisalo <tommi.aihkisalo@vtt.fi>
Cc: parisc <parisc-linux@parisc-linux.org>
Subject: Re: [parisc-linux] Network bootproblem with 712/80
In-Reply-To: <000b01c184a9$3f00a1b0$7862bc82@ele.vtt.fi>
Message-ID: <Pine.LNX.4.42.0112141532470.29092-100000@r6.petescaff.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Hello Tommi

On Fri, 14 Dec 2001, Tommi Aihkisalo wrote:

> Hello all!
>
> I am having a problem with my 712/80 when booting with bootp/tftp. With some
> effort I got it requesting kernel image (lifimage) over the network. The

[SNIP]

I too have just tried a net boot of 0.9.3 from a remote location and also
failed. I noticed MUCH too late that the lifimage contains the following
files:

    0/vmlinux32 3122078 bytes @ 0x7800
    0/vmlinux64 3990942 bytes @ 0x302000
    0/ramdisk 1946807 bytes @ 0x6d0800

But PALO chooses a default kernel path of

    0/linux

I assume that is simply that the PALO definition in the lifimage is
incorrect. Once I get my remote button pusher to power cycle the system
for me (she is out shopping right now) I will try an interactive boot &
change the command line to boot the correct kernel.

If you get chance to try this before me then please let me know how it
goes.

Cheers
PeteM
