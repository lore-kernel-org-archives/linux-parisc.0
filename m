From: Randolph Chung <tausq@debian.org>
Subject: Re: [parisc-linux] Re: gcc-3.2 -> gcc-3.3 transition on hppa
Date: Wed, 12 Mar 2003 09:35:05 -0800
Message-ID: <20030312173505.GY11363__15342.6428944387$1416622278$gmane$org@tausq.org>
References: <20030302045936.GS11363@tausq.org> <3E68A24B00000CBD@ocpmta6.freegates.net>
Reply-To: Randolph Chung <tausq@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Matthias Klose <doko@cs.tu-berlin.de>,
	debian-hppa@lists.debian.org, debian-gcc@lists.debian.org,
	parisc-linux@lists.parisc-linux.org
To: Joel Soete <jsoe0708@tiscali.be>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <3E68A24B00000CBD@ocpmta6.freegates.net>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

> I am looking to rebuild gcc-3.3 64bits to rebuild the last kernel 2.4 to
> conitnue my investigation about smp(64bits) [which failled to boot on a N4000
> when compile d with gcc-3.2 get from unofficial-debs].

If you are working on 64-bit, I would advise staying with 3.0.4 for
now.... no one has tested 3.3 hppa64-linux-gcc at all, so it will just
be introducing more unknowns into the problem.

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
