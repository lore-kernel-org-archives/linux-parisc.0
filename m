From: "Helge Deller" <deller@gmx.de>
Subject: Re: threads and fork on machine with VIPT-WB cache
Date: Mon, 10 May 2010 11:56:32 +0200
Message-ID: <20100510095632.173760@gmx.net>
References: <20100412214118.46D925160@hiauly1.hia.nrc.ca>
 <20100413115501.307040@gmx.net> <20100419162653.GA106@hiauly1.hia.nrc.ca>
 <4BCDEB6E.1060408@gmx.de> <20100509124339.GA6797@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Cc: carlos@systemhalted.org, gniibe@fsij.org,
	linux-parisc@vger.kernel.org, dave.anglin@nrc-cnrc.gc.ca
To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100509124339.GA6797@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> Attached is my latest 2.6.33.3 patch bundle.  It uses a slightly modi=
fied
> version of James' minifail fix.

Thanks Dave!

I ran the patch my usual way (SMP kernel, on top of 2.6.33.3, multiple =
screens, minifail_dave.cpp testcase).
In summary I got after 10 seconds 2 segfaults, and in all of the screen=
s the minifail_dave testcases just hang.

"ps -ef" gives this:
root      2018     1  0 11:29 ?        00:00:00 SCREEN

root      2019  2018  0 11:29 pts/1    00:00:01 /bin/bash

root      2623  2019  0 11:30 pts/1    00:00:00 ./minifail_dave

root      2625  2623  0 11:30 pts/1    00:00:00 [minifail_dave] <defunc=
t>


ls3017:~# strace -p 2623

Process 2623 attached - interrupt to quit

futex(0x4113c4e8, FUTEX_WAIT, 2624, NULL^C <unfinished ...>

Process 2623 detached

ls3017:~# strace -p 2625

attach: ptrace(PTRACE_ATTACH, ...): Operation not permitted


Interestingly, I got only 2 segfaults but 10 screens/minifails were run=
ning (and all were zombies).
This means to me, that the segfaults and the zombie/futex-waits are mos=
t likely unrelated.

Helge
--=20
GRATIS f=FCr alle GMX-Mitglieder: Die maxdome Movie-FLAT!
Jetzt freischalten unter http://portal.gmx.net/de/go/maxdome01
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
