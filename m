Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from gwyn.tux.org (gwyn.tux.org [207.96.122.8])
	by dsl2.external.hp.com (Postfix) with ESMTP id 440F4484A
	for <parisc-linux@lists.parisc-linux.org>; Sat,  8 Sep 2001 15:49:16 -0600 (MDT)
Date: Sat, 8 Sep 2001 17:49:14 -0400
From: Timothy Ball <timball@tux.org>
To: parics Linux Mailing List <parisc-linux@lists.parisc-linux.org>
Cc: Ext3 Users ml <Ext3-users@redhat.com>
Message-ID: <20010908174914.O29708@gwyn.tux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] ext3+parisc kernel
List-ID: <linux-parisc.vger.kernel.org>

[cross posting cause I'm not sure who should get this email]

I am attempting to make ext3 work on the parisc kernel tree. So far I
have successfully patched and have made the kernel compile w/ only two
line changes to the source.

I got ext3 from the cvs, and the parisc 2.4.9-pa17 kernel and I've
patched the parisc kernel w/ the add-to-kernel.sh script. after a bit of
fighting I got the kernel to compile. I had to add and remove the
following lines:

line added include/linux/fs.h:1348
extern loff_t no_llseek(struct file *file, loff_t offset, int origin);

Needed for the no_llseek symbol.

line removed kernel/ksyms.c:180
EXPORT_SYMBOL(fsync_no_super);

Needed removal because fsync_no_super was already being exported by
fs/buffer.c:354

Now when I boot. /proc is not mounted at boot, and when I mount it all
the files in /proc appear to be directories. Also networking is gone.
ifconfig just returns w/ nothing and ifconfig -a shows no devices.

But on the bright side when I cat /proc/filesystems/ (everything in
/proc is a directory even though it's not) I get ext3 to come up... So
it kinda works. Gonna get the newest e2fsprogs and see if I can make a
journal and have this broken kernel mount / as ext3.

--timball

-- 
	GPG key available on pgpkeys.mit.edu
pub  1024R/CFF85605 1999-06-10 Timothy L. Ball <timball@sheergenius.com>
     Key fingerprint = 8A 8E 64 D6 21 C0 90 29  9F D6 1E DC F8 18 CB CD
