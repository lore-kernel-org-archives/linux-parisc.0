Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from beloit.edu (beloit.edu [144.89.40.1])
	by dsl2.external.hp.com (Postfix) with ESMTP id 22F19482B
	for <parisc-linux@lists.parisc-linux.org>; Thu, 25 Oct 2001 15:12:02 -0600 (MDT)
Received: from localhost ([144.89.185.182])
	by beloit.edu (AIX4.3/8.9.3/8.9.0) with ESMTP id QAA22004
	for <parisc-linux@lists.parisc-linux.org>; Thu, 25 Oct 2001 16:06:54 -0500
Date: Thu, 25 Oct 2001 16:12:00 -0500
Mime-Version: 1.0 (Apple Message framework v472)
Content-Type: text/plain; charset=US-ASCII; format=flowed
From: Daniel Williams <dan@bigw.org>
To: parisc-linux@lists.parisc-linux.org
Message-Id: <EDDF6AE3-C98C-11D5-BDE1-0030657D1C94@bigw.org>
Subject: [parisc-linux] How to Boot CD on C110
List-ID: <linux-parisc.vger.kernel.org>

I've got a C110...  I picked up the .9 ISO and burned it with EasyCD 
Creator on a Win2k box (I know, I know, but no access to a linux box 
right now, I'm running FreeBSD and it doesn't have a burner).  Popped it 
in and it won't boot.  Too bad the firmware doesn't see the SCSI CD 
either, when SEArching on bootup.  Both the fixed disks in the unit have 
been wiped, so I have no OS to start from.

SCSI CD is ID 2, but what bus is it on?  The only one I can find 
mentioned is 'core.FWSCSI'.  Trying to 'boot SESCSI.2' doesn't work.  
When I try to boot 'boot core.FWSCSI.2.0'  (the CD as far as I can 
guess) it asks about the interactive thing, I type 'y', then it says 
that it failed to boot and spits out a bunch of numbers onscreen.  Oh, 
when the CD is in the CD drive, the access light on the CD flashes on 
and off steadily, like its being read every second or so, even when the 
machine is doing nothing with it.  Happens when the CD drive is in an 
external box connected to the SE SCSI port on the back too.  Happens on 
the internal 50 pin SE bus as well.

The README-ISO for the boot CD mentions:
 >    After the ISO image is mastered, but before you burn any CDs,
 >    change to this directory and run 'palo -f iso.conf'.  The name
 >    of the ISO image is inside the .conf file and you'll probably
 >    have to change that.
 >    The ISO image is now bootable.  Burn and boot it.

However, I don't have linux anywhere and can't run palo -f iso.conf from 
anything, much less anything with a CD burner.  Is there any way that I 
can make this CD bootable or coax the  machine into booting the raw ISO 
I burned?  Preferably using a Win2k box.  I did a direct burn from ISO 
in EasyCD Creator and it reads fine from any computer I throw it in, 
just doesn't boot on my C110...  Any help greatly appreciated, thanks,

Dan
