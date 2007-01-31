From: Guy Martin <gmsoft@gentoo.org>
Subject: [parisc-linux] [patch] GCC generates incorrect mfctl instruction
Date: Wed, 31 Jan 2007 09:43:36 +0100
Message-ID: <20070131094336.dfaa715c.gmsoft__45099.6755309918$1416624272$gmane$org@gentoo.org>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="Multipart=_Wed__31_Jan_2007_09_43_36_+0100_coI_fUCNyXUQz64F"
To: parisc-linux@lists.parisc-linux.org
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

--Multipart=_Wed__31_Jan_2007_09_43_36_+0100_coI_fUCNyXUQz64F
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit


Hi all,

This patch removes the ,w completer of the mfctl instruction when not used with cr11.
Only cr11 needs the ,w completer on PA2.0.

Reference : http://h21007.www2.hp.com/dspp/tech/tech_TechDocumentDetailPage_IDX/1,1701,959!114!244,00.html

Please review.

  Guy

-- 
Guy Martin
Gentoo Linux - HPPA port Lead


--Multipart=_Wed__31_Jan_2007_09_43_36_+0100_coI_fUCNyXUQz64F
Content-Type: text/x-patch;
 name="gcc-4.1.1-mfctl-fix.patch"
Content-Disposition: attachment;
 filename="gcc-4.1.1-mfctl-fix.patch"
Content-Transfer-Encoding: 7bit


Do not use ,w completer for register != cr11.

Signed-off-by: Guy Martin <gmsoft@tuxicoman.be>

diff -uNr gcc-4.1.1.orig/gcc/config/pa/pa.md gcc-4.1.1/gcc/config/pa/pa.md
--- gcc-4.1.1.orig/gcc/config/pa/pa.md	2007-01-30 06:59:07.579391048 +0000
+++ gcc-4.1.1/gcc/config/pa/pa.md	2007-01-30 07:23:29.213188936 +0000
@@ -9854,7 +9854,7 @@
   [(set (match_operand:SI 0 "register_operand" "=r")
 	(unspec:SI [(const_int 0)] UNSPEC_TP))]
   ""
-  "{mfctl|mfctl,w} %%cr27,%0"
+  "mfctl %%cr27,%0"
   [(set_attr "type" "multi")
    (set_attr "length" "4")])
 

--Multipart=_Wed__31_Jan_2007_09_43_36_+0100_coI_fUCNyXUQz64F
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--Multipart=_Wed__31_Jan_2007_09_43_36_+0100_coI_fUCNyXUQz64F--
