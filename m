Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from palrel10.hp.com (palrel10.hp.com [156.153.255.245])
	by dsl2.external.hp.com (Postfix) with ESMTP id A76ED48A0
	for <parisc-linux@lists.parisc-linux.org>; Thu, 25 Sep 2003 05:19:25 -0600 (MDT)
Reply-To: <santosh.abraham@hp.com>
From: "Santosh Abraham" <santosha@india.hp.com>
To: "'Randolph Chung'" <randolph@tausq.org>
Cc: <parisc-linux@lists.parisc-linux.org>
Subject: RE: [parisc-linux] Fwd:  Problems with raw interface.
Date: Thu, 25 Sep 2003 16:49:21 +0530
Message-ID: <000801c38356$dea5cda0$e5624c0f@india.hp.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
In-Reply-To: <20030925105005.GX16872@tausq.org>
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

hmm.. why is map_user_kiobuf () calling flush_dcache_page () then ?
should it not be calling flush_cache_{range,page} ?

map_user_kiobuf () called from the raw I/O path should ,in the
write case, be flushing user data out, so that its visible to
the kernel VA.
This is not being done in flush_dcache_page () when page->mapping is
NULL.

-----Original Message-----
From: Randolph Chung [mailto:randolph@tausq.org]
Sent: Thursday, September 25, 2003 4:20 PM
To: santosh.abraham@hp.com
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Fwd: Problems with raw interface.


> Also, does'nt __flush_dcache_page () need to have a for loop for "i_mmap"
> similar to the one for "i_mmap_shared" ?
>

no, this was discussed recently on this list.

see jejb's message:
http://lists.parisc-linux.org/pipermail/parisc-linux/2003-August/020791.html

and the corresponding thread for more info.

i thought flush_dcache_page is for making kernel mapping visible to
user, if you are trying to make user data visible to the kernel, you
should not be relying on flush_dcache_page.

randolph
--
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
