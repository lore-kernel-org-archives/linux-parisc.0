Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.cs.tu-berlin.de (mail.cs.tu-berlin.de [130.149.17.13])
	by dsl2.external.hp.com (Postfix) with ESMTP id D64894829
	for <parisc-linux@lists.parisc-linux.org>; Wed, 25 Jun 2003 15:29:59 -0600 (MDT)
From: Matthias Klose <doko@cs.tu-berlin.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-ID: <16122.5027.155918.686357@gargle.gargle.HOWL>
Date: Wed, 25 Jun 2003 23:26:59 +0200
To: parisc-linux@lists.parisc-linux.org, binutils@sources.redhat.com
Subject: [parisc-linux] binutils ICE while building todays gcc HEAD on hppa-linux
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

ICE in binutils-2.14.90.0.4 building gcc HEAD 20030625, while linking
the shared libstdc++ library:

[...]
-Wl,-soname -Wl,libstdc++.so.6 -o .libs/libstdc++.so.6.0.0
/usr/bin/ld: BFD 2.14.90.0.4 20030523 Debian GNU/Linux internal error, aborting at ../../bfd/elf32-hppa.c line 3864 in elf32_hppa_relocate_section

/usr/bin/ld: Please report this bug.

collect2: ld returned 1 exit status
