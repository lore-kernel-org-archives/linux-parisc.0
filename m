Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mout1.freenet.de (mout1.freenet.de [194.97.50.132])
	by dsl2.external.hp.com (Postfix) with ESMTP id C8436482A
	for <parisc-linux@lists.parisc-linux.org>; Mon,  6 Aug 2001 14:38:17 -0600 (MDT)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Reinhard Gimbel <Reinhard.Gimbel@freenet.de>
Reply-To: Reinhard.Gimbel@freenet.de
To: parisc-linux@lists.parisc-linux.org
Date: Mon, 6 Aug 2001 22:38:13 +0200
Cc: grundler@puffin.external.hp.com, rbradetich@uswest.net,
	rhirst@linuxcare.com
MIME-Version: 1.0
Message-Id: <01080622381300.01641@octopus>
Subject: [parisc-linux] C180: no real progress :-(
List-ID: <linux-parisc.vger.kernel.org>

Hi friends !

In the past days I learned a lot about HP workstations and the 
Linux port to hppa/parisc.

After I could exchange my first used C180 (256 MB, 2*4,5 GB 
FWSCSI HDD, GRAPHICS(3) accelerated graphics) by a newer model 
of the same series (C180) I tried to get palinux-0.9.2 
up-n-running on that box.

Few weeks ago I posted some thoughts I had in this mailing list 
because palinux-0.9.2 was crashing on the older box all the 
time during installation.

Some kernel messages led my in the false direction. I thought 
DINO (h/w v2.1; or better the software glue of DINO) was the 
root cause of "my" problems. This box had firmware v2.7.

Installation via network/NFS did not work because of problems; 
With the older box i tried many things (100Mbps, 10Mbps, Hub, 
cross-over cable) but no success ...

After I got the replacement on Friday (DINO v3.1 [which should 
be ok. according the kernel messages ...], firmware v5.1) the 
problems are still present.

BTW: Grant, you are right ! But newer firmware seems not to 
solve the problem ...

I tried serial console device as well as STI console [PS/2 
keyboard/mouse, GRAPHICS(0) with PC-style video monitor via HP 
adaptor connector].

The C180 boots palinux-0.9.2 from CD (additional drive at 
SESCSI). The system crashes either during kernel/driver 
installation (1st stage) or during "software" installation (2nd 
stage).

Only one time I could get the system installed from serial 
console. As I tried to switch to STI console the keyboard port  
problem hit me; The only chance was to reboot the box. As a 
result the root filesystem was corrupted so hard that fsck had 
problems tpo repair the corrupted filesystem ... :-(

At this point I have some (foe me) important questions:

Has anybody a running C180 under palinux-0.9.2 ?

Has anybody similar problems with other HP w/s and could solve 
those problems ? How solved ?

Some hints to the kernel guys:

[1] Try to fix the keyboard port problem ! I don't know how 
many reboots I had top handle this weekend but un-/replugging 
the keyboard is very boring ... :-)

[2] Try to get full support of any key (at least german 
keyboard support lacks on essential things ...) eg. no 
pipe/vertical bar; no support of capslock (keyboard unusable 
after accidently hit capslock; nothing helped; un-/replug, too)

[3] Sometimes I could see a message like
"ioctl: LOOP_CLR_FD: No such device or address"
short time before the C180 crashed. Any idea ?

Some hints to the system guys:

[1] Do real disabling of "dhcp-client" if it is set to "no" 
during installation. (Those kernel message caused by 
dhcp-client are boring; try it with open editor; great ;-)

[2] Try to include a date check/set into the installation 
routine; user should be informed about hardware clock setting)


I'm still trying to get that beast (= my C180) up-n-running !

Any help would be great !


Reinhard.
