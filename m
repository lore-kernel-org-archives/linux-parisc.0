Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp8.xs4all.nl (smtp8.xs4all.nl [194.109.127.134])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0C52C482A
	for <parisc-linux@lists.parisc-linux.org>; Sat, 25 Aug 2001 06:00:29 -0600 (MDT)
Received: from rivierenland.xs4all.nl (rivierenland.xs4all.nl [194.109.14.47])
	by smtp8.xs4all.nl (8.9.3/8.9.3) with ESMTP id OAA10759
	for <parisc-linux@lists.parisc-linux.org>; Sat, 25 Aug 2001 14:00:26 +0200 (CEST)
From: thunder7@xs4all.nl
Date: Sat, 25 Aug 2001 13:52:06 +0200
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20010825135206.A1049@middle.of.nowhere>
Reply-To: thunder7@xs4all.nl
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] hang on C200 after 'Set default PSW W bit to 0' in 0.9.2
List-ID: <linux-parisc.vger.kernel.org>

I just received my C200, 512 Mb, 9 Gb, Visualize FX-4 - all in all a
cool piece of equipment.

Next step: installing Linux.

So I downloaded the 0.9.2 iso from puffin, the md5sum was OK, I made a
CD, I could read that CD on my Intel linux box, all seemed fine.

The C200 did boot HPUX-10.2, so the hardware seemed functional.

So I entered my new CD and rebooted the C200. I set the clock, and typed
'BOOT SESCSI.2'. It found the CD, some messages about memory, then the
line

Set default PSW W bit to 0

and then nothing.

I know booting with a keyboard/mouse attached to the C200 would be
risky, but I don't think it should go wrong so early in the booting
process?

I tried to boot it without keyboard/mouse attached, but Minicom kept
saying it was 'offline', and I didn't get anything on the monitor
attached to the C200. I am suspecting this serial cable (do I need a 1:1
or an interlink serial cable? This is supposed to be a 1:1 one).

Could this be a firmware-matter? I looked into updating the firmware,
but I'll need some additional scsi-converter to connect my DDS-2 drive
to the external scsi-port, since there seems to be no other way to
update firmware.

Should there happen something after 'Set default PSW W bit to 0' with
this setup? Is the standard command-line of this image correct? I tried
changing it to 'sti=1' but that didn't make any difference....

Thanks,
Jurriaan
-- 
The Swedish Chef has been assimilated. "Borg borg borg!"
GNU/Linux 2.4.8-ac9 SMP/ReiserFS 2x1402 bogomips load av: 0.53 0.15 0.05
