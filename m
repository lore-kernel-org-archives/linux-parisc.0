Return-Path: <soete.joel@tiscali.be>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id A45764852
	for <parisc-linux@lists.parisc-linux.org>;
	Wed, 17 Mar 2004 04:39:47 -0700 (MST)
Date: Wed, 17 Mar 2004 12:39:38 +0100
Message-ID: <40561E95000014B1@ocpmta3.freegates.net>
In-Reply-To: <Pine.LNX.4.58.0403170046060.29766@sal.ucc.ie>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] SCSI broken in latest CVS changes
To: "M. Grabert" <xam@cs.ucc.ie>, "Randolph Chung" <tausq@debian.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="========/40561E95000014B1/mail.tiscali.be"
Cc: Matthew Wilcox <willy@debian.org>, parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>


--========/40561E95000014B1/mail.tiscali.be
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

Hello,

> Yes, 2.6.5-rc1-pa1 works fine for me!

Not so lucky to even build it with b180 config :(.

It failled with message:
[snip]
  gcc -Wp,-MD,arch/parisc/kernel/.pci-dma.o.d -nostdinc -iwithprefix include
-D__KERNEL__ -Iinclude  -D__KERNEL__ -Iinclude  -Wall -Wstrict-prototypes
-Wno-trigraphs -fno-strict-aliasing -fno-common -pipe -mno-space-regs -mfast-indirect-calls
-mdisable-fpregs -ffunction-sections -march=1.1 -mschedule=7200 -O2     -DKBUILD_BASENAME=pci_dma
-DKBUILD_MODNAME=pci_dma -c -o arch/parisc/kernel/pci-dma.o arch/parisc/kernel/pci-dma.c
arch/parisc/kernel/pci-dma.c:542: error: unknown field `dma_sync_single_cpu'
specified in initializer
arch/parisc/kernel/pci-dma.c:542: error: `pa11_dma_sync_single_cpu' undeclared
here (not in a function)
arch/parisc/kernel/pci-dma.c:542: error: initializer element is not constant
arch/parisc/kernel/pci-dma.c:542: error: (near initialization for `pcx_dma_ops.dma_sync_single_for_cpu')
arch/parisc/kernel/pci-dma.c:543: error: unknown field `dma_sync_single_device'
specified in initializer
arch/parisc/kernel/pci-dma.c:543: error: `pa11_dma_sync_single_device' undeclared
here (not in a function)
arch/parisc/kernel/pci-dma.c:543: error: initializer element is not constant
arch/parisc/kernel/pci-dma.c:543: error: (near initialization for `pcx_dma_ops.dma_sync_single_for_device')
arch/parisc/kernel/pci-dma.c:544: error: unknown field `dma_sync_sg_cpu'
specified in initializer
arch/parisc/kernel/pci-dma.c:544: error: `pa11_dma_sync_sg_cpu' undeclared
here (not in a function)
arch/parisc/kernel/pci-dma.c:544: error: initializer element is not constant
arch/parisc/kernel/pci-dma.c:544: error: (near initialization for `pcx_dma_ops.dma_sync_sg_for_cpu')
arch/parisc/kernel/pci-dma.c:545: error: unknown field `dma_sync_sg_device'
specified in initializer
arch/parisc/kernel/pci-dma.c:545: error: `pa11_dma_sync_sg_device' undeclared
here (not in a function)
arch/parisc/kernel/pci-dma.c:545: error: initializer element is not constant
arch/parisc/kernel/pci-dma.c:545: error: (near initialization for `pcx_dma_ops.dma_sync_sg_for_device')
make[1]: *** [arch/parisc/kernel/pci-dma.o] Error 1
make: *** [arch/parisc/kernel] Error 2


for which the following trivial patch help to build (at least):
--- linux-2.6.5-rc1-pa1/arch/parisc/kernel/pci-dma.c.orig	2004-03-17 13:06:21.123088000
+0100
+++ linux-2.6.5-rc1-pa1/arch/parisc/kernel/pci-dma.c	2004-03-17 13:14:17.063088000
+0100
@@ -539,10 +539,10 @@
 	.unmap_single =		pa11_dma_unmap_single,
 	.map_sg =		pa11_dma_map_sg,
 	.unmap_sg =		pa11_dma_unmap_sg,
-	.dma_sync_single_cpu =	pa11_dma_sync_single_cpu,
-	.dma_sync_single_device = pa11_dma_sync_single_device,
-	.dma_sync_sg_cpu =	pa11_dma_sync_sg_cpu,
-	.dma_sync_sg_device =	pa11_dma_sync_sg_device,
+	.dma_sync_single_for_cpu =	pa11_dma_sync_single_for_cpu,
+	.dma_sync_single_for_device =	pa11_dma_sync_single_for_device,
+	.dma_sync_sg_for_cpu =		pa11_dma_sync_sg_for_cpu,
+	.dma_sync_sg_for_device =	pa11_dma_sync_sg_for_device,
 };
==========><==========

hth,
    joel

PS: I also attched the patch as know pb with webmail interface 

----------------------------------------------------------------------------------------
Tiscali ADSL: 35 €/mois, la meilleure offre du marché!
http://reg.tiscali.be/default.asp?lg=fr




--========/40561E95000014B1/mail.tiscali.be
Content-Type: application/octet-stream
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="pci-dma.c-diff"

LS0tIGxpbnV4LTIuNi41LXJjMS1wYTEvYXJjaC9wYXJpc2Mva2VybmVsL3BjaS1kbWEuYy5vcmln
CTIwMDQtMDMtMTcgMTM6MDY6MjEuMTIzMDg4MDAwICswMTAwCisrKyBsaW51eC0yLjYuNS1yYzEt
cGExL2FyY2gvcGFyaXNjL2tlcm5lbC9wY2ktZG1hLmMJMjAwNC0wMy0xNyAxMzoxNDoxNy4wNjMw
ODgwMDAgKzAxMDAKQEAgLTUzOSwxMCArNTM5LDEwIEBACiAJLnVubWFwX3NpbmdsZSA9CQlwYTEx
X2RtYV91bm1hcF9zaW5nbGUsCiAJLm1hcF9zZyA9CQlwYTExX2RtYV9tYXBfc2csCiAJLnVubWFw
X3NnID0JCXBhMTFfZG1hX3VubWFwX3NnLAotCS5kbWFfc3luY19zaW5nbGVfY3B1ID0JcGExMV9k
bWFfc3luY19zaW5nbGVfY3B1LAotCS5kbWFfc3luY19zaW5nbGVfZGV2aWNlID0gcGExMV9kbWFf
c3luY19zaW5nbGVfZGV2aWNlLAotCS5kbWFfc3luY19zZ19jcHUgPQlwYTExX2RtYV9zeW5jX3Nn
X2NwdSwKLQkuZG1hX3N5bmNfc2dfZGV2aWNlID0JcGExMV9kbWFfc3luY19zZ19kZXZpY2UsCisJ
LmRtYV9zeW5jX3NpbmdsZV9mb3JfY3B1ID0JcGExMV9kbWFfc3luY19zaW5nbGVfZm9yX2NwdSwK
KwkuZG1hX3N5bmNfc2luZ2xlX2Zvcl9kZXZpY2UgPQlwYTExX2RtYV9zeW5jX3NpbmdsZV9mb3Jf
ZGV2aWNlLAorCS5kbWFfc3luY19zZ19mb3JfY3B1ID0JCXBhMTFfZG1hX3N5bmNfc2dfZm9yX2Nw
dSwKKwkuZG1hX3N5bmNfc2dfZm9yX2RldmljZSA9CXBhMTFfZG1hX3N5bmNfc2dfZm9yX2Rldmlj
ZSwKIH07CiAKIAo=

--========/40561E95000014B1/mail.tiscali.be--
