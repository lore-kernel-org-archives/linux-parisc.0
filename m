Return-Path: <soete.joel@tiscali.be>
Received: from cpout2.tiscali.be (cpout2.tiscali.be [62.235.13.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id 349FD4879
	for <parisc-linux@lists.parisc-linux.org>;
	Tue, 20 Jan 2004 11:12:48 -0700 (MST)
Date: Tue, 20 Jan 2004 19:12:45 +0100
Message-ID: <400CB89F00000C0C@ocpmta2.freegates.net>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] init and exit text problem
To: "Grant Grundler" <grundler@parisc-linux.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hi Grant,

> yes - certainly ftp://ftp.parisc-linux.org/patches/diff-2.6.1-bridge_ctl

Ok I applied it against 2.6.1-pa8 (+ some already accepted patch of Matthew
and James related to sym2 driver ;) ).

Compiled with unstable debian gcc-3.3.3 and defconfig, it compiles and boots
well on the b2k ;) (and I am on going to recompile toolchain with it and
all seems to works fine ;) ).

Thanks a lot,
    Joel

ps: I also drive severall test:

Unfortunately, it doesn't help to boot with 64bit kernel on this system
(neither build with my gcc-hppa64_3.3.2 nor with unofficial-deb gcc-hppa64_3.0.4ds3-7.1_hppa.deb
which should the one to use iirc)

And with your config file it always do an hpmc with the 3 compilers I used
(debian gcc-3.3.3, gcc-hppa64 (from gcc-hppa64_3.0.4d
3-7.1_hppa.deb), my own gcc-hppa64_3.3.2), so I would have to find what breaks
for b2k even in 32bit kernel (that will take a long time).

The bad thing is that I don't reach to get any relevant iaoq address from
pim to start investigation :( (just know that it failed very early after
'-- search the FAQ and mailing list...')

hmm just noticed the following diff:
Command line for kernel: 'root=/dev/sda5 HOME=/ console=ttyS0 TERM=vt102
palo_kernel=3/vmlinux-2.6.1-pa7'
Selected kernel: /vmlinux-2.6.1-pa7 from partition 3
ELF32 executable
Entry 001002f0 first 00100000 n 3
Segment 0 load 00100000 size 2586936 mediaptr 0x1000
Segment 1 load 00378000 size 368640 mediaptr 0x279000
Segment 2 load 003d4000 size 553093 mediaptr 0x2d3000
Branching to kernel entry point 0x001002f0.  If this is the last
message you see, you may need to switch your console.  This is
a common symptom -- search the FAQ and mailing list at parisc-linux.org

[snip] normal boot


Command line for kernel: 'roo
=/dev/sda5 HOME=/ console=ttyS0 TERM=vt102
palo_kernel=3/vmlinux-26-up64-gcc30'
Selected kernel: /vmlinux-26-up64-gcc30 from partition 3
ELF64 executable
Entry 00100000 first 00100000 n 2
Segment 0 load 00100000 size 3529136 mediaptr 0x1000
Segment 1 load 00460000 size 237702 mediaptr 0x35f000
Branching to kernel entry point 0x00100000.  If this is the last
message you see, you may need to switch your console.  This is
a common symptom -- search the FAQ and mailing list at parisc-linux.org


HPMC

So 3 segment loaded in 32bit and only 2 in 64bit, is it normal (i lost info
on the N4k boot :( ).
And also seems to "Branching to" a wrong entry point?



-------------------------------------------------------------------------
Tiscali ADSL: 12 mois à 29,50 €/mois! L'Internet rapide, c'est pour tout
le monde.
http://reg.tiscali.be/default.asp?lg=fr
