Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from bbnrel4.net.external.hp.com (bbnrel4.net.external.hp.com [155.208.254.68])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8AF094829
	for <parisc-linux@parisc-linux.org>; Sat,  5 Oct 2002 05:25:15 -0600 (MDT)
Received: from iws1pb05.france.hp.com (unknown [15.124.72.14])
	by bbnrel4.net.external.hp.com (Postfix) with ESMTP id 26CC56115
	for <parisc-linux@parisc-linux.org>; Sat,  5 Oct 2002 10:37:23 +0200 (METDST)
Message-ID: <3D9EA511.20D85BEA@hpfrcu81.france.hp.com>
Date: Sat, 05 Oct 2002 10:38:41 +0200
From: phi <phi@hpfrcu81.france.hp.com>
MIME-Version: 1.0
Cc: PA-RISC Linux List <parisc-linux@parisc-linux.org>
References: <Pine.LNX.4.44.0210020925510.6688-100000@wolf.alaskatech> <20021003053033.9C5E64829@dsl2.external.hp.com>
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] /usr/bin/ld: can not size stub section: Bad value
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

Hi All,

I got this from the final link of my application.

/usr/bin/ld: can not size stub section: Bad value
/usr/bin/ld: BFD 2.12.90.0.14 20020627 Debian GNU/Linux internal error,
aborting
 at ../../bfd/elf32-hppa.c line 4124 in elf32_hppa_relocate_section

/usr/bin/ld: Please report this bug.



Is this a bug or faq today?

It is while building a tiny prog linked with shared lib, 'may be' this as to
do with the way the shared libs are build i.e short pic vs long pic?

Thanx in advance?
Phi
