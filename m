Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id NAA24222
	for <parisc-linux@puffin.external.hp.com>; Mon, 6 Dec 1999 13:54:42 -0700
Date: Mon, 6 Dec 1999 20:36:59 +0100
From: Philipp Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>
To: Philipp Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Linker problems
Message-Id: <19991206203659.C21512@mathe.stud.uni-erlangen.de>
References: <19991205222205.B22241@mathe.stud.uni-erlangen.de> <199912052206.RAA24956@hiauly1.hia.nrc.ca> <19991206035320.A21512@mathe.stud.uni-erlangen.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <19991206035320.A21512@mathe.stud.uni-erlangen.de>
List-ID: <linux-parisc.vger.kernel.org>

> I just verified that the problem exists with the linker as compiled from the
> GPL'd source (which required some minor modifications to the CVS ld).

Here's the diff against fixups.c (including stuff I added to ignore
R_SHORT_PCREL_MODE which we get for some reason (that might be a gas
funny)).

diff -ur linker-cvs/fixups.c linker/fixups.c
--- linker-cvs/fixups.c	Mon Dec  6 20:21:23 1999
+++ linker/fixups.c	Mon Dec  6 20:27:03 1999
@@ -360,6 +360,10 @@
     /*  PA2.0 instructions */
     {   R_SHORT_PCREL_MODE,  1,   1,      NONE,   NONE,  NONE   },
     {   R_LONG_PCREL_MODE,   1,   1,      NONE,   NONE,  NONE   },
+#else
+	/* we seem to get R_SHORT_PCREL_MODE -- which I guess is the "do the
+	 * PA1.1 thing" one which would mean we can just ignore it.  prumpf */
+    {   R_SHORT_PCREL_MODE,  1,   1,      NONE,   NONE,  NONE   },
 #endif /* ifdef PA_2_0 */
     {   R_ABS_CALL        , 10,   2,      AR_D,   U_8,   NONE   },
     {   0                 ,  2,   3,      AR_9,   U_8,   NONE   },
@@ -1339,6 +1343,11 @@
 		GET_NO_ARGS;
 		is_pcrel_short = FALSE;
 		break;
+#else
+	    case R_SHORT_PCREL_MODE:
+		GET_NO_ARGS;
+		/* we just ignore R_SHORT_PCREL_MODE on PA1.1.  prumpf */
+		break;
 #endif /* ifdef PA_2_0 */
 
             /* zero length, clear overrides */
@@ -4342,9 +4351,9 @@
 
     switch (fix_info->type) {
 #ifdef PA_2_0
-	case R_SHORT_PCREL_MODE:
 	case  R_LONG_PCREL_MODE:
 #endif /* ifdef PA_2_0 */
+	case R_SHORT_PCREL_MODE:
         case R_BEGIN_BRTAB:
         case R_END_BRTAB:
         case R_FSEL:
@@ -5388,7 +5397,7 @@
 	        value = symbol_value(arg0);
 		if (GET_OP(instruction) == 0x0a) {          /* if an ADDIL */
 		    /* set to addil L'sym, r0 */
-		    instruction = (instruction & REG_MASK);
+		    instruction = (instruction & REG_MASK) | R27_MASK;
 		}
 		/* else ldw/stw is set to use r1 already */
 #ifdef TSD /* TSD */


The important part is

-		    instruction = (instruction & REG_MASK);
+		    instruction = (instruction & REG_MASK) | R27_MASK;

.  I don't really know what my changes do, just the kernel links correctly
with them and doesn't without.

Anyway, kudos to the folks who convinced HP to GPL the linker in the first
place.  Otherwise, we'd be pretty stuck by now.

	Philipp Rumpf
