From: Kyle McMartin <kyle@mcmartin.ca>
Subject: parisc: quiet palo not-found message from "which"
Date: Sun, 7 Dec 2008 23:43:08 -0500
Message-ID: <20081208044308.GA9092@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Reduces moaning when building on a machine without palo installed.

Signed-off-by: Kyle McMartin <kyle@mcmartin.ca>
---
 arch/parisc/Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/parisc/Makefile b/arch/parisc/Makefile
index 5ddad7b..0d42827 100644
--- a/arch/parisc/Makefile
+++ b/arch/parisc/Makefile
@@ -77,7 +77,7 @@ libs-y	+= arch/parisc/lib/ `$(CC) -print-libgcc-file-name`
 
 drivers-$(CONFIG_OPROFILE)		+= arch/parisc/oprofile/
 
-PALO := $(shell if which palo; then : ; \
+PALO := $(shell if (which palo 2>&1); then : ; \
 	elif [ -x /sbin/palo ]; then echo /sbin/palo; \
 	fi)
 
-- 
1.5.6.5

