From: Chen Gang <gang.chen@asianux.com>
Subject: [PATCH] parisc: Kconfig: use 'PA8X00' as the default choise instead
 of 'PA7000'
Date: Wed, 24 Jul 2013 16:12:02 +0800
Message-ID: <51EF8C52.50403@asianux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Cc: Parisc List <linux-parisc@vger.kernel.org>
To: "James E.J. Bottomley" <jejb@parisc-linux.org>,
	Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

=46or server, 64-bit kernel is widely used and '64BIT' have been alread=
y
as the default option of a server.

So better to use 64-bit kernel as default choise instead of 32-bit
kernel.

Or when use cross-compiler 'hppa64-linux-gnu-gcc' with allmodconfig, it
will report BUILD_BUG_ON:

  arch/parisc/mm/init.c: In function =91mem_init=92:
  arch/parisc/mm/init.c:581:2: error: call to =91__compiletime_assert_5=
81=92 declared with attribute error: BUILD_BUG_ON failed: PTE_ENTRY_SIZ=
E !=3D sizeof(pte_t)


Signed-off-by: Chen Gang <gang.chen@asianux.com>
---
 arch/parisc/Kconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index aa399a5..37bdecf 100644
--- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -111,7 +111,7 @@ menu "Processor type and features"
=20
 choice
 	prompt "Processor type"
-	default PA7000
+	default PA8X00
=20
 config PA7000
 	bool "PA7000/PA7100"
--=20
1.7.7.6
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
