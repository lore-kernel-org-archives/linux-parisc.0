From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: Re: [parisc-linux] gcc-3.3 configuration
Date: Thu, 22 May 2003 10:24:05 -0400
Message-ID: <20030522142405.GK21858__38228.8149827675$1416622475$gmane$org@systemhalted>
References: <16074.48509.259405.775905@gargle.gargle.HOWL> <20030521052351.GV548@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Matthias Klose <doko@cs.tu-berlin.de>,
	parisc-linux@lists.parisc-linux.org, debian-hppa@lists.debian.org,
	debian-gcc@lists.debian.org, m68k-build@nocrew.org
To: Randolph Chung <tausq@debian.org>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <20030521052351.GV548@tausq.org>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

> Aside from the evilness of doing binNMUs of this magnitude, I doubt a
> "transition" that doesn't change the SONAME will work. As soon as the
> new libstdc++ is installed, every c++ app on the box will instantly
> break. This means if anything happens e.g. to apt during the update, the
> system will get into a very nasty state. I don't think this is worth it.
> 
> If we need to change the SONAME, then there's no binary compatibility
> anyway...
> 
> As willy mentioned in his other email, if other distros want binary
> compatibility, they should follow what Debian is doing (on hppa), since
> Debian was there first :-)

*Plants flag here*

c.
