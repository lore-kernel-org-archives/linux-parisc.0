Return-Path: <soete.joel@tiscali.be>
Received: from cpout2.tiscali.be (cpout2.tiscali.be [62.235.13.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4FA734857
	for <parisc-linux@lists.parisc-linux.org>;
	Mon, 15 Mar 2004 10:38:50 -0700 (MST)
Date: Mon, 15 Mar 2004 18:38:46 +0100
Message-ID: <404EC2E70000403A@ocpmta2.freegates.net>
In-Reply-To: <4054B9BC.30309@tiscali.be>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: =?ISO-8859-1?Q?Re=3A=20=5Bparisc=2Dlinux=5D=20=09RE=3A=20New=20glibc=20patches=202004=2D03=2D08=2C=20fixes=20GLRO=20changes=2E?=
To: "James Morrison" <ja2morri@csclub.uwaterloo.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Cc: Carlos O'Donell <carlos@baldric.uwo.ca>,
	parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hello Jim,

Sorry for confusion but you have definitely right.

[snip]use prefix=/usr and make  install_root=/mnt/chroot install;

This is the right method because if I use prefix=/mnt/chroot and 'make install',
when the install was finished and I tried chroot/mnt/chroot: here was the
error message:
chroot /mnt/chroot
/bin/bash: error while loading shared libraries: libncurses.so.5: cannot
open shared object file: No such file or directory

and strace shows me that it looking for libncurses.so.5 into /mnt/chroot/lib
:)

So to launch make -k check in this config, I foreseen to use prefix=/usr
and make install_root=/mnt/chroot; then mount -o bind /GlibcSrcFS /mnt/chroot/GlibcSrcFS;
chroot /mnt/chroot; and in this env launch the make -k check. Do you know
another solution?

Many thanks for advise,
    Joel


Joel Soete wrote:
> 
> 
> Carlos O'Donell wrote:
> 
>> On Fri, Mar 12, 2004 at 06:33:11PM +0100, Joel Soete wr
> te:
>>
>>> Hmmm all output files realted to Error1 was empty because of:
>>> hppa-linux-gcc -nostdlib -nostartfiles -o 
>>> /Develop/parisc-linux/build/glibc/posix/tst-regex
>>> -Wl,-dynamic-linker=/lib/ld.so.1
                         ^^^^^^^^^^
> ^

When I use the previous method (prefix=/mnt/chroot) it become :

-dynamic-linker=/mnt/chroot/lib/ld.so.1

So here I can drive make -k check without pb in basic env (the one in which
I build the new glibc)

OTC with James' method I would have
> to do it in chroot /mnt/chroot env.
And it wasn't what I did; I will so restart build and test with prefix=/mnt/chroot
(as I use to do) and advise you of the new 
results ;)

That's a way to lurn ;)

Joel



----------------------------------------------------------------------------------------
Tiscali ADSL: 35 €/mois, la meilleure offre du marché!
http://reg.tiscali.be/default.asp?lg=fr
