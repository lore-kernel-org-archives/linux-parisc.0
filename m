Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from md.dent.med.uni-muenchen.de (md.dent.med.uni-muenchen.de [138.245.179.2])
	by dsl2.external.hp.com (Postfix) with SMTP id 89565483E
	for <parisc-linux@lists.parisc-linux.org>; Fri, 26 Sep 2003 07:40:04 -0600 (MDT)
Date: 26 Sep 2003 13:39:54 -0000
Message-ID: <20030926133954.12328.qmail@md.dent.med.uni-muenchen.de>
From: wmglo@dent.med.uni-muenchen.de
To: carlos@baldric.uwo.ca
Cc: libc-alpha@sources.redhat.com,
	parisc-linux@lists.parisc-linux.org
In-reply-to: <20030925211509.GY14406@systemhalted> (carlos@baldric.uwo.ca)
References: <20030925211509.GY14406@systemhalted>
Subject: [parisc-linux] Re: [RFC] Where to put arch-dependant locking in malloc/thread-m.h
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
