Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 782414841
	for <parisc-linux@lists.parisc-linux.org>; Sun,  9 Nov 2003 10:57:37 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 1AItod-0002Xc-OK; Sun, 09 Nov 2003 17:57:35 +0000
Date: Sun, 9 Nov 2003 17:57:35 +0000
From: Matthew Wilcox <willy@debian.org>
To: Joel Soete <soete.joel@tiscali.be>
Cc: parisc-linux@lists.parisc-linux.org,
	Grant Grundler <grundler@parisc-linux.org>,
	Matthew Wilcox <willy@debian.org>,
	Ruediger Scholz <rscholz@hrzpub.tu-darmstadt.de>
Subject: Re: [parisc-linux] fdisk problems 2.4 <-> 2.6
Message-ID: <20031109175735.GE2014@parcelfarce.linux.theplanet.co.uk>
References: <20031106222958.GJ26869@parcelfarce.linux.theplanet.co.uk> <3F969FFE000092BD@ocpmta2.freegates.net> <20031108015946.GC19436@colo.lackof.org> <3FACCC88.4010404@tiscali.be> <20031108194804.GA28929@colo.lackof.org> <3FAD6B1A.6060605@tiscali.be> <3FAE4639.6030200@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3FAE4639.6030200@tiscali.be>
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

On Sun, Nov 09, 2003 at 01:50:49PM +0000, Joel Soete wrote:
> Joel Soete wrote:
> >----------><----------
> >--- uaccess.h.orig    2004-04-20 19:58:08.000000000 +0200
> >+++ uaccess.h-t2    2004-04-20 20:10:41.000000000 +0200
> >@@ -42,8 +42,8 @@
> > #if BITS_PER_LONG == 32
> > #define LDD_KERNEL(ptr) __get_kernel_bad();
> > #define LDD_USER(ptr) __get_user_bad();
> >-#define STD_KERNEL(x, ptr) __put_kernel_asm64((u32)x,ptr)
> >-#define STD_USER(x, ptr) __put_user_asm64((u32)x,ptr)
> >+#define STD_KERNEL(x, ptr) __put_kernel_asm64((u64)x,ptr)
> >+#define STD_USER(x, ptr) __put_user_asm64((u64)x,ptr)
> > #else
> > #define LDD_KERNEL(ptr) __get_kernel_asm("ldd",ptr)
> > #define LDD_USER(ptr) __get_user_asm("ldd",ptr)
> >----------><----------
> I just test it and it seems to be a fix (among others):

I figured this out in Chicago airport yesterday.  Grant just pointed
me to this mail after I checked in the fix deleting the cast entirely.
Thanks for testing though.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
