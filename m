From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: unbreak automounter support on 64-bit kernel with
 32-bit userspace
Date: Thu, 31 Jan 2013 21:01:10 +0100
Message-ID: <20130131200110.GA6032@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James.Bottomley@HansenPartnership.com, linux-kernel@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Similiar to other 64 bit Linux targets autofs_wqt_t needs to be of type int
which has a size of 32 bits on 32- and 64-bit parisc kernels.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/include/uapi/linux/auto_fs.h b/include/uapi/linux/auto_fs.h
index 77cdba9..d551754 100644
--- a/include/uapi/linux/auto_fs.h
+++ b/include/uapi/linux/auto_fs.h
@@ -43,7 +43,7 @@
  */
 
 #if defined(__sparc__) || defined(__mips__) || defined(__x86_64__) \
- || defined(__powerpc__) || defined(__s390__)
+ || defined(__powerpc__) || defined(__s390__) || defined(__hppa__)
 typedef unsigned int autofs_wqt_t;
 #else
 typedef unsigned long autofs_wqt_t;
