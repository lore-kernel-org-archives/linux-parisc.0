From: wmglo@dent.med.uni-muenchen.de
Subject: [parisc-linux] Re: [RFC] Where to put arch-dependant locking in malloc/thread-m.h
Date: 26 Sep 2003 13:39:54 -0000
Message-ID: <20030926133954.12328.qmail__42028.8205067211$1416622811$gmane$org@md.dent.med.uni-muenchen.de>
References: <20030925211509.GY14406@systemhalted>
Cc: libc-alpha@sources.redhat.com,
	parisc-linux@lists.parisc-linux.org
To: carlos@baldric.uwo.ca
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-reply-to: <20030925211509.GY14406@systemhalted> (carlos@baldric.uwo.ca)
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Hi,

> The following patch fixes the issue, but I'm not content about it's
> placement in malloc/thread-m.h. Any comments about where I might put
> this in order to make maintenance easier?

Ok, I have become convinced it is best to move thread-m.h into
sysdeps.  We should rename it, too (my suggestion: malloc-machine.h),
and make sure that one can put e.g.

#define DEFAULT_MMAP_THRESHOLD (256*1024)

in there and have it reflected in malloc.

I'll send a patch for this tomorrow.

Regards,
Wolfram.
