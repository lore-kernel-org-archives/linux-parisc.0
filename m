From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: document the shadow registers
Date: Sat, 29 Jun 2013 13:24:16 +0200
Message-ID: <20130629112416.GA1287@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/Documentation/parisc/registers b/Documentation/parisc/registers
index dd3cadd..10c7d17 100644
--- a/Documentation/parisc/registers
+++ b/Documentation/parisc/registers
@@ -78,6 +78,14 @@ Shadow Registers		used by interruption handler code
 TOC enable bit			1
 
 =========================================================================
+
+The PA-RISC architecture defines 7 registers as "shadow registers".
+Those are used in RETURN FROM INTERRUPTION AND RESTORE instruction to reduce
+the state save and restore time by eliminating the need for general register
+(GR) saves and restores in interruption handlers.
+Shadow registers are the GRs 1, 8, 9, 16, 17, 24, and 25.
+
+=========================================================================
 Register usage notes, originally from John Marvin, with some additional
 notes from Randolph Chung.
 
