Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from solo.franken.de (p50845385.dip.t-dialin.net [80.132.83.133])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2AC23483A
	for <parisc-linux@lists.parisc-linux.org>; Wed,  6 Mar 2002 16:23:32 -0700 (MST)
Date: Thu, 7 Mar 2002 00:22:39 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] FB on c3k
Message-ID: <20020307002239.A9224@solo.franken.de>
References: <20020306080101.B6A874859@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020306080101.B6A874859@dsl2.external.hp.com>; from grundler@dsl2.external.hp.com on Wed, Mar 06, 2002 at 01:01:01AM -0700
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

On Wed, Mar 06, 2002 at 01:01:01AM -0700, Grant Grundler wrote:
> 
> Getting closer.

right of me is a monitor connected to a B2600 with a X screen on it :-)

> I suspect some parameter isn't right for FB device definition
> but don't know what. Hoping the diagonal lines are the clue
> that someone could tell me about - some sort of "off-by-one"
> type of error.

No jsm is right, the U bit doesn't matter, if we set the right
physical address in the TLB. I really don't understand why it's
needed to supply more than 40bit, but with the patch below X works
(fbi still crashes the machine, but that could be a font problem,
as well). Before I'll commit the change, I'll post it here for
comments.

Thomas.

PS: VIS-EG users, who don't get a clear tux on the screen after startup
should select a non double buffered mode. There's more to do to get it
working in double buffered mode.


Index: entry.S
===================================================================
RCS file: /home/cvs/parisc/linux/arch/parisc/kernel/entry.S,v
retrieving revision 1.90
diff -u -p -r1.90 entry.S
--- entry.S	2002/03/03 23:00:10	1.90
+++ entry.S	2002/03/06 23:13:33
@@ -1045,8 +1045,6 @@ dtlb_miss_20w:
 	space_to_prot   spc prot        /* create prot id from space */
 	depd            pte,8,7,prot    /* add in prot bits from pte */
 
-	extrd,u,*=      pte,_PAGE_NO_CACHE_BIT+32,1,r0
-	depdi		1,12,1,prot
 	extrd,u,*=      pte,_PAGE_USER_BIT+32,1,r0
 	depdi		7,11,3,prot   /* Set for user space (1 rsvd for read) */
 	extrd,u,*= 	pte,_PAGE_GATEWAY_BIT+32,1,r0
@@ -1055,7 +1053,7 @@ dtlb_miss_20w:
 	/* Get rid of prot bits and convert to page addr for idtlbt */
 
 	depdi		0,63,12,pte
-	extrd,u         pte,56,32,pte
+	extrd,u         pte,56,52,pte
 	idtlbt          pte,prot
 
 	rfir
@@ -1124,8 +1122,6 @@ nadtlb_miss_20w:
 	space_to_prot   spc prot        /* create prot id from space */
 	depd            pte,8,7,prot    /* add in prot bits from pte */
 
-	extrd,u,*=      pte,_PAGE_NO_CACHE_BIT+32,1,r0
-	depdi		1,12,1,prot
 	extrd,u,*=      pte,_PAGE_USER_BIT+32,1,r0
 	depdi		7,11,3,prot   /* Set for user space (1 rsvd for read) */
 	extrd,u,*= 	pte,_PAGE_GATEWAY_BIT+32,1,r0
@@ -1134,7 +1130,7 @@ nadtlb_miss_20w:
 	/* Get rid of prot bits and convert to page addr for idtlbt */
 
 	depdi		0,63,12,pte
-	extrd,u         pte,56,32,pte
+	extrd,u         pte,56,52,pte
 	idtlbt          pte,prot
 
 	rfir
@@ -1151,7 +1147,7 @@ nadtlb_check_flush_20w:
 	/* Get rid of prot bits and convert to page addr for idtlbt */
 
 	depdi		0,63,12,pte
-	extrd,u         pte,56,32,pte
+	extrd,u         pte,56,52,pte
 	idtlbt          pte,prot
 
 	rfir
@@ -1743,8 +1739,6 @@ dbit_nolock_20w:
 	space_to_prot   spc prot        /* create prot id from space */
 	depd            pte,8,7,prot    /* add in prot bits from pte */
 
-	extrd,u,*=      pte,_PAGE_NO_CACHE_BIT+32,1,r0
-	depdi		1,12,1,prot
 	extrd,u,*=      pte,_PAGE_USER_BIT+32,1,r0
 	depdi		7,11,3,prot   /* Set for user space (1 rsvd for read) */
 	extrd,u,*= 	pte,_PAGE_GATEWAY_BIT+32,1,r0
@@ -1753,7 +1747,7 @@ dbit_nolock_20w:
 	/* Get rid of prot bits and convert to page addr for idtlbt */
 
 	depdi		0,63,12,pte
-	extrd,u         pte,56,32,pte
+	extrd,u         pte,56,52,pte
 	idtlbt          pte,prot
 #ifdef CONFIG_SMP
 	CMPIB=,n        0,spc,dbit_nounlock_20w


-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessary a
good idea.                                 [ Alexander Viro on linux-kernel ]
