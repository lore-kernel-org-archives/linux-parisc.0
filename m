Return-Path: <soete.joel@tiscali.be>
Received: from cpout2.tiscali.be (cpout2.tiscali.be [62.235.13.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1F0FD4879
	for <parisc-linux@lists.parisc-linux.org>;
	Tue,  9 Mar 2004 02:25:03 -0700 (MST)
Date: Tue, 9 Mar 2004 10:04:23 +0100
Message-ID: <404782C800002A2F@ocpmta1.freegates.net>
In-Reply-To: <20040308174914.GC19791@baldric.uwo.ca>
From: "Joel Soete" <soete.joel@tiscali.be>
To: "Carlos O'Donell" <carlos@baldric.uwo.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Cc: parisc-linux@lists.parisc-linux.org
Subject: [parisc-linux]
	RE: New glibc patches 2004-03-08, fixes GLRO changes.
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>


>New patches here, passes testsuite without regression.
>
>http://www.parisc-linux.org/~carlos/glibc-hppa-patches-2004-03-08.tar.gz

Thanks :)

>Joel,
>
>Is there any chance that you could do some testing for me please?

Just let me find a free disk :)

I will advise ;)

>1. Use debootstrap to build a chroot (/mnt/chroot)

BTW which install should I install: man debootstrap give the fllowing example
deboostrap woody ./woody-chroot http://ftp.cx.debian.org/debian

Well not familiar with debootstrap but I presume that ./woody-chroot would
be here /mnt/chroot and ftp.cx.debian.org my nearest debian repository. 
But my question is: would you like I build a woody or would you prefer a
sarge?


>2. Compile glibc with --prefix=/mnt/chroot
>3. Install the new glibc there.
>4. Test out running some stuff from the chroot.
	o Try running Xnest
	o Try running X applications through Xnest
	o Try building a new kernel in the chroot.

Clear

>Thanks!

wellcome,

Joel


----------------------------------------------------------------------------------------
Tiscali ADSL: 19,50 €/mois, pendant 3 mois! L'Internet rapide, c'est pour
tout le monde.
http://reg.tiscali.be/default.asp?lg=fr
