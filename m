Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from palrel12.hp.com (palrel12.hp.com [156.153.255.237])
	by dsl2.external.hp.com (Postfix) with ESMTP id 30005483E
	for <parisc-linux@lists.parisc-linux.org>; Fri, 26 Sep 2003 06:12:37 -0600 (MDT)
Reply-To: <santosh.abraham@hp.com>
From: "Santosh Abraham" <santosha@india.hp.com>
To: "'David S. Miller'" <davem@redhat.com>
Cc: <willy@debian.org>, <randolph@tausq.org>,
	<parisc-linux@lists.parisc-linux.org>, <sct@redhat.com>
Subject: RE: [parisc-linux] Fwd:  Problems with raw interface.
Date: Fri, 26 Sep 2003 17:42:29 +0530
Message-ID: <001b01c38427$76328840$e5624c0f@india.hp.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
In-Reply-To: <20030926033458.68dbb768.davem@redhat.com>
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

Apologies for 1) & 2). I guess ignorance is not bliss or excusable,
 is it :)

As for 3) i agree that there are issues, but what are the alternatives
 we have ?

Assuming that you agree that we need to call flush_cache_range ( ) to fix
the issue.

1) Call flush_cache_range () directly before the call to 
flush_dcache_page ().  But this could impact other architectures
too, right ?

2) Modify flush_dcache_page () in asm-parisc/pgalloc.h to handle
this.  But this is not easy cause we do not pass the user VA in
flush_dcache_page ().  


-----Original Message-----
From: David S. Miller [mailto:davem@redhat.com]
Sent: Friday, September 26, 2003 4:05 PM
To: santosh.abraham@hp.com
Cc: santosha@india.hp.com; willy@debian.org; randolph@tausq.org;
parisc-linux@lists.parisc-linux.org; sct@redhat.com
Subject: Re: [parisc-linux] Fwd: Problems with raw interface.



1) Please use unified diffs when you post patches.

2) If you insist on using Microsoft Outlook when posting patches
   at least configure it properly when doing so.  By default it is
   going to turn tabs into spaces and that makes the patch corrupt
   and unusable by anyone.

3) Your patch is unacceptable because it is taking advantage
   of internal implementation details of flush_dcache_page()
   on parisc64 that might not (and in fact, is not) be true
   on other platforms.
