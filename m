From: Stuart Brady <sdbrady@ntlworld.com>
Subject: [parisc-linux] [PATCH] Fix HIL Mouse driver for 2.6
Date: Thu, 26 Aug 2004 05:54:14 +0100
Message-ID: <20040826045414.GA3510@ntlworld.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hi,

This patch makes the HIL pointer driver work in 2.6.  I have tested
it with both gpm and xfree86.

IIUC, users of PS/2 mice with HIL hubs should use the psmouse driver
(CONFIG_MOUSE_PS2) instead.  CONFIG_MOUSE_HIL is not needed for this.

The hil_ptr driver is for genuine HIL mice.  To compile it you need
CONFIG_MOUSE_HIL.  CONFIG_MOUSE_PS2 is not needed for HIL mice.

Index: drivers/input/mouse/hil_ptr.c
===================================================================
RCS file: /var/cvs/linux-2.6/drivers/input/mouse/hil_ptr.c,v
retrieving revision 1.8
diff -u -r1.8 hil_ptr.c
--- drivers/input/mouse/hil_ptr.c	6 Jan 2004 22:31:59 -0000	1.8
+++ drivers/input/mouse/hil_ptr.c	26 Aug 2004 03:58:11 -0000
@@ -176,6 +176,7 @@
 		btn = ptr->btnmap[btn];
 		input_report_key(dev, btn, !up);
 	}
+	input_sync(dev);
  out:
 	ptr->idx4 = 0;
 	up(&ptr->sem);
@@ -284,6 +285,7 @@
 
 	up(&(ptr->sem));
 
+	init_input_dev(&ptr->dev);
 	did = ptr->idd[0];
 	idd = ptr->idd + 1;
 	txt = "unknown";

-- 
Stuart Brady
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
