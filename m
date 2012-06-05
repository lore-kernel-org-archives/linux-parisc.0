From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: [PATCH 2/3] fix compile break in use of lib/strncopy_from_user.c
Date: Tue, 05 Jun 2012 13:53:04 +0900
Message-ID: <1338871984.5176.10.camel@dabdike>
References: <1338871679.5176.7.camel@dabdike>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: Linus Torvalds <torvalds@linux-foundation.org>
To: Parisc List <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1338871679.5176.7.camel@dabdike>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Linus broke us with

commit 36126f8f2ed8168eb13aa0662b9b9585cba100a9
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat May 26 10:43:17 2012 -0700

    word-at-a-time: make the interfaces truly generic

By moving functions defined in strncopy_from_user.c into the asm-geneic
version word-at-a-time.h.  Spark and OpenRisc were fixed to use this, but
not parisc.  Fix by adding to generic-y in asm/Kbuild
---
 arch/parisc/include/asm/Kbuild |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/parisc/include/asm/Kbuild b/arch/parisc/include/asm/Kbuild
index 19a434f..4383707 100644
--- a/arch/parisc/include/asm/Kbuild
+++ b/arch/parisc/include/asm/Kbuild
@@ -1,3 +1,4 @@
 include include/asm-generic/Kbuild.asm
 
 header-y += pdc.h
+generic-y += word-at-a-time.h
-- 
1.7.4.1



