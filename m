From: Randolph Chung <tausq@debian.org>
Subject: Re: [parisc-linux] gcc-3.3 configuration
Date: Tue, 20 May 2003 22:23:51 -0700
Message-ID: <20030521052351.GV548__29873.0145827451$1416622472$gmane$org@tausq.org>
References: <16074.48509.259405.775905@gargle.gargle.HOWL>
Reply-To: Randolph Chung <tausq@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org,
	debian-hppa@lists.debian.org, debian-gcc@lists.debian.org,
	m68k-build@nocrew.org
To: Matthias Klose <doko@cs.tu-berlin.de>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <16074.48509.259405.775905@gargle.gargle.HOWL>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

> If yes, does the following approach work: Build a libstdc++5-3.3,
> conflicting with libstdc++5 (including libstdc++ with the same soname)
> and doing binary uploads for hppa for all libstdc++5 dependent
> packages? (The same could be done for m68k, but the compatibility
> argument doesn't hold as Debian seems to be the only m68k based
> distro).

Aside from the evilness of doing binNMUs of this magnitude, I doubt a
"transition" that doesn't change the SONAME will work. As soon as the
new libstdc++ is installed, every c++ app on the box will instantly
break. This means if anything happens e.g. to apt during the update, the
system will get into a very nasty state. I don't think this is worth it.

If we need to change the SONAME, then there's no binary compatibility
anyway...

As willy mentioned in his other email, if other distros want binary
compatibility, they should follow what Debian is doing (on hppa), since
Debian was there first :-)

my 2 cents,
randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
