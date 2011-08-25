From: John David Anglin <dave.anglin@bell.net>
Subject: Re: Link error in CMake for HPPA1.1, wrong result for HPPA 2.0
Date: Thu, 25 Aug 2011 11:46:53 -0400
Message-ID: <4E566E6D.8060100@bell.net>
References: <99a9e4b224dc9020d16d0a33fea6096f.squirrel@webmail.sf-mail.de> <4E5656E4.8000102@systemhalted.org>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------050306030302020505060503"
Cc: Rolf Eike Beer <eike@sf-mail.de>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4E5656E4.8000102@systemhalted.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

This is a multi-part message in MIME format.
--------------050306030302020505060503
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 8/25/2011 10:06 AM, Carlos O'Donell wrote:
> On 8/25/2011 6:37 AM, Rolf Eike Beer wrote:
>> const&)]+0xbc): cannot reach
>> 00004abb__ZNSt8_Rb_treeIN5cmsys6StringESt4pairIKS1_iESt10_Select1stIS4_ESt4lessIS1_ESaIS4_EE8_S_rightEPSt18_Rb_tree_node_base+0,
>> recompile with -ffunction-sections
> So did you recompile with -ffunction-sections?
>
> The basic problem is that the linker was unable to insert a jump
> to the requested function because it was too far away. Some targets
> like hppa have short branch distances and we use intermediate stub
> tables to get around that. However, we can't insert stub tables just
> anywhere, they need to go between sections. Therefore you need to
> break up this object file.
I think there is a real bug here but nobody has provided a test case.  
-ffunction-sections
probably won't help.

Stub sizes vary depending on whether PIC code or non PIC code is being 
generated.
We need a bigger stub table for PIC C++ code as C++ tends to generate a 
lot of small
routines.

I've attached the GCC part of the change.  There's also a binutils patch 
which I can't
access at the moment.

Dave

-- 
John David Anglin    dave.anglin@bell.net


--------------050306030302020505060503
Content-Type: text/plain;
 name="pcrel.d"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="pcrel.d"

Index: config/pa/pa.c
===================================================================
--- config/pa/pa.c	(revision 178012)
+++ config/pa/pa.c	(working copy)
@@ -7385,7 +7385,7 @@
     return 24;
   else
     {
-      if (!TARGET_LONG_CALLS && distance < 240000)
+      if (!TARGET_LONG_CALLS && distance < MAX_PCREL17F_OFFSET)
 	return 8;
 
       if (TARGET_LONG_ABS_CALL && !flag_pic)
@@ -7598,7 +7598,7 @@
   /* pc-relative branch.  */
   if (!TARGET_LONG_CALLS
       && ((TARGET_PA_20 && !sibcall && distance < 7600000)
-	  || distance < 240000))
+	  || distance < MAX_PCREL17F_OFFSET))
     length += 8;
 
   /* 64-bit plabel sequence.  */
@@ -7957,7 +7957,7 @@
   if (TARGET_FAST_INDIRECT_CALLS
       || (!TARGET_PORTABLE_RUNTIME
 	  && ((TARGET_PA_20 && !TARGET_SOM && distance < 7600000)
-	      || distance < 240000)))
+	      || distance < MAX_PCREL17F_OFFSET)))
     return 8;
 
   if (flag_pic)
Index: config/pa/pa.h
===================================================================
--- config/pa/pa.h	(revision 178012)
+++ config/pa/pa.h	(working copy)
@@ -1512,3 +1512,12 @@
 #undef TARGET_HAVE_TLS
 #define TARGET_HAVE_TLS true
 #endif
+
+/* The maximum offset in bytes for a PA 1.X pc-relative call to the
+   tail of the preceding stub table.  The selected offsets have been
+   chosen to allow approximately one call stub for every 86 instructions.
+   A long branch stub is two instructions when not generating PIC code.
+   More space is allowed for stubs when generating PIC code since HP-UX
+   and Linux import stubs are seven and four instructions, respectively.  */  
+#define MAX_PCREL17F_OFFSET \
+  (flag_pic ? (TARGET_HPUX ? 198164 : 221312) : 240000)

--------------050306030302020505060503--
