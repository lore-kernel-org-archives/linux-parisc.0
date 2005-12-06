From: Guy Martin <gmsoft@tuxicoman.be>
Subject: [parisc-linux] parport_gsc unuseable
Date: Tue, 6 Dec 2005 20:59:02 +0100
Message-ID: <20051206205902.4cb1290d.gmsoft@tuxicoman.be>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="Multipart=_Tue__6_Dec_2005_20_59_02_+0100_EJd8LEQoT6L6i8Uz"
To: parisc-linux@parisc-linux.org
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

This is a multi-part message in MIME format.

--Multipart=_Tue__6_Dec_2005_20_59_02_+0100_EJd8LEQoT6L6i8Uz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit


Hi all,

Since 2.6.12, the parport_gsc driver is not useable due to some changes in the parport driver.
A 'select PARPORT_NOT_PC' line in the Kconfig was added to every non-pc driver but the gsc one.

Patching the kernel with the attached fix makes the parport driver working again.

Happy printing :)

  Guy

--Multipart=_Tue__6_Dec_2005_20_59_02_+0100_EJd8LEQoT6L6i8Uz
Content-Type: text/x-patch;
 name="parport_gsc-PARPORT_NOT_PC.diff"
Content-Disposition: attachment;
 filename="parport_gsc-PARPORT_NOT_PC.diff"
Content-Transfer-Encoding: 7bit

diff -uNr linux-2.6.14.orig/drivers/parport/Kconfig linux-2.6.14/drivers/parport/Kconfig
--- linux-2.6.14.orig/drivers/parport/Kconfig	2005-12-06 20:38:34.000000000 +0100
+++ linux-2.6.14/drivers/parport/Kconfig	2005-12-06 20:41:22.000000000 +0100
@@ -121,6 +121,7 @@
 	tristate
 	default GSC
 	depends on PARPORT
+	select PARPORT_NOT_PC
 
 config PARPORT_SUNBPP
 	tristate "Sparc hardware (EXPERIMENTAL)"

--Multipart=_Tue__6_Dec_2005_20_59_02_+0100_EJd8LEQoT6L6i8Uz
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--Multipart=_Tue__6_Dec_2005_20_59_02_+0100_EJd8LEQoT6L6i8Uz--
