Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from palrel13.hp.com (palrel13.hp.com [156.153.255.238])
	by dsl2.external.hp.com (Postfix) with ESMTP id D8F264891
	for <parisc-linux@lists.parisc-linux.org>; Thu, 25 Sep 2003 04:38:59 -0600 (MDT)
Received: from redsea.india.hp.com (redsea.india.hp.com [15.76.97.3])
	by palrel13.hp.com (Postfix) with ESMTP id 7D54D1C0148D
	for <parisc-linux@lists.parisc-linux.org>; Thu, 25 Sep 2003 03:38:58 -0700 (PDT)
Received: from eb98229 (eb98229.india.hp.com [15.76.98.229])
	by redsea.india.hp.com (8.9.3 (PHNE_28810)/8.9.3 SMKit7.02) with SMTP id QAA14604
	for <parisc-linux@lists.parisc-linux.org>; Thu, 25 Sep 2003 16:17:42 +0530 (IST)
Reply-To: <santosh.abraham@hp.com>
From: "Santosh Abraham" <santosha@india.hp.com>
To: <parisc-linux@lists.parisc-linux.org>
Date: Thu, 25 Sep 2003 16:08:55 +0530
Message-ID: <000701c38351$3907ada0$e5624c0f@india.hp.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: [parisc-linux] Fwd:  Problems with raw interface.
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

The problem seems to be with the flush_dcache_page () routine in
asm-parisc/pgalloc.h.  The routine does not handle the case when
page->mapping == NULL.  It simply ends up calling __flush_dcache_page ()
which only flushes out the cache lines corresponding to the kernel VA.

The cache lines corresponding to the user VA remain unaffected.  In order
for
the user cache lines to be flushed a call to flush_cache_page () or
flush_user_dcache_range ()
must be made.

In order to do this the flush_dcache_page () interface may need to be
modified to take in a user VA as an argument.

If this is not feasible we could as a hack check for page->mapping == NULL
in flush_dcache_page () and call flush_data_cache().  This would be very
expensive.

Also, does'nt __flush_dcache_page () need to have a for loop for "i_mmap"
similar to the one for "i_mmap_shared" ?

thanks,
santosh.
