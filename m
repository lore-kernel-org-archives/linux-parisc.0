Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from thinkpad.home (pc3-hem11-4-cust123.bre.cable.ntl.com [213.107.179.123])
	by dsl2.external.hp.com (Postfix) with ESMTP id 816C6483F
	for <parisc-linux@lists.parisc-linux.org>; Fri, 19 Jul 2002 17:21:35 -0600 (MDT)
Date: Fri, 19 Jul 2002 23:19:18 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20020719221917.GF29996@sleepie.demon.co.uk>
References: <20020719225302.874944839@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020719225302.874944839@dsl2.external.hp.com>
Subject: [parisc-linux] Re: [parisc-linux-cvs] linux rhirst
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

On Fri, Jul 19, 2002 at 04:53:02PM -0600, Richard Hirst wrote:
> CVSROOT:	/var/cvs
> Module name:	linux
> Changes by:	rhirst	02/07/19 16:53:02
> 
> Modified files:
> 	.              : Makefile 
> 	drivers/scsi   : Config.in 
> 
> Log message:
> Fix scsi config options so Zalon can be used without PCI

This is a mess, btw.  Basic problem is Zalon, ncr53c8xx, and sym53c8xx
want to share a bunch of config options.  But zalon can run without
pci, the other two can't.  ncr and sym are not allowed if sym_2 is
compiled in, but zalon is, etc, etc.  Cleaner solutions are welcomed!

Richard


Index: drivers/scsi/Config.in
===================================================================
RCS file: /var/cvs/linux/drivers/scsi/Config.in,v
retrieving revision 1.18
retrieving revision 1.19
diff -u -r1.18 -r1.19
--- drivers/scsi/Config.in	4 Jun 2002 18:53:29 -0000	1.18
+++ drivers/scsi/Config.in	19 Jul 2002 22:53:02 -0000	1.19
@@ -147,27 +147,46 @@
       bool '  use normal IO' CONFIG_SCSI_SYM53C8XX_IOMAPPED
    fi
 fi
+define_bool CONFIG_ASK_ZALON n
+define_bool CONFIG_ASK_NCR53C8XX n
+define_bool CONFIG_ASK_SYM53C8XX n
+if [ "$CONFIG_PARISC" = "y" ]; then
+   dep_tristate 'Zalon SCSI support' CONFIG_SCSI_ZALON $CONFIG_GSC $CONFIG_SCSI
+   if [ "$CONFIG_SCSI_ZALON" != "n" ]; then
+      define_bool CONFIG_ASK_ZALON y
+   fi
+else
+  if [ "$CONFIG_PCI" = "y" -a "$CONFIG_SCSI_SYM53C8XX_2" != "y" ]; then
+     dep_tristate 'NCR53C8XX SCSI support' CONFIG_SCSI_NCR53C8XX $CONFIG_SCSI
+     if [ "$CONFIG_SCSI_NCR53C8XX" != "n" ]; then
+        define_bool CONFIG_ASK_NCR53C8XX y
+     fi
+  fi
+fi
 if [ "$CONFIG_PCI" = "y" -a "$CONFIG_SCSI_SYM53C8XX_2" != "y" ]; then
-   dep_tristate 'NCR53C8XX SCSI support' CONFIG_SCSI_NCR53C8XX $CONFIG_SCSI
    dep_tristate 'SYM53C8XX SCSI support' CONFIG_SCSI_SYM53C8XX $CONFIG_SCSI
-   if [ "$CONFIG_PARISC" = "y" ]; then
-      dep_tristate 'Zalon SCSI support' CONFIG_SCSI_ZALON $CONFIG_GSC $CONFIG_SCSI
+   if [ "$CONFIG_SCSI_SYM53C8XX" != "n" ]; then
+      define_bool CONFIG_ASK_SYM53C8XX y
    fi
-   if [ "$CONFIG_SCSI_NCR53C8XX" != "n" -o "$CONFIG_SCSI_ZALON" != "n" -o "$CONFIG_SCSI_SYM53C8XX" != "n" ]; then
-      int  '  default tagged command queue depth' CONFIG_SCSI_NCR53C8XX_DEFAULT_TAGS 8
-      int  '  maximum number of queued commands' CONFIG_SCSI_NCR53C8XX_MAX_TAGS 32
-      int  '  synchronous transfers frequency in MHz' CONFIG_SCSI_NCR53C8XX_SYNC 20
-      bool '  enable profiling' CONFIG_SCSI_NCR53C8XX_PROFILE
+fi
+if [ "$CONFIG_ASK_ZALON" = "y" -o "$CONFIG_ASK_NCR53C8XX" = "y" -o "$CONFIG_ASK_SYM53C8XX" = "y" ]; then
+   int  '  default tagged command queue depth' CONFIG_SCSI_NCR53C8XX_DEFAULT_TAGS 8
+   int  '  maximum number of queued commands' CONFIG_SCSI_NCR53C8XX_MAX_TAGS 32
+   int  '  synchronous transfers frequency in MHz' CONFIG_SCSI_NCR53C8XX_SYNC 20
+   bool '  enable profiling' CONFIG_SCSI_NCR53C8XX_PROFILE
+   if [ "$CONFIG_ASK_ZALON" = "y" ]; then
+      define_bool CONFIG_SCSI_NCR53C8XX_IOMAPPED n
+   else
       bool '  use normal IO' CONFIG_SCSI_NCR53C8XX_IOMAPPED
-      if [ "$CONFIG_SCSI_SYM53C8XX" != "n" ]; then
-	 bool '  include support for the NCR PQS/PDS SCSI card' CONFIG_SCSI_NCR53C8XX_PQS_PDS
-      fi
-      if [ "$CONFIG_SCSI_NCR53C8XX_DEFAULT_TAGS" = "0" ]; then
-	 bool '  not allow targets to disconnect' CONFIG_SCSI_NCR53C8XX_NO_DISCONNECT
-      fi
-      if [ "$CONFIG_EXPERIMENTAL" = "y" ]; then
-	 bool '  assume boards are SYMBIOS compatible (EXPERIMENTAL)' CONFIG_SCSI_NCR53C8XX_SYMBIOS_COMPAT
-      fi
+   fi
+   if [ "$CONFIG_ASK_SYM53C8XX" = "y" ]; then
+      bool '  include support for the NCR PQS/PDS SCSI card' CONFIG_SCSI_NCR53C8XX_PQS_PDS
+   fi
+   if [ "$CONFIG_SCSI_NCR53C8XX_DEFAULT_TAGS" = "0" ]; then
+      bool '  not allow targets to disconnect' CONFIG_SCSI_NCR53C8XX_NO_DISCONNECT
+   fi
+   if [ "$CONFIG_EXPERIMENTAL" = "y" ]; then
+      bool '  assume boards are SYMBIOS compatible (EXPERIMENTAL)' CONFIG_SCSI_NCR53C8XX_SYMBIOS_COMPAT
    fi
 fi
 if [ "$CONFIG_MCA" = "y" ]; then
