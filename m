From: John David Anglin <dave.anglin@bell.net>
Subject: [PATCH] parisc: Only use -mfast-indirect-calls option for 32-bit kernel builds
Date: Mon, 22 Sep 2014 20:54:50 -0400
Message-ID: <BLU437-SMTP4664A3177B10B59560E2697B00@phx.gbl>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: multipart/mixed; boundary="Apple-Mail-34--665205749"
Cc: Helge Deller <deller@gmx.de>,
	James Bottomley <James.Bottomley@HansenPartnership.com>
To: linux-parisc List <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--Apple-Mail-34--665205749
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit

In spite of what the GCC manual says, the -mfast-indirect-calls has  
never been supported in the 64-bit
parisc compiler.  Indirect calls have always been done using function  
descriptors irrespective of the
-mfast-indirect-calls option.

Recently, it was noticed that a function descriptor was always  
requested when the -mfast-indirect-calls option
was specified.  This caused problems when the option was used in  
application code and doesn't make any
sense because the whole point of the option is to avoid using a  
function descriptor for indirect calls.

Fixing this broke 64-bit kernel builds.

I will fix GCC but for now we need the attached change.  This results  
is the same kernel code as before.

Signed-of-by: John David Anglin <dave.anglin@bell.net>
---


--Apple-Mail-34--665205749
Content-Disposition: attachment; filename="fast-indirect.d.txt"
Content-Type: text/plain; x-unix-mode=0644; name="fast-indirect.d.txt"
Content-Transfer-Encoding: 7bit

diff --git a/arch/parisc/Makefile b/arch/parisc/Makefile
index 7187664..5db8882 100644
--- a/arch/parisc/Makefile
+++ b/arch/parisc/Makefile
@@ -48,7 +48,12 @@ cflags-y	:= -pipe
 
 # These flags should be implied by an hppa-linux configuration, but they
 # are not in gcc 3.2.
-cflags-y	+= -mno-space-regs -mfast-indirect-calls
+cflags-y	+= -mno-space-regs
+
+# -mfast-indirect-calls is only relevant for 32-bit kernels.
+ifndef CONFIG_64BIT
+cflags-y	+= -mfast-indirect-calls
+endif
 
 # Currently we save and restore fpregs on all kernel entry/interruption paths.
 # If that gets optimized, we might need to disable the use of fpregs in the
 

--Apple-Mail-34--665205749
Content-Type: text/plain; charset="US-ASCII"; format=flowed
Content-Transfer-Encoding: 7bit



--
John David Anglin	dave.anglin@bell.net


--Apple-Mail-34--665205749--
