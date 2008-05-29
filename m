From: rubisher <rubisher@scarlet.be>
Subject: 6a4be75aa84b0bea7939bca1af112fb3c2dfd86e make my gcc (still 4.2)
 unhappy ;<(
Date: Thu, 29 May 2008 17:24:04 +0000
Message-ID: <483EE6B4.2080600@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
To: Kyle McMartin <kyle@mcmartin.ca>, linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hello Kyle,

This hunk:
+
+/* from pacache.S -- needed for copy_page */
+extern void copy_user_page_asm(void);
+EXPORT_SYMBOL(copy_user_page_asm);

made my 32bit kernel build failing because:
<./include/asm-parisc/page.h>

contains this prototype:

void copy_user_page_asm(void *to, void *from);

I so tried:
+extern void copy_user_page_asm(void *to, void *from);

and it seems to help to build a bootable kernel on my b2k but I ignore if it's the right stuff to do?

Tia,
	r.
