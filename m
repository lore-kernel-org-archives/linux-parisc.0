Return-Path: <James.Bottomley@SteelEye.com>
Received: from midgard.sc.steeleye.com (midgard.sc.steeleye.com [172.17.6.40])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id
	i2KL4aa00834; Sat, 20 Mar 2004 16:04:36 -0500
From: James Bottomley <James.Bottomley@steeleye.com>
To: PARISC list <parisc-linux@lists.parisc-linux.org>,
	Helge Deller <deller@parisc-linux.org>
In-Reply-To: <20040320210116.7A727494553@palinux.hppa>
References: <20040320210116.7A727494553@palinux.hppa>
Content-Type: text/plain
Date: 20 Mar 2004 16:04:32 -0500
Message-Id: <1079816673.1778.184.camel@mulgrave>
Mime-Version: 1.0
Cc: parisc-linux-cvs@lists.parisc-linux.org
Subject: [parisc-linux] Re: [parisc-linux-cvs] linux-2.6 jejb
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Sat, 2004-03-20 at 16:01, James Bottomley wrote:
> CVSROOT:	/var/cvs
> Module name:	linux-2.6
> Changes by:	jejb	04/03/20 14:01:16
> 
> Modified files:
> 	drivers/input/keyboard: hpps2atkbd.h 
> 
> Log message:
> Fix compile failure.
> 
> This KEY_103RD is coming to us from the vanilla kernel, but it isn't
> defined anywhere there

Helge, is this fix OK?

James

===== drivers/input/keyboard/hpps2atkbd.h 1.3 vs edited =====
--- 1.3/drivers/input/keyboard/hpps2atkbd.h	Tue Mar 16 17:05:31 2004
+++ edited/drivers/input/keyboard/hpps2atkbd.h	Tue Mar 16 19:23:14 2004
@@ -50,7 +50,7 @@
 /* 60 */  KEY_DOWN,     C_61,          KEY_PAUSE,     KEY_UP,        KEY_DELETE,    KEY_END,      KEY_BACKSPACE, KEY_INSERT,
 /* 68 */  KEY_RESERVED, KEY_KP1,       KEY_RIGHT,     KEY_KP4,       KEY_KP7,       KEY_PAGEDOWN, KEY_HOME,      KEY_PAGEUP,
 /* 70 */  KEY_KP0,      KEY_KPDOT,     KEY_KP2,       KEY_KP5,       KEY_KP6,       KEY_KP8,      KEY_ESC,       KEY_NUMLOCK,
-/* 78 */  KEY_F11,      KEY_KPPLUS,    KEY_KP3,       KEY_KPMINUS,   KEY_KPASTERISK,KEY_KP9,      KEY_SCROLLLOCK,KEY_103RD,
+/* 78 */  KEY_F11,      KEY_KPPLUS,    KEY_KP3,       KEY_KPMINUS,   KEY_KPASTERISK,KEY_KP9,      KEY_SCROLLLOCK,KEY_102ND,
 /* 80 */  KEY_RESERVED, KEY_RESERVED,  KEY_RESERVED,  KEY_RESERVED,  KEY_RESERVED,  KEY_RESERVED, KEY_RESERVED,  KEY_RESERVED,
 /* 88 */  KEY_RESERVED, KEY_RESERVED,  KEY_RESERVED,  KEY_RESERVED,  KEY_RESERVED,  KEY_RESERVED, KEY_RESERVED,  KEY_RESERVED,
 /* 90 */  KEY_RESERVED, KEY_RIGHTALT,  KEY_SYSRQ,     KEY_RESERVED,  KEY_RIGHTCTRL, KEY_RESERVED, KEY_RESERVED,  KEY_RESERVED,
