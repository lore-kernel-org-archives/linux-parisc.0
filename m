From: Greg Kroah-Hartman <gregkh@suse.de>
Subject: [PATCH 12/36] parisc: cleanup console handling
Date: Thu,  6 Jan 2011 14:23:01 -0800
Message-ID: <1294352605-31906-12-git-send-email-gregkh@suse.de>
References: <20110106215404.GA30624@kroah.com>
Cc: Jiri Slaby <jslaby@suse.cz>, Helge Deller <deller@gmx.de>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	linux-parisc@vger.kernel.org, Greg Kroah-Hartman <gregkh@suse.de>
To: linux-kernel@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20110106215404.GA30624@kroah.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

From: Jiri Slaby <jslaby@suse.cz>

* use newly added for_each_console for iterating consoles
* add proper console locking
* do not initialize tmp twice
* no need to declare console_drivers, it's already done in console.h

Signed-off-by: Jiri Slaby <jslaby@suse.cz>
Acked-by: Kyle McMartin <kyle@mcmartin.ca>
Cc: Helge Deller <deller@gmx.de>
Cc: "James E.J. Bottomley" <jejb@parisc-linux.org>
Cc: linux-parisc@vger.kernel.org
Signed-off-by: Greg Kroah-Hartman <gregkh@suse.de>
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
