Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp8.xs4all.nl (smtp8.xs4all.nl [194.109.127.134])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8E4DC482A
	for <parisc-linux@lists.parisc-linux.org>; Sun,  2 Sep 2001 11:57:30 -0600 (MDT)
Received: from rivierenland.xs4all.nl (rivierenland.xs4all.nl [194.109.14.47])
	by smtp8.xs4all.nl (8.9.3/8.9.3) with ESMTP id TAA27983
	for <parisc-linux@lists.parisc-linux.org>; Sun, 2 Sep 2001 19:57:28 +0200 (CEST)
From: thunder7@xs4all.nl
Date: Sun, 2 Sep 2001 19:57:17 +0200
To: parisc-linux@lists.parisc-linux.org
Cc: linux-kernel@vger.kernel.org
Message-ID: <20010902195717.A21209@middle.of.nowhere>
Reply-To: thunder7@xs4all.nl
References: <20010902105538.A15344@middle.of.nowhere> <20010902150023.U5126@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010902150023.U5126@parcelfarce.linux.theplanet.co.uk>
Subject: [parisc-linux] [SOLVED + PATCH]: documented Oops running big-endian reiserfs on parisc architecture
List-ID: <linux-parisc.vger.kernel.org>

On Sun, Sep 02, 2001 at 03:00:23PM +0100, Matthew Wilcox wrote:
> On Sun, Sep 02, 2001 at 10:55:38AM +0200, thunder7@xs4all.nl wrote:
> > ReiserFS version 3.6.25
> > bonnie[163]: Unaligned data reference 28
> 
> > which makes the error somewhere around here in 
> > fs/reiserfs/namei.c, function reiserfs_add_entry, after call to
> > padd_item, before call to reiserfs_find_entry:
> > 
> >     padd_item ((char *)(deh + 1), ROUND_UP (namelen), namelen);
> > 
> >     /* entry is ready to be pasted into tree, set 'visibility' and 'stat data in entry' attributes */
> >     mark_de_without_sd (deh);
> >     visible ? mark_de_visible (deh) : mark_de_hidden (deh);
> > 
> >     /* find the proper place for the new entry */
> >     memset (bit_string, 0, sizeof (bit_string));
> >     de.de_gen_number_bit_string = (char *)bit_string;
> >     retval = reiserfs_find_entry (dir, name, namelen, &path, &de);
> 
> I suspect mark_de_without_sd is an inlined function/macro and this will
> be where the unaligned data reference is happening.
> 
Correct. And the comments just above there about alignment are very
enlightening; it seems that the IBM/S390 architecture has some special
needs, and I just tested that my PA-RISC kernel has the same needs.
Thus I am able to present a real bugfix.

This patch allows me to run bonnie on a reiserfs partition with pa-risc
linux.

--- linux/include/linux/reiserfs_fs.h   Sun Sep  2 21:54:25 2001
+++ linux-new/include/linux/reiserfs_fs.h       Sun Sep  2 20:47:27 2001
@@ -924,7 +924,7 @@
 #define DEH_Visible 2

 /* 64 bit systems (and the S/390) need to be aligned explicitly -jdm */
-#if BITS_PER_LONG == 64 || defined(__s390__)
+#if BITS_PER_LONG == 64 || defined(__s390__) || defined(__hppa__)
 #   define ADDR_UNALIGNED_BITS  (3)
 #endif

This applies to linux-2.4.9-pa13 with
endian-safe-reiserfs-for-2.4.8.patch and to 2.4.9-ac5.

Please apply,
Jurriaan
-- 
It is well to remember, my son, that the entire population of the
universe, with one trifling exception, is composed of others.
        John Andrew Holmes
GNU/Linux 2.4.9-ac5 SMP/ReiserFS 2x1402 bogomips load av: 0.98 0.83 0.37
