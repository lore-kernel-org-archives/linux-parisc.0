From: Helge Deller <deller@gmx.de>
Subject: [PATCH] parisc: fix `struct pt_regs' declared inside parameter list
 warning
Date: Tue, 13 Jan 2009 20:52:46 +0100
Message-ID: <496CF10E.4020502@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
To: Kyle McMartin <kyle@mcmartin.ca>,
	linux-parisc <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Fix those compile warnings:
uaccess.h:244: warning: `struct pt_regs' declared inside parameter list
uaccess.h:244: warning: its scope is only this definition or declaration, which is probably not what you want

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/arch/parisc/include/asm/uaccess.h b/arch/parisc/include/asm/uaccess.h
index 1c6dbb6..cd4c0b2 100644
--- a/arch/parisc/include/asm/uaccess.h
+++ b/arch/parisc/include/asm/uaccess.h
@@ -241,6 +241,7 @@ unsigned long copy_in_user(void __user *dst, const void __user *src, unsigned lo
 #define __copy_to_user_inatomic __copy_to_user
 #define __copy_from_user_inatomic __copy_from_user
 
+struct pt_regs;
 int fixup_exception(struct pt_regs *regs);
 
 #endif /* __PARISC_UACCESS_H */
