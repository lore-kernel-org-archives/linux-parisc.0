From: Andrew Gaffney <agaffney@gentoo.org>
Subject: [parisc-linux] issues with a C3600
Date: Sun, 24 Apr 2005 11:51:30 -0500
Message-ID: <426BCE92.3040006@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

I know this question isn't exactly related to linux, but I figured this would be
a good place to ask and the box *is* running Linux :P

I recently managed to get a HP C3600 workstation. It had been working fine for
the last week or so on serial console. I decided to try to get keyboard/video
working. I picked up one of those PS/2->USB adapters that handles the USB stuff
for the keyboard. I plugged in the keyboard and stuck in an ATI Rage II Mach64
GT card that I had laying around.

The machine came up just fine but it kept going to serial console. The video
card was detected:

Information Menu: Enter command > io

I/O MODULE INFORMATION
                                                                     IODC IODC
Path         Decimal     Type                  Location   HVER SVER  Vers Dep
------------ ----------- --------------------- ---------- ---- ----  ---- ----
<snip>
PCI6         10/1/6/0    VGA                   slot 6     0070 8500  0x01 0x00

I ran a few more information commands and walked away leaving the machine
running. When I came back ~15 minutes later, I saw the following on the serial
console:

Main Menu: Enter command > pcoq000000f0 f000b748
    000000f0 f000b74c
ior 00001f38
iir 53c63e73
pcoq000000f0 f000b748
    000000f0 f000b74c
ior 00001f38
iir 53c63e73
(same 4 lines repeating 6 more times)
pcoq000000f0 f000b748
    000

At this point, the box was locked up (not responding to any input over serial).
I shut it off and turned it back on. I hear the fans and HD spinning up, but all
I get on the LCD is blocks across the top row, and nothing comes over the
serial. I've unplugged the keyboard and removed the video card, but that hasn't
helped. Does anyone have any idea what happened or how to fix it?

-- 
Andrew Gaffney                            http://dev.gentoo.org/~agaffney/
Gentoo Linux Developer                                   Installer Project
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
