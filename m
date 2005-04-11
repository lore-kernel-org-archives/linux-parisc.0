From: Jesper Juhl <juhl-lkml@dif.dk>
Subject: [parisc-linux] [PATCH] parisc: kfree cleanup in arch/parisc/
Date: Mon, 11 Apr 2005 22:54:25 +0200 (CEST)
Message-ID: <Pine.LNX.4.62.0504112249510.2480__13817.8258938298$1416624537$gmane$org@dragon.hyggekrogen.localhost>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN;
  charset=US-ASCII
Cc: linux-kernel@vger.kernel.org,
 parisc-linux@parisc-linux.org
To: Matthew Wilcox <matthew@wil.cx>,
 Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


Get rid of redundant NULL pointer checks before kfree() in arch/parisc/ as 
well as a few blank lines.

Signed-off-by: Jesper Juhl <juhl-lkml@dif.dk>

diff -upr linux-2.6.12-rc2-mm3-orig/arch/parisc/kernel/ioctl32.c linux-2.6.12-rc2-mm3/arch/parisc/kernel/ioctl32.c
--- linux-2.6.12-rc2-mm3-orig/arch/parisc/kernel/ioctl32.c	2005-04-05 21:21:08.000000000 +0200
+++ linux-2.6.12-rc2-mm3/arch/parisc/kernel/ioctl32.c	2005-04-11 22:48:03.000000000 +0200
@@ -104,12 +104,9 @@ static int drm32_version(unsigned int fd
 	}
 
 out:
-	if (kversion.name)
-		kfree(kversion.name);
-	if (kversion.date)
-		kfree(kversion.date);
-	if (kversion.desc)
-		kfree(kversion.desc);
+	kfree(kversion.name);
+	kfree(kversion.date);
+	kfree(kversion.desc);
 	return ret;
 }
 
@@ -166,9 +163,7 @@ static int drm32_getsetunique(unsigned i
 			ret = -EFAULT;
 	}
 
-	if (karg.unique != NULL)
-		kfree(karg.unique);
-
+	kfree(karg.unique);
 	return ret;
 }
 
@@ -265,7 +260,6 @@ static int drm32_info_bufs(unsigned int 
 	}
 
 	kfree(karg.list);
-
 	return ret;
 }
 
@@ -305,7 +299,6 @@ static int drm32_free_bufs(unsigned int 
 
 out:
 	kfree(karg.list);
-
 	return ret;
 }
 
@@ -494,15 +487,10 @@ static int drm32_dma(unsigned int fd, un
 	}
 
 out:
-	if (karg.send_indices)
-		kfree(karg.send_indices);
-	if (karg.send_sizes)
-		kfree(karg.send_sizes);
-	if (karg.request_indices)
-		kfree(karg.request_indices);
-	if (karg.request_sizes)
-		kfree(karg.request_sizes);
-
+	kfree(karg.send_indices);
+	kfree(karg.send_sizes);
+	kfree(karg.request_indices);
+	kfree(karg.request_sizes);
 	return ret;
 }
 
@@ -555,9 +543,7 @@ static int drm32_res_ctx(unsigned int fd
 			ret = -EFAULT;
 	}
 
-	if (karg.contexts)
-		kfree(karg.contexts);
