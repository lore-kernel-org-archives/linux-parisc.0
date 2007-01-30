From: Guy Martin <gmsoft@tuxicoman.be>
Subject: [parisc-linux] GCC 4.1.1 generates invalid mfctl,w asm instruction
Date: Tue, 30 Jan 2007 15:19:34 +0100
Message-ID: <20070130151934.cf3622e4.gmsoft__31801.6100013212$1416624273$gmane$org@tuxicoman.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
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


Hi all,

Reference : http://h21007.www2.hp.com/dspp/tech/tech_TechDocumentDetailPage_IDX/1,1701,959!114!244,00.html

According this doc, the ,w completer of the mfctl instruction is only used for the cr11 register. This is the way binutils handle it.
However, gcc will generate the following instruction "mfctl,w %%cr27,%0" while compiling glibc-2.5 on pa2.0.

This little patch fix this :

diff -uNr gcc-4.1.1.orig/gcc/config/pa/pa.md gcc-4.1.1/gcc/config/pa/pa.md
--- gcc-4.1.1.orig/gcc/config/pa/pa.md  2007-01-30 06:59:07.579391048 +0000
+++ gcc-4.1.1/gcc/config/pa/pa.md       2007-01-30 07:23:29.213188936 +0000
@@ -9854,7 +9854,7 @@
   [(set (match_operand:SI 0 "register_operand" "=r")
        (unspec:SI [(const_int 0)] UNSPEC_TP))]
   ""
-  "{mfctl|mfctl,w} %%cr27,%0"
+  "mfctl %%cr27,%0"
   [(set_attr "type" "multi")
    (set_attr "length" "4")])


Please review.


Regards,
  Guy


-- 
Guy Martin
Gentoo Linux - HPPA port Lead

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
