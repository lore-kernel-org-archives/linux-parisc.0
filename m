Return-Path: <soete.joel@tiscali.be>
Received: from cpout2.tiscali.be (cpout2.tiscali.be [62.235.13.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id 46D234894
	for <parisc-linux@lists.parisc-linux.org>;
	Thu, 22 Jan 2004 08:18:48 -0700 (MST)
Date: Thu, 22 Jan 2004 16:18:44 +0100
Message-ID: <400CB8A10000262E@ocpmta3.freegates.net>
In-Reply-To: <20040122053112.GB6468@colo.lackof.org>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] B2k and CONFIG_PDC_CONSOLE pb: followup
To: "Grant Grundler" <grundler@parisc-linux.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="========/400CB8A10000262E/mail.tiscali.be"
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>


--========/400CB8A10000262E/mail.tiscali.be
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

> You can backport and test that change to 2.4, I'd be happy to apply it.

Ok Grant,

I on going to prepare some backport but need some more time ;)

btw I found the following typo in 2.6:
=========><=========
--- ./drivers/parisc/sba_iommu.c.orig	2004-01-22 16:55:26.080226072 +0100
+++ ./drivers/parisc/sba_iommu.c	2004-01-22 16:56:28.037807088 +0100
@@ -1058,7 +1058,7 @@
 			printk(KERN_DEBUG " %2d : %08lx/%05x %p/%05x\n",
 				nents,
 				(unsigned long) sg_dma_address(startsg), cnt,
-				sg_virt_address(startsg), startsg->length
+				sg_virt_addr(startsg), startsg->length
 		);
 #else
 		DBG_RUN_SG(" %d : %08lx/%05x %p/%05x\n",
==========><==========

hth,
    Joel


-------------------------------------------------------------------------
Tiscali ADSL: 12 mois à 29,50 €/mois! L'Internet rapide, c'est pour tout
le monde.
http://reg.tiscali.be/default.asp?lg=fr



--========/400CB8A10000262E/mail.tiscali.be
Content-Type: application/octet-stream
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="SBA_IOMMU.diff"

LS0tIC4vZHJpdmVycy9wYXJpc2Mvc2JhX2lvbW11LmMub3JpZwkyMDA0LTAxLTIyIDE2OjU1OjI2
LjA4MDIyNjA3MiArMDEwMAorKysgLi9kcml2ZXJzL3BhcmlzYy9zYmFfaW9tbXUuYwkyMDA0LTAx
LTIyIDE2OjU2OjI4LjAzNzgwNzA4OCArMDEwMApAQCAtMTA1OCw3ICsxMDU4LDcgQEAKIAkJCXBy
aW50ayhLRVJOX0RFQlVHICIgJTJkIDogJTA4bHgvJTA1eCAlcC8lMDV4XG4iLAogCQkJCW5lbnRz
LAogCQkJCSh1bnNpZ25lZCBsb25nKSBzZ19kbWFfYWRkcmVzcyhzdGFydHNnKSwgY250LAotCQkJ
CXNnX3ZpcnRfYWRkcmVzcyhzdGFydHNnKSwgc3RhcnRzZy0+bGVuZ3RoCisJCQkJc2dfdmlydF9h
ZGRyKHN0YXJ0c2cpLCBzdGFydHNnLT5sZW5ndGgKIAkJKTsKICNlbHNlCiAJCURCR19SVU5fU0co
IiAlZCA6ICUwOGx4LyUwNXggJXAvJTA1eFxuIiwK

--========/400CB8A10000262E/mail.tiscali.be--
