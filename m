Return-Path: <soete.joel@tiscali.be>
Received: from cpout2.tiscali.be (cpout2.tiscali.be [62.235.13.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id 313BB48BA
	for <parisc-linux@lists.parisc-linux.org>;
	Tue,  9 Mar 2004 06:49:47 -0700 (MST)
Date: Tue, 9 Mar 2004 14:49:44 +0100
Message-ID: <404782C800002FD2@ocpmta1.freegates.net>
In-Reply-To: <404782C800002A2F@ocpmta1.freegates.net>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: =?ISO-8859-1?Q?RE=3A=20=5Bparisc=2Dlinux=5D=20=09RE=3A=20New=20glibc=20patches=202004=2D03=2D08=2C=20fixes=20GLRO=20changes=2E?=
To: "Carlos O'Donell" <carlos@baldric.uwo.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Carlos,

>>Joel,
>>
>>Is there any chance that you could do some testing for me please?
>
>Just let me find a free disk :)
>
>I will advise ;)

Good new I have one (just met a small pb with se terminator: apparently fixed
now).

>>1. Use debootstrap to build a chroot (/mnt/chroot)
>
>BTW which install should I install: man debootstrap give the fllowing example
>deboostrap woody ./woody-chroot http://ftp.cx.debian.org/debian
>
>Well not familiar with debootstrap but I presume that ./woody-chroot would
>be here /mnt/chroot and ftp.cx.debian.org my nearest debian repository.

>But my question is: would you like I build a woody or would you prefer a
>sarge?

For the moment I tested with sarge ended with:
"I: Base system installed successfully."

:)

let me know anyway if you would prefer woody, it doesn't required so much
time :) 

>>2. Compile glibc with --prefix=/mnt/chroot

I am going on...

Joel


----------------------------------------------------------------------------------------
Tiscali ADSL: 19,50 €/mois, pendant 3 mois! L'Internet rapide, c'est pour
tout le monde.
http://reg.tiscali.be/default.asp?lg=fr
