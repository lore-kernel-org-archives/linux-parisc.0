Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hotmail.com (f138.law15.hotmail.com [64.4.23.138])
	by dsl2.external.hp.com (Postfix) with ESMTP id AC7A6482A
	for <parisc-linux@lists.parisc-linux.org>; Sun,  5 Aug 2001 00:18:13 -0600 (MDT)
From: "Frank Amo" <frankandlinux@hotmail.com>
To: parisc-linux@lists.parisc-linux.org
Date: Sat, 04 Aug 2001 23:18:06 -0700
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="----=_NextPart_000_4997_6a15_3a1c"
Message-ID: <F138x4vvsGOkevWWGxe0000f2b5@hotmail.com>
Subject: [parisc-linux] linux problem
List-ID: <linux-parisc.vger.kernel.org>

This is a multi-part message in MIME format.

------=_NextPart_000_4997_6a15_3a1c
Content-Type: text/html

<html><div style='background-color:'><DIV>
<DIV>
<DIV></DIV></DIV></DIV></div><br clear=all><hr>Get your FREE download of MSN Explorer at <a href='http://go.msn.com/bql/hmtag_itl_EN.asp'>http://explorer.msn.com</a><br></html>
------=_NextPart_000_4997_6a15_3a1c
Content-Type: text/plain; name="helpMeplease.txt"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Disposition: attachment; filename="helpMeplease.txt"


I have redhat linux 6.1 running on a PII 350mhz 384mb ram and a
western digital 30gb harddrive configured with the Workstation Package.

EveryThing was working fine until I blindly plugged in a nameless
modem and began trying to use the "ppp configuration utility" for lack
of better terms to configure the internal modem and establish an internet
connection.

Where I appearantly generated the error for the first time was when
i began adding ppp1 ppp2 and ppp3 with different names and information
then going into the /etc/sysconfig/network-scripts and initializing the
ppp by using the following lines

/etc/sysconfig/network-scripts/ifcfg-ppp0 start
/etc/sysconfig/network-scripts/ifcfg-ppp1 start
/etc/sysconfig/network-scripts/ifcfg-ppp2 start
/etc/sysconfig/network-scripts/ifcfg-ppp3 start

then I opened those files and made the ifcfg-pppX devices
bootable by typing "yes" using vi.
ONBOOT=yes

After rebooting I first could not reboot the computer at all without
the initialization of the ppp3 hanging up my system literally all day.
So after forcing a reboot /dev/hda5 has an error "corrupt filesystem",
so when I log in to the system for maintenance as prompted I run
fsck -p /dev/hda5 it either says that it is clean or asks me to
fix it by checking for bad blocks.

When the process completes it allows me to reboot the system and passes
the fsck during bootup after bootup once again the ppp3 adapter hangs
the system endlessly.

I even booted to "linux single" i login ok and navigate the filesystem
but I cannot obtain any permissions (obviously) to (rwx) so I cannot
copy or delete any files on my system.

I would like to know if there is any way to go around the system
to get rid of that ppp stuff and if there are any other possible
and permanent damages to my operating system.

If there are damages to my operating system, how can I copy all of
my important files and work without reinstalling the operating system,
I cannot even upgrade to 7.1.

I appreciate any tips, thanks

frankandlinux@hotmail.com



------=_NextPart_000_4997_6a15_3a1c--
