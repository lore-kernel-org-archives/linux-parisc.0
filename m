Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id AAA30666
	for <parisc-linux@puffin.external.hp.com>; Sat, 2 Dec 2000 00:31:35 -0700
Message-Id: <200012020733.CAA24227@hiauly1.hia.nrc.ca>
Subject: Re: pa reload problem
To: alan@linuxcare.com.au (Alan Modra)
Date: Sat, 2 Dec 2000 02:33:35 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: law@cygnus.com, rhirst@linuxcare.com, parisc-linux@thepuffingroup.com
In-Reply-To: <Pine.LNX.4.21.0012011737510.2814-100000@front.linuxcare.com.au> from "Alan Modra" at Dec 1, 2000 06:00:38 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> Or is a better solution to simply ensure that r27 never dies?  I'm
> thinking of ABI and (non-gnu) linker considerations.  eg. DLTIND21L relocs
> not involving r27 may cause something to barf.

Here is a patch that I think resolves the problem.  The principal fix is
not to define PIC_OFFSET_TABLE_REG_CALL_CLOBBERED.  The reason for not
defining this is the call expander explicitly restores the pic offset register
after each call.  Thus, I think we can lie about the register being
clobbered.

When PIC_OFFSET_TABLE_REG_CALL_CLOBBERED is not defined and 
PIC_OFFSET_TABLE_REGNUM is a fixed register, flow.c implicitly puts a
use for the register at the end of each function.  This prevents combine
from "eliminating" r27.

In testing this, I tried to build glibc.  However, there seems to be
a problem with `L' character constants.  I keep getting the error
"character constant too long".  As another test, I am running a PIC
bootstrap and check in 32 bit mode under hpux 10.20.

Give it a whirl and see what you think.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)

2000-12-02  John David Anglin  <dave@hiauly1.hia.nrc.ca>

	* pa.h (PIC_OFFSET_TABLE_REG_CALL_CLOBBERED): Don't define.
	* pa32-regs.h (CONDITIONAL_REGISTER_USAGE): When generating pic code,
	PIC_OFFSET_TABLE_REGNUM_SAVED is a call_used register.
	* pa64-regs.h (CONDITIONAL_REGISTER_USAGE): Likewise.

--- pa.h.orig	Wed Sep 27 14:28:34 2000
+++ pa.h	Fri Dec  1 14:37:02 2000
@@ -492,10 +492,11 @@
 #define STATIC_CHAIN_REGNUM 29
 
 /* Register which holds offset table for position-independent
-   data references.  */
+   data references.  We save and restore PIC_OFFSET_TABLE_REGNUM
+   across calls so PIC_OFFSET_TABLE_REG_CALL_CLOBBERED shouldn't
+   be defined.  */
 
 #define PIC_OFFSET_TABLE_REGNUM (TARGET_64BIT ? 27 : 19)
-#define PIC_OFFSET_TABLE_REG_CALL_CLOBBERED 1
 
 /* Register into which we save the PIC_OFFEST_TABLE_REGNUM so that it
    can be restore across function calls.  */
--- pa32-regs.h.orig	Fri Jul  7 19:59:16 2000
+++ pa32-regs.h	Fri Dec  1 16:10:07 2000
@@ -113,6 +113,7 @@
     {						\
       fixed_regs[PIC_OFFSET_TABLE_REGNUM] = 1;	\
       fixed_regs[PIC_OFFSET_TABLE_REGNUM_SAVED] = 1;\
+      call_used_regs[PIC_OFFSET_TABLE_REGNUM_SAVED] = 1;\
     }						\
 }
 
--- pa64-regs.h.orig	Fri Jul  7 19:59:16 2000
+++ pa64-regs.h	Fri Dec  1 16:11:09 2000
@@ -112,6 +112,7 @@
     {						\
       fixed_regs[PIC_OFFSET_TABLE_REGNUM] = 1;	\
       fixed_regs[PIC_OFFSET_TABLE_REGNUM_SAVED] = 1;\
+      call_used_regs[PIC_OFFSET_TABLE_REGNUM_SAVED] = 1;\
     }						\
 }
 
