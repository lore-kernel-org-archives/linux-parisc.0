Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from beavis.ybsoft.com (unknown [63.224.241.66])
	by dsl2.external.hp.com (Postfix) with ESMTP id F0CC0493B
	for <parisc-linux@lists.parisc-linux.org>; Thu,  4 Oct 2001 07:13:51 -0600 (MDT)
Date: Thu, 4 Oct 2001 07:13:50 -0600
To: joel.soete@freebel.net
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] sti broken in pa32 on B180
Message-ID: <20011004071350.A27483@beavis.ybsoft.com>
References: <1002191096.3bbc38f8c42ed@webmail.tiscalinet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1002191096.3bbc38f8c42ed@webmail.tiscalinet.be>
From: rbradetich@uswest.net (Ryan Bradetich)
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Oct 04, 2001 at 12:24:56PM +0200, joel.soete@freebel.net wrote:
> Hi all,
> 
> I just come back to my hppa boxes (a 712/80 and a b180) and just co the last cvs 
> kernel (-pa32).
> I do usual make oldconfig; make dep ; make vmlinux (on the 712).

Try the following patch ... Thomas said this is what fixed STI on the
B-class machines for him.  If it works, I'll commit it.

Thanks,

- Ryan


diff -u -p -r1.37 inventory.c
--- inventory.c	2001/10/04 00:17:52	1.37
+++ inventory.c	2001/10/04 13:08:21
@@ -542,7 +542,7 @@ add_system_map_addresses(struct parisc_d
 		return;
 	}
 
-	for(i = 0; i < num_addrs; ++i) {
+	for(i = 0; i <= num_addrs; ++i) {
 		status = pdc_system_map_find_addrs(&addr_result, 
 						   module_instance, i);
 		if(PDC_RET_OK == status) {
