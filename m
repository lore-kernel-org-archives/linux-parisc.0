Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm2.tiscalinet.be [212.35.2.51])
	by dsl2.external.hp.com (Postfix) with ESMTP id F061B4834
	for <parisc-linux@lists.parisc-linux.org>; Wed, 12 Mar 2003 10:33:13 -0700 (MST)
Date: Wed, 12 Mar 2003 18:33:04 +0100
Message-ID: <3E68A24B00000CBD@ocpmta6.freegates.net>
In-Reply-To: <20030302045936.GS11363@tausq.org>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: RE: [parisc-linux] Re: gcc-3.2 -> gcc-3.3 transition on hppa
To: "Randolph Chung" <tausq@debian.org>,
	"Matthias Klose" <doko@cs.tu-berlin.de>
Cc: debian-hppa@lists.debian.org, debian-gcc@lists.debian.org,
	parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
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

Hi Randolph,

>-- Original Message --
>From: Randolph Chung <tausq@debian.org>
>To: Matthias Klose <doko@cs.tu-berlin.de>
>Cc: debian-hppa@lists.debian.org, debian-gcc@lists.debian.org,
>	parisc-linux@lists.parisc-linux.org
>Reply-To: Randolph Chung <tausq@debian.org>
>Subject: [parisc-linux] Re: gcc-3.2 -> gcc-3.3 transition on hppa
>Date: Sat, 1 Mar 2003 20:59:36 -0800
>
>
>In reference to a message from Matthias Klose, dated Mar 01:
>> Matthias Klose writes:
>> > AFAIK the transition from 3.2 to 3.3 requires recompilation of C++
>> > code due to the changed exception handling (now DWARF2 based). As
>> > libstdc++ in 3.2 and 3.2 have the same soname, how to handle it?
>> > Currently 3.2 is in unstable only. Would you want to start the
>> > recompilation before 3.2 based binaries go to testing?
>> > 
>> > The packaging for 3.3 can be found in the Debian CVS.
>> 
>> You can get test packages from
>> 	http://ftp-master.debian.org/~doko/gcc-3.3/
>
>well.... this is not looking good. after installing these in a freshly
>built sarge chroot, all c++ programs stop working (well, i've only tried
>two -- apt and fakeroot)
>
>(btw, small packaging detail, but the libstdc++*-dev package above
>cannot be installed cleanly because it overwrites things in the current
>3.2 package)
>

Sorry in advance if I am annoying.

I am looking to rebuild gcc-3.3 64bits to rebuild the last kernel 2.4 to
conitnue my investigation about smp(64bits) [which failled to boot on a N4000
when compile d with gcc-3.2 get from unofficial-debs].

To do I download the very last src from Matthias Klose who advise me to my
question:
>> Do you have some idea how to rebuild it from dpkg sources?
>> (I would like avoid the toolchain procedure if possible)

>look at debian/rules.defs for the support to build a cross compiler.
>It was submitted some weeks ago. I didn't check this myself yet.

I have a look but it is not clear to me; can you help me in more details?
(ps: I already install the last Matthias gcc-3.3 dpkg 32bits;
according to your <http://lists.parisc-linux.org/pipermail/parisc-linux/2003-February/019170.html>
it is a prerequisite)

Thanks in advance,
    Joel


---------------------------------
Vous surfez avec une ligne classique ?
Faites des economies avec Tiscali Complete
... Plus d'info sur http://complete.tiscali.be
