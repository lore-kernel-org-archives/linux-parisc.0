Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 449A04852
	for <parisc-linux@lists.parisc-linux.org>; Sat, 18 Oct 2003 16:59:43 -0600 (MDT)
Date: Sat, 18 Oct 2003 18:55:47 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Jakub Jelinek <jakub@redhat.com>
Cc: libc-alpha <libc-alpha@sources.redhat.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: [PATCH] _STACK_GROWS_UP fixes.
Message-ID: <20031018225547.GE8642@systemhalted>
References: <20031012213734.GJ23999@systemhalted> <20031015053431.GE12344@sunsite.ms.mff.cuni.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20031015053431.GE12344@sunsite.ms.mff.cuni.cz>
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

On Wed, Oct 15, 2003 at 07:34:31AM +0200, Jakub Jelinek wrote:
> On Sun, Oct 12, 2003 at 05:37:34PM -0400, Carlos O'Donell wrote:
> > 2003-10-06  Carlos O'Donell <carlos@baldric.uwo.ca>
> > 
> > 	* pthread.c (__pthread_self_stack): _STACK_GROWS_UP case added.
> > 	(__pthread_find_self): Likewise.
> > 	* manager.c (thread_segment): _STACK_GROWS_UP case added.
> 
> You need to look at linuxthreads/attr.c (__pthread_attr_getstack) too
> (the recent code which parses /proc/self/maps and finds stack VMA in there).

Jakub,

What do you think of something like this? Would it not also be valid to
do something like "to - from" for the _STACK_GROWS_DOWN case?

I'm building with this patch right now.

c.

---
2003-10-18  Carlos O'Donell  <carlos@baldric.uwo.ca>

	* attr.c (pthread_getattr_np): Add _STACK_GROWS_UP case when
	converting /proc/self/maps entry to __stackaddr and __stacksize.

Index: linuxthreads/attr.c
===================================================================
RCS file: /cvs/glibc/libc/linuxthreads/attr.c,v
retrieving revision 1.33
diff -u -p -r1.33 attr.c
--- linuxthreads/attr.c	23 Sep 2003 06:12:59 -0000	1.33
+++ linuxthreads/attr.c	18 Oct 2003 22:34:03 -0000
@@ -455,12 +455,19 @@ int pthread_getattr_np (pthread_t thread
 		{
 		  /* Found the entry.  Now we have the info we need.  */
 		  attr->__stacksize = rl.rlim_cur;
+#ifdef _STACK_GROWS_DOWN
 		  attr->__stackaddr = (void *) to;
-
+#else
+                  attr->__stackaddr = (void *) from;
+#endif
 		  /* The limit might be too high.  This is a bogus
 		     situation but try to avoid making it worse.  */
 		  if ((size_t) attr->__stacksize > (size_t) attr->__stackaddr)
+#ifdef _STACK_GROWS_DOWN
 		    attr->__stacksize = (size_t) attr->__stackaddr;
+#else
+                    attr->__stacksize = (size_t)(to - from);
+#endif
 
 		  /* We succeed and no need to look further.  */
 		  ret = 0;
