Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 783B8483E
	for <parisc-linux@lists.parisc-linux.org>; Sat, 22 Jun 2002 03:09:47 -0600 (MDT)
From: Helge Deller <deller@gmx.de>
To: parisc-linux@lists.parisc-linux.org,
	deller@dsl2.external.hp.com (Helge Deller),
	parisc-linux-cvs@lists.parisc-linux.org
Date: Sat, 22 Jun 2002 11:07:59 +0200
References: <20020622090559.94D1B4835@dsl2.external.hp.com>
In-Reply-To: <20020622090559.94D1B4835@dsl2.external.hp.com>
MIME-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_v5DF9KDjHkEpJ5e"
Message-Id: <200206221107.59319.deller@gmx.de>
Subject: [parisc-linux] 2.4.18-pa40, added SNDCTL_DSP_SYNC ioctl to harmony driver
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

--Boundary-00=_v5DF9KDjHkEpJ5e
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Content-Disposition: inline

On Saturday 22 June 2002 11:05, Helge Deller wrote:
> CVSROOT:	/var/cvs
> Module name:	linux
> Changes by:	deller	02/06/22 03:05:59
>
> Modified files:
> 	.              : Makefile
> 	drivers/sound  : harmony.c
>
> Log message:
> 2.4.18-pa40
> - added SNDCTL_DSP_SYNC to harmony driver (allows recording with sox)
> This patch was contributed by James Mcclain <jmccla3@gl.umbc.edu>
> http://lists.parisc-linux.org/pipermail/parisc-linux/2002-June/016688.html

--Boundary-00=_v5DF9KDjHkEpJ5e
Content-Type: text/plain;
  charset="iso-8859-1";
  name="diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline; filename="diff"

Index: Makefile
===================================================================
RCS file: /var/cvs/linux/Makefile,v
retrieving revision 1.310
diff -u -p -r1.310 Makefile
--- Makefile	2002/06/19 06:59:25	1.310
+++ Makefile	2002/06/22 09:02:46
@@ -1,7 +1,7 @@
 VERSION = 2
 PATCHLEVEL = 4
 SUBLEVEL = 18
-EXTRAVERSION = -pa39
+EXTRAVERSION = -pa40
 
 KERNELRELEASE=$(VERSION).$(PATCHLEVEL).$(SUBLEVEL)$(EXTRAVERSION)
 
Index: drivers/sound/harmony.c
===================================================================
RCS file: /var/cvs/linux/drivers/sound/harmony.c,v
retrieving revision 1.27
diff -u -p -r1.27 harmony.c
--- drivers/sound/harmony.c	2002/03/26 20:59:01	1.27
+++ drivers/sound/harmony.c	2002/06/22 09:02:47
@@ -724,7 +724,11 @@ static int harmony_audio_ioctl(struct in
 		info.fragsize = HARMONY_BUF_SIZE;
                 info.bytes = info.fragments * info.fragsize;
 		return copy_to_user((void *)arg, &info, sizeof(info));
+	
+	case SNDCTL_DSP_SYNC:
+		return 0;
 	}
+	
 	return -EINVAL;
 }
 

--Boundary-00=_v5DF9KDjHkEpJ5e--
