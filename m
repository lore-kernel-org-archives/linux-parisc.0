Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id CB366489B
	for <parisc-linux@parisc-linux.org>; Sun, 31 Aug 2003 09:39:58 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 19tUJ3-0001td-OX
	for parisc-linux@parisc-linux.org; Sun, 31 Aug 2003 16:39:57 +0100
Date: Sun, 31 Aug 2003 16:39:57 +0100
From: Matthew Wilcox <willy@debian.org>
To: parisc-linux@parisc-linux.org
Message-ID: <20030831153957.GX13467@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] [ron@rongage.org: [Patchbomb] - Copy_to/from_user audit - oss4 - RESEND]
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

----- Forwarded message from Ron Gage <ron@rongage.org> -----

From: Ron Gage <ron@rongage.org>
To: kernel-janitor-discuss@lists.sourceforge.net
Subject: [Patchbomb] - Copy_to/from_user audit - oss4 - RESEND
User-Agent: KMail/1.5.2
Errors-To: kernel-janitor-discuss-admin@lists.sourceforge.net
X-BeenThere: kernel-janitor-discuss@lists.sourceforge.net
X-Mailman-Version: 2.0.9-sf.net
Precedence: bulk
List-Help: <mailto:kernel-janitor-discuss-request@lists.sourceforge.net?subject=help>
List-Post: <mailto:kernel-janitor-discuss@lists.sourceforge.net>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/kernel-janitor-discuss>,
	<mailto:kernel-janitor-discuss-request@lists.sourceforge.net?subject=subscribe>
List-Id: kernel janitor discussion list <kernel-janitor-discuss.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/kernel-janitor-discuss>,
	<mailto:kernel-janitor-discuss-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum=kernel-janitor-discuss>
X-Original-Date: Sun, 31 Aug 2003 11:20:48 -0400
Date: Sun, 31 Aug 2003 11:20:48 -0400

This patch is also available on my ftp server
ftp://new.rongage.org/pub/linux

This patch catches insures proper return values from 
copy_to/from_user calls.

Ron Gage - Pontiac, MI

diff -urN linux-2.6.0-test4/sound/oss/harmony.c linux-2.6.0-test4-patched/sound/oss/harmony.c
--- linux-2.6.0-test4/sound/oss/harmony.c	2003-08-22 19:58:39.000000000 -0400
+++ linux-2.6.0-test4-patched/sound/oss/harmony.c	2003-08-29 22:02:42.000000000 -0400
@@ -725,7 +725,7 @@
                 info.fragments = MAX_BUFS - harmony.nb_filled_play;
 		info.fragsize = HARMONY_BUF_SIZE;
                 info.bytes = info.fragments * info.fragsize;
-		return copy_to_user((void *)arg, &info, sizeof(info));
+		return copy_to_user((void *)arg, &info, sizeof(info)) ? -EFAULT : 0 ;
 
 	case SNDCTL_DSP_GETISPACE:
 		if (!(file->f_mode & FMODE_READ))
@@ -734,7 +734,7 @@
                 info.fragments = /*MAX_BUFS-*/ harmony.nb_filled_record;
 		info.fragsize = HARMONY_BUF_SIZE;
                 info.bytes = info.fragments * info.fragsize;
-		return copy_to_user((void *)arg, &info, sizeof(info));
+		return copy_to_user((void *)arg, &info, sizeof(info)) ? -EFAULT : 0 ;
 	
 	case SNDCTL_DSP_SYNC:
 		return 0;



-------------------------------------------------------
This sf.net email is sponsored by:ThinkGeek
Welcome to geek heaven.
http://thinkgeek.com/sf
_______________________________________________
Kernel-janitor-discuss mailing list
Kernel-janitor-discuss@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kernel-janitor-discuss

----- End forwarded message -----

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
