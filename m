Return-Path: <ajwalker@broadpark.no>
Received: from mail.broadpark.no (mail.broadpark.no [217.13.4.2])
	by dsl2.external.hp.com (Postfix) with ESMTP id DA7754930
	for <parisc-linux@lists.parisc-linux.org>;
	Thu, 18 Mar 2004 03:27:53 -0700 (MST)
Received: from tolstoy.puszczka.com (47.80-202-73.nextgentel.com
	[80.202.73.47])
	by mail.broadpark.no (Postfix) with ESMTP id 008078CAC
	for <parisc-linux@lists.parisc-linux.org>;
	Thu, 18 Mar 2004 11:27:52 +0100 (MET)
Message-ID: <16612.193.161.152.244.1079606178.squirrel@www.puszczka.com>
Date: Thu, 18 Mar 2004 11:36:18 +0100 (CET)
Subject: [parisc-linux] Re: No PS2 keyboard/mouse on B132L, 2.6.[34]
From: "Andy Walker" <ajwalker@broadpark.no>
To: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

> ----- Original Message -----
> From: "Helge Deller" <deller@gmx.de>
>> > > Maybe it's a timing issue ?
>> >
>> > Apparently, it was.  I now have keyboard and mouse support.
>> > I set the delay to 12.
>> Did you tried any other values between 6 and 12 ?
>> If a lower value works for you, I would like to put this one in the
> source....
>
> Helge,
>
> I'll try playing with the delay on the B132L as well and report back.
Time to compile....
>
> -Andy


I realized just after sending that mail that the delay was a wild goose
chase in my case. What I really needed to test was unplugging the KVM and
hooking up a mouse directly. Done that now, with a Logitech
MouseMan and my Labtec wireless roller mouse. Both of these get detected
okay.

I added a few debug statements in atkbd_probe() and found that the
combination of the GSC ps/2 and the KVM fail ATKBD_CMD_GETID on the mouse
port. The default action in this case is to call
ATKBD_CMD_SETLEDS - seems a bit haphazard and not something you'd
want to be doing to a mouse (or a KVM emulating a mouse). The SETLEDS
command fails in gscps2.c with a timeout (timeout writing byte 0xed which
is the second byte of 0x10ed == SETLEDS).

At this point I believe the GSC ps/2 port is stuck, so the subsequent
mouse probe fails too (need more debug statements to prove this - later).

On a PC running 2.6.3 all this just seems to work, even with the KVM.
ATKBD_CMD_GETID succeeds and tells the system that this isn't a
keyboard, and everything proceeds normally. So the problem seems to be
something in the interraction between the GSC ps/2 port and the KVM. I'm
not giving up on this yet as I really want to use this
machine with the KVM.

cheers,
-Andy
