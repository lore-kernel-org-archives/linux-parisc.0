From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: [PATCH] parisc: decode_exc.c should include kernel.h
Date: Mon, 6 Apr 2009 13:29:58 +0400
Message-ID: <a4423d670904060229l650519e8we17578f4b439a1cb@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
To: Kyle McMartin <kyle@mcmartin.ca>, linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Fix this build error:
arch/parisc/math-emu/decode_exc.c:351: undefined reference to `printk'

Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>
---

 arch/parisc/math-emu/decode_exc.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/parisc/math-emu/decode_exc.c
b/arch/parisc/math-emu/decode_exc.c
index 66c8a9f..3ca1c61 100644
--- a/arch/parisc/math-emu/decode_exc.c
+++ b/arch/parisc/math-emu/decode_exc.c
@@ -40,7 +40,7 @@
  * END_DESC
 */
