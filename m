From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: RE: [parisc-linux] Re: gcc-3.2 -> gcc-3.3 transition on hppa
Date: Mon, 3 Mar 2003 15:27:04 +0100
Message-ID: <3E5F8012000005AB__16759.2349266217$1416622253$gmane$org@ocpmta8.freegates.net>
References: <20030302045936.GS11363@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Cc: debian-hppa@lists.debian.org, debian-gcc@lists.debian.org,
	parisc-linux@lists.parisc-linux.org
To: "Randolph Chung" <tausq@debian.org>,
	"Matthias Klose" <doko@cs.tu-berlin.de>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <20030302045936.GS11363@tausq.org>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

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

hmm is there an url explaining how to grab it?

>> 
>> You can get test packages from
>> 	http://ftp-master.debian.org/~doko/gcc-3.3/
>

Nice and is it also possible to produce a 64bits version of gcc?

>well.... this is not looking good. after installing these in a freshly
>built sarge chroot, all c++ programs stop working (well, i've only tried
>two -- apt and fakeroot)
>
>(btw, small packaging detail, but the libstdc++*-dev package above
>cannot be installed cleanly because it overwrites things in the current
>3.2 package)
>
>randolph
>-- 
>Randolph Chung
>Debian GNU/Linux Developer, hppa/ia64 ports
>http://www.tausq.org/
>_______________________________________________
>parisc-linux mailing list
>parisc-linux@lists.parisc-linux.org
>http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

Thanks,
    Joel

---------------------------------
Vous surfez avec une ligne classique ?
Faites des economies avec Tiscali Complete
... Plus d'info sur http://complete.tiscali.be
