Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from scaup.mail.pas.earthlink.net (scaup.mail.pas.earthlink.net [207.217.120.49])
	by dsl2.external.hp.com (Postfix) with ESMTP id 532184829
	for <parisc-linux@lists.parisc-linux.org>; Sat, 25 Jan 2003 17:10:02 -0700 (MST)
Message-ID: <3E332846.5030105@earthlink.net>
Date: Sat, 25 Jan 2003 18:13:58 -0600
From: "Bryan W. Headley" <bwheadley@earthlink.net>
MIME-Version: 1.0
To: Sir Ace <chandler@nateng.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Um... WTF?
References: <Pine.LNX.4.33.0301241520210.25246-100000@jordan.eng.nateng.com> <20030125015308.GC6228@dsl2.external.hp.com> <20030125171749.F674@neep.com.au> <20030125141130.7495a051.varenet@esiee.fr>
In-Reply-To: <20030125141130.7495a051.varenet@esiee.fr>
Content-Type: text/plain; charset=us-ascii; format=flowed
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Thibaut VARENE wrote:
> On Sat, 25 Jan 2003 17:17:51 +0800
> "Andrew Shugg" <andrew@neep.com.au> wrote:
> 
> 
>>Grant Grundler said:
>>
>>>On Fri, Jan 24, 2003 at 03:37:28PM -0800, Sir Ace wrote:
>>>
>>>>Herein lies the problem, some how EVERY DAMN THING on the system
>>>>seems to be built against ncurses,
>>>

Consider how many things are linked against libreadline, so you have 
intra-line editing on command lines. They all reference libncurses. Not 
a complaint against debian, pa-risc debian, any given linux dist. Maybe 
a complaint against certain GNU tools and life in general.

Let's back up: you originally had this problem running 'make menuconfig' 
in the kernel source tree, which seemingly got upset about curses, and 
yet as really referring to something in libsupc++.a. That's an integral 
part of your gcc/g++ installation, which leads me to believe you either 
had an unsuccessful install.

> /tmp/ccywfbmB.o(.eh_frame+0x11): undefined reference to
> `__gxx_personality_v0'
> collect2: ld returned 1 exit status

Right now, you can't get into the system because of this issue. You 
could telnet or ssh in, if you can specify a statically-linked shell to 
run. /bin/sash and /bin/busybox are statically linked. Of the two, I 
prefer busybox, because it also has scaled-down common unix tools 
built-in. If this works, great, you can get and do some cleaning.

If this doesn't work, you could boot off of the CDROM, and instead of 
going through the Debian-fun-and-games install, choose 'execute a shell' 
from their menu. Then, you can manually mount the hard disk, cd over 
there, and do your scrubbing that way.

Lots of lots of fun. BTW, do you know how to install a .deb file without 
the benefit of a working dpkg/dselect/apt et al?

1. A deb file is really an archive built by ar. E.g.,

ar tv apt-listbugs_0.0.1hanzubon6_all.deb
rw-r--r-- 0/0      4 Dec 17 20:07 2002 debian-binary
rw-r--r-- 0/0   2002 Dec 17 20:07 2002 control.tar.gz
rw-r--r-- 0/0  13902 Dec 17 20:07 2002 data.tar.gz

2. Those .tar.gz file really are gzipped tarfiles.

Of these, control.tar.gz is a tar file with the pre-, post-install 
scripts. data.tar.gz is the tarfile of the binaries you are installing.

That is about enough to get you in and out of trouble several times. 
Good luck!






-- 
____               .:.                 ____
Bryan W. Headley - bwheadley@earthlink.net
