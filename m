From: Randolph Chung <tausq@debian.org>
Subject: Re: [parisc-linux] Re: gcc-3.2 -> gcc-3.3 transition on hppa
Date: Sun, 9 Mar 2003 12:45:34 -0800
Message-ID: <20030309204534.GH11363__27110.2663166404$1416622266$gmane$org@tausq.org>
References: <15979.40670.331645.441499@gargle.gargle.HOWL> <200303092027.h29KR1pk026585@hiauly1.hia.nrc.ca>
Reply-To: Randolph Chung <tausq@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Matthias Klose <doko@cs.tu-berlin.de>,
	debian-hppa@lists.debian.org, debian-gcc@lists.debian.org,
	parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <200303092027.h29KR1pk026585@hiauly1.hia.nrc.ca>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

> Did you configure 3.3 using "--enable-sjlj-exceptions=yes"?  That way
> the 3.3 C++ library should be compatible with the previous 3.3 library.
> The switch to dwarf2 can be delayed until the next debian release.

yeah, i exchanged some mail with Matthias about this.

Anyway, I have the debs installed in a chroot now. Will start building
random stuff and see what happens :)

stay tuned,
randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
