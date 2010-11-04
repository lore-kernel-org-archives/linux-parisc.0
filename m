From: Jiri Slaby <jslaby@suse.cz>
Subject: [PATCH v2 2/5] parisc: cleanup console handling
Date: Thu,  4 Nov 2010 16:20:21 +0100
Message-ID: <1288884024-23873-2-git-send-email-jslaby@suse.cz>
References: <1288884024-23873-1-git-send-email-jslaby@suse.cz>
Cc: werner@suse.de, alan@lxorguk.ukuu.org.uk, gregkh@suse.de,
	linux-kernel@vger.kernel.org, jirislaby@gmail.com,
	Kyle McMartin <kyle@mcmartin.ca>, Helge Deller <deller@gmx.de>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	linux-parisc@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1288884024-23873-1-git-send-email-jslaby@suse.cz>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

* use newly added for_each_console for iterating consoles
* add proper console locking
* do not initialize tmp twice
* no need to declare console_drivers, it's already done in console.h

Signed-off-by: Jiri Slaby <jslaby@suse.cz>
Cc: Kyle McMartin <kyle@mcmartin.ca>
Cc: Helge Deller <deller@gmx.de>
Cc: "James E.J. Bottomley" <jejb@parisc-linux.org>
Cc: linux-parisc@vger.kernel.org
---
 arch/parisc/kernel/pdc_cons.c |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/parisc/kernel/pdc_cons.c b/arch/parisc/kernel/pdc_cons.c
index 66d1f17..11bdd68 100644
--- a/arch/parisc/kernel/pdc_cons.c
+++ b/arch/parisc/kernel/pdc_cons.c
@@ -92,8 +92,6 @@ static int pdc_console_setup(struct console *co, char *options)
 
 static struct timer_list pdc_console_timer;
 
-extern struct console * console_drivers;
