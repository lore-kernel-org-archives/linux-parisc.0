Return-Path: <xam@cs.ucc.ie>
Received: from csmail.ucc.ie (csmail.ucc.ie [143.239.211.231])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6294F4934
	for <parisc-linux@lists.parisc-linux.org>;
	Tue, 27 Apr 2004 00:30:07 -0600 (MDT)
Received: from sal.ucc.ie (tqpc.ucc.ie [143.239.201.88])
	by csmail.ucc.ie (8.12.10/8.12.10) with ESMTP id i3R6U60o000951
	for <parisc-linux@lists.parisc-linux.org>;
	Tue, 27 Apr 2004 07:30:06 +0100
Date: Tue, 27 Apr 2004 07:29:59 +0100 (IST)
From: "M. Grabert" <xam@cs.ucc.ie>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <Pine.LNX.4.58.0404270633310.31870@sal.ucc.ie>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] Linux-2.6.6-rc1-pa3 and pdflush problems
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hi,

I have experienced some problems with linux-2.6.6-rc1-pa0 and -pa3.
After running fine for around 10 hours, suddenly the
USB keyboard and mouse were not working anymore, and my friends
were not able to web access to the internet (which is routed through the
machine, with a transparent squid proxy set up that stores the
cache files on /dev/hda).

The LCD of my C3000 also showed some strange message instead of
'Linux-2.6.6-rc1-pa0' (I think I could read the letters HPMC somewhere,
but I didn't do a 'ser pim', since I forgot to clear it before, and
I didn't had my serial console cable handy).


I updated the kernel to -pa3, and now I could witness something strange
happening, again after about 11 hours running without problems:
Again the USB keyboard and mouse didn't work, the serial console
wouldn't respond to input, but printed out 'hda: lost interrupt',
'dma_mask=0x64' and 'retrying to recover interrupt' messages repeatedly.

This time I tried to ssh to the machine remotely and this worked,
and I was also able to ping to the internet, but - of course - the access
to the web wouldn't work, since the squid proxy would try to access /dev/hda.


However I was able to notice something rather odd:
wmcpuload showed 100% CPU usage, so I ran top and found
'pdflush' consuming all CPU ressources. The machine seemed to be running
fine (apart from no serial console, no /dev/hda access, no USB keyb/mouse),
and didn't seem to be slowed down despite pdflush burning all CPU cycles.
I pressed the power button, and the machine shut down properly (no HPMC
or similar).


So I guess the problem I experienced with -pa0 and -pa3 are somewhat
related (same symptoms), and I guess a HPMC would have resulted
if I just have waited long enough ...


Any ideas if this could be related to the recent changes in the cache
flush handling? Eg.
http://lists.parisc-linux.org/pipermail/parisc-linux-cvs/2004-April/033981.html


Unfortunately I just switched to the 2.6 kernel (for permanent use) recently,
so I'm not know whether this error would have happened with a
pre-2.6.6-rc1 kernel aswell.
Well, I have tested some 2.6.x kernels before, and most definitely also
for longer than 10 hours without problems, but basically running without
any load and without X (since I just got my Voodoo2 graphics card two
weeks ago).

I doubt this problem is related to the Voodoo2, since I guess some other
people would with a Voodoo graphics card would have posted similar problem
reports to the list. Furthermore the graphics card did work fine during
the problems (the screen was updated fine, I just couldn't use X anymore).


Sorry for so little info (System.map and .config will be supplied if
requested, but they haven't changed much since my last posts).

I'm gonna try to post a 'ser pim' when the problem reappears again,
and after the machine had a HPMC. Maybe somebody has some hints what
commands I could use to provide you with some more info if the problem
appears again ...


Greetings,
  Max
