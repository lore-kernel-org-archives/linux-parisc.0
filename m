Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mailout08.sul.t-online.com (mailout08.sul.t-online.com [194.25.134.20])
	by dsl2.external.hp.com (Postfix) with ESMTP id C11D1482A
	for <parisc-linux@lists.parisc-linux.org>; Sun,  5 May 2002 00:54:19 -0600 (MDT)
To: Matthias Klose <doko@cs.tu-berlin.de>
Cc: parisc-linux@lists.parisc-linux.org,
	debian-hppa@lists.debian.org, debian-gcc@lists.debian.org
References: <15571.50195.280071.792305@gargle.gargle.HOWL>
From: martin@v.loewis.de (Martin v. Loewis)
Date: 05 May 2002 08:54:06 +0200
In-Reply-To: <15571.50195.280071.792305@gargle.gargle.HOWL>
Message-ID: <m38z6z2igh.fsf@mira.informatik.hu-berlin.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Re: gcc-3.? compiler for hppa (3.1, 3.1+dwarf2, 3.2cvs20020429?)
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

Matthias Klose <doko@cs.tu-berlin.de> writes:

> I would like to get feedback, on which alternative to base the gcc-3.1
> packages:
> 
> a) 3.1 as to be released (without dwarf2 support)

As Redhat has demonstrated in the past, it is highly desirable that
the distributed gcc is based on a released gcc as close as possible.
If there are serious problems in gcc 3.1-as-released, work with gcc
maintainers to fix them in 3.1.1.

Regards,
Martin
