Received: from hpfcla.fc.hp.com (hpfcla.fc.hp.com [15.254.48.2])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id JAA05066
	for <parisc-linux@puffin.external.hp.com>; Thu, 7 Dec 2000 09:13:48 -0700
To: Richard Hirst <rhirst@linuxcare.com>
cc: Grant Grundler <grundler@cup.hp.com>, parisc-linux@puffin.external.hp.com,
        debian-hppa@lists.debian.org
Subject: Re: A500 status update 
In-Reply-To: Your message of "Thu, 07 Dec 2000 09:56:13 GMT."
             <20001207095613.D7166@linuxcare.com>
References: <200012070634.WAA07459@milano.cup.hp.com> <200012070649.WAA07510@milano.cup.hp.com>  <20001207095613.D7166@linuxcare.com> 
Date: Thu, 07 Dec 2000 09:16:25 -0700
From: Paul Bame <bame@noam.fc.hp.com>
Message-Id: <E1443ib-0003sK-00@noam.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>


This is a pretty big difference from my experience on c3k but I was using
Friday's bits:

= > I forgot to mention:
= > o sleep seg faults (syscall issue?)

Maybe you have some older signal code in your tree?  I explicitly tested
SIGALRM.

= > o syslogd seg faults (ditto?)

I've had some problems with syslogd too, but nfsroot-latest it seems
fine.

= > o CONFIG_GENRTC=n since hwclock crashes the system at that point

When I run hwclock by hand I get warnings from the ioctl() syscall
converter about unknown ioctls, but no crash or anything.  There will
possibly be a LOT of unknown ioctls to translate, and we owe thanks
to Grant for turning on the skeleton of the ioctl converter stolen
from sparc/mips (parisc64/kernel/ioctl32.c)

= I see "KERNEL BUG at page_alloc.c:111" at random - not very often
= though.

I see that one too.

= Trying to mount a local file system is ok, but trying to mount an
= nfs file system causes mount to segv.

I've had poor luck with network clients like ping and telnet from
the nfs root and you could be seeing a related problem with NFS.
When I compiled a new ping it worked fine, so
it's possible there's an incompatibility in a networking
data structure caused by my posix_types.h changes.


I've decided to take a vacation from syscall wrappers for now because
it seems like once we have a new user space that things may be stable
and functional enough to focus on other areas.  I envision that we'll
add wrappers for unimplemented syscalls and ioctls as the need arises
(parisc64/kernel/sys_parisc32.c).

I've left many syscalls disabled and think we should keep them turned
off until it's proven they actually are used.  We should
probably consider nuking them in the 32-bit kernel too.

	-P
