Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id LAA15653
	for <parisc-linux@puffin.external.hp.com>; Wed, 17 Nov 1999 11:29:15 -0700
Received: (from dave@localhost)
	by hiauly1.hia.nrc.ca (8.9.3/8.9.3) id NAA17093
	for parisc-linux@thepuffingroup.com; Wed, 17 Nov 1999 13:30:51 -0500 (EST)
Message-Id: <199911171830.NAA17093@hiauly1.hia.nrc.ca>
To: parisc-linux@thepuffingroup.com
Date: Wed, 17 Nov 1999 13:30:51 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Subject: [parisc-linux] Missing extern's in keyboard.h
List-ID: <linux-parisc.vger.kernel.org>

The following was noticed in the hunt for undefined common variables.
A number of extern's are missing in keyboard.h.  As a result, keyboard.h
actually defines the variables instead of just prototyping them.  The
initialization of them should be in keyboard.c.

-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)

--- keyboard.h.orig	Sun Nov 14 17:30:33 1999
+++ keyboard.h	Tue Nov 16 18:43:15 1999
@@ -33,13 +33,13 @@
 extern void parisckbd_init_hw(void);
 
 extern void parisckbd_request_region(void);
-int (*parisckbd_request_irq)(void (*handler)(int, void *, struct pt_regs*));
-unsigned char (*parisckbd_read_input)(void);
-unsigned char (*parisckbd_read_status)(void);
-void (*parisckbd_write_output)(unsigned char val);
-void (*parisckbd_write_command)(unsigned char val);
-char *(*parisckbd_test)(void);
-char *(*parisckbd_reset)(void);
+extern int (*parisckbd_request_irq)(void (*handler)(int, void *, struct pt_regs*));
+extern unsigned char (*parisckbd_read_input)(void);
+extern unsigned char (*parisckbd_read_status)(void);
+extern void (*parisckbd_write_output)(unsigned char val);
+extern void (*parisckbd_write_command)(unsigned char val);
+extern char *(*parisckbd_test)(void);
+extern char *(*parisckbd_reset)(void);
 
 #define kbd_setkeycode		pckbd_setkeycode
 #define kbd_getkeycode		pckbd_getkeycode
