Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 53BA64834
	for <parisc-linux@lists.parisc-linux.org>; Wed, 12 Mar 2003 10:38:39 -0700 (MST)
Date: Wed, 12 Mar 2003 09:35:05 -0800
From: Randolph Chung <tausq@debian.org>
To: Joel Soete <jsoe0708@tiscali.be>
Cc: Matthias Klose <doko@cs.tu-berlin.de>,
	debian-hppa@lists.debian.org, debian-gcc@lists.debian.org,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: gcc-3.2 -> gcc-3.3 transition on hppa
Message-ID: <20030312173505.GY11363@tausq.org>
Reply-To: Randolph Chung <tausq@debian.org>
References: <20030302045936.GS11363@tausq.org> <3E68A24B00000CBD@ocpmta6.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3E68A24B00000CBD@ocpmta6.freegates.net>
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
