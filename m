Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout2.tiscali.be (cpout2.tiscali.be [62.235.13.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id EC5EF4884
	for <parisc-linux@parisc-linux.org>; Fri,  1 Aug 2003 09:28:01 -0600 (MDT)
Received: from [62.235.14.106] (helo=mail.tiscali.be)
	by cpout2.tiscali.be with esmtp (Tiscali)
	id 19ibmw-0007Qb-00
	for <parisc-linux@parisc-linux.org>; Fri, 01 Aug 2003 17:25:50 +0200
Date: Fri, 1 Aug 2003 17:28:00 +0200
Message-ID: <3F29178A000004C6@ocpmta7.freegates.net>
From: "Joel Soete" <jsoe0708@tiscali.be>
To: parisc-linux@parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Subject: [parisc-linux] backport bitops.h stuff
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Hi pa,

Can somebody help me to ci inot 2.4 this patch which backport ffs() needed
for new devmapper ;)

--- bitops.h.orig	2003-08-01 15:25:02.000000000 +0200
+++ bitops.h	2003-08-01 15:27:38.000000000 +0200
@@ -208,13 +208,34 @@
 
 #ifdef __KERNEL__
 
+/**
+ * __ffs - find first bit in word.
+ * @word: The word to search
+ *
+ * Undefined if no bit exists, so code should check against 0 first.
+ */
+static __inline__ unsigned long __ffs(unsigned long word)
+{
+	unsigned long result = 0;
+
+	while (!(word & 1UL)) {
+		result++;
+		word >>= 1;
+	}
+	return result;
+}
+
 /*
  * ffs: find first bit set. This is defined the same way as
  * the libc and compiler builtin ffs routines, therefore
  * differs in spirit from the above ffz (man ffs).
  */
-
-#define ffs(x) generic_ffs(x)
+static __inline__ int ffs(int x)
+{
+	if (!x)
+		return 0;
+	return __ffs((unsigned long)x);
+}
 
 /*
  * hweightN: returns the hamming weight (i.e. the number

Thanks in advance,
    Joel


------------------------------------------------------
Soldes Tiscali ADSL : 27,50 euros/mois jusque fin 2003.
On s'habitue vite à payer son ADSL moins cher!
Plus d'info? Cliquez ici... http://reg.tiscali.be/default.asp?lg=fr 
