Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id SAA26212
	for <parisc-linux@puffin.external.hp.com>; Sun, 3 Dec 2000 18:39:06 -0700
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 4 Dec 2000 01:41:34 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id MAA18157;
	Mon, 4 Dec 2000 12:41:29 +1100
Date: Mon, 4 Dec 2000 12:41:29 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: parisc-linux@thepuffingroup.com
cc: Richard Hirst <rhirst@linuxcare.com>
Subject: Re: pa reload problem
In-Reply-To: <Pine.LNX.4.21.0012021932030.21742-100000@front.linuxcare.com.au>
Message-ID: <Pine.LNX.4.21.0012041223530.13095-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

I've applied this patch to pehc CVS to fix an hppa64 gcc problem that
Richard found when compiling modules for the 64-bit kernel.  It's not
specific to modules, but rather can affect anything requiring stubs to
call functions, eg. 64-bit userland linked to shared libs.

-- 
Linuxcare.  Support for the Revolution.

--- gcc/flow.c~	Thu Sep 28 10:37:45 2000
+++ gcc/flow.c	Mon Dec  4 09:53:44 2000
@@ -3298,7 +3298,17 @@
 	 to any pseudo before reload is a potential reference of the
 	 frame pointer.  */
       if (! reload_completed)
-	SET_REGNO_REG_SET (new_live_at_end, FRAME_POINTER_REGNUM);
+	{
+	  SET_REGNO_REG_SET (new_live_at_end, FRAME_POINTER_REGNUM);
+#ifdef PIC_OFFSET_TABLE_REGNUM
+	  /* And also for the pic register.  References to constants
+	     may require reloading via the pic register.  Assume the
+	     pic register is not in use, or will be handled by other
+	     means, if it is not fixed.  */
+	  if (fixed_regs[PIC_OFFSET_TABLE_REGNUM])
+	    SET_REGNO_REG_SET (new_live_at_end, PIC_OFFSET_TABLE_REGNUM);
+#endif
+	}
 
       /* Regs used in phi nodes are not included in
 	 global_live_at_start, since they are live only along a
