From: Erlend Aasland <erlend-a@ux.his.no>
Subject: [parisc-linux] [TRIVIAL PATCH 2.5] get rid of CONFIG_UDF_RW (parisc)
Date: Tue, 3 Dec 2002 14:10:00 +0100
Message-ID: <20021203131000.GG2417__24484.3211760328$1416621990$gmane$org@johanna5.ux.his.no>
References: <20021203125120.GA2417@johanna5.ux.his.no>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: LKML <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <matthew@wil.cx>, parisc-linux@parisc-linux.org
To: Trivial Patch Monkey <trivial@rustcorp.com.au>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <20021203125120.GA2417@johanna5.ux.his.no>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Remove CONFIG_UDF_RW from parisc defconfig (it's not used anymore)

Regards,
	Erlend Aasland

diff -urN linux-2.5.50/arch/parisc/defconfig linux-2.5.50-eaa/arch/parisc/defconfig
--- linux-2.5.50/arch/parisc/defconfig	Fri Nov  1 00:07:19 2002
+++ linux-2.5.50-eaa/arch/parisc/defconfig	Tue Dec  3 00:48:05 2002
@@ -576,7 +576,6 @@
 CONFIG_EXT2_FS=y
 # CONFIG_SYSV_FS is not set
 # CONFIG_UDF_FS is not set
-# CONFIG_UDF_RW is not set
 # CONFIG_UFS_FS is not set
 # CONFIG_UFS_FS_WRITE is not set
 
