Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from vopserver.pflash.com (mail.pflash.com [207.19.136.5])
	by dsl2.external.hp.com (Postfix) with ESMTP id 92F11482A
	for <parisc-linux@lists.parisc-linux.org>; Mon,  4 Jun 2001 01:29:23 -0600 (MDT)
From: Michael S.Zick <mszick@pflash.com>
To: tomh@execpc.com
Date: Mon, 4 Jun 2001 02:09:32 -0500
Content-Type: text/plain
Cc: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Message-Id: <01060402282900.09662@wolf01.morethan.org>
Subject: [parisc-linux] Your 20-May-2001: Problems booting...
List-ID: <linux-parisc.vger.kernel.org>

HI -
I am new to this list, so am only now seeing your message.
Try this:
Manually boot - choosing the "boot xxxxx IPL" option.
Use the editor on the command line to make the following change:
console=3Dtty
to
console=3DttyB

That will by-pass the problem code (at least it does on my 9000/720) -
=3DttyB is 'magic' meaning to use the PDC console code.

The above change gets through the entire boot process - then locks
with "unable to open console device" message.  Which I believe just
means that /dev needs an entry for the ttyB device.  Perhaps, also a
new entry in /etc/inittab for the ttyB device.

If anyone knows what entry(s) is required to allow the ttyB console to be
used - please advise.

PS: I know how to edit the ramdisk image - just don't know what=20
entries to make.

In addition, a suggestion to the planners:
How about leaving all the access to the old PDC drivers in the code
and ramdisk images until V12.0 of pa-risc/linux so that people can
get past broken, new, code?

Mike
