Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc2-hems4-0-cust95.bre.cable.ntl.com [213.107.176.95])
	by dsl2.external.hp.com (Postfix) with ESMTP id 62A75482A
	for <parisc-linux@lists.parisc-linux.org>; Sat, 23 Jun 2001 19:06:42 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 6625AB00C; Sun, 24 Jun 2001 02:07:19 +0100 (BST)
Date: Sun, 24 Jun 2001 02:07:19 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] boot-floppies build status
Message-ID: <20010624020719.K14416@linuxcare.com>
References: <20010623170024.G14416@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010623170024.G14416@linuxcare.com>; from rhirst@linuxcare.com on Sat, Jun 23, 2001 at 05:00:25PM +0100
List-ID: <linux-parisc.vger.kernel.org>

On Sat, Jun 23, 2001 at 05:00:25PM +0100, Richard Hirst wrote:
> I tried to build the latest busybox, but failed.  conflicting types for
> blah blah blah.

Bug filed at bugs.d.o


diff -ur busybox-0.51.orig.clean/applets.c busybox-0.51.orig/applets.c
--- busybox-0.51.orig.clean/applets.c	Tue Apr  3 18:05:01 2001
+++ busybox-0.51.orig/applets.c	Sun Jun 24 01:40:03 2001
@@ -78,7 +78,7 @@
 	return strcmp(name, applet->name);
 }
 
-extern size_t NUM_APPLETS;
+extern const size_t NUM_APPLETS;
 
 struct BB_applet *find_applet_by_name(const char *name)
 {
diff -ur busybox-0.51.orig.clean/messages.c busybox-0.51.orig/messages.c
--- busybox-0.51.orig.clean/messages.c	Thu Mar 15 22:58:11 2001
+++ busybox-0.51.orig/messages.c	Sun Jun 24 01:38:10 2001
@@ -41,9 +41,9 @@
 #define _BB_MESSAGES_C
 
 #ifdef BB_DECLARE_EXTERN
-#  define BB_DEF_MESSAGE(symbol, string_const) extern const char *symbol;
+#  define BB_DEF_MESSAGE(symbol, string_const) extern const char * const symbol;
 #else
-#  define BB_DEF_MESSAGE(symbol, string_const) const char *symbol = string_const;
+#  define BB_DEF_MESSAGE(symbol, string_const) const char * const symbol = string_const;
 #endif
 
 
