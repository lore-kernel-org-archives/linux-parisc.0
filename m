From: "Joel Soete" <soete.joel@tiscali.be>
Subject: More questions [Was: [parisc-linux] 2.6.10-rc1-pa11 profile data]
Date: Wed, 1 Dec 2004 18:44:44 +0100
Message-ID: <418A80AE0000A9A8@mail-4-bnl.tiscali.it>
References: <20041111081154.GR15714@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-15"
Cc: parisc-linux@lists.parisc-linux.org
To: "Randolph Chung" <randolph@tausq.org>,
 "Grant Grundler" <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20041111081154.GR15714@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

[...]
> 
> but looking at the other ones:
> - __clear_user_page_asm can be optimized for 64-bit by writing 8 bytes
>   at a time instead of 4
Is it the idea (principle only):
--- arch/parisc/kernel/pacache.S.Orig	2004-12-01 17:09:53.000000000 +0100=

+++ arch/parisc/kernel/pacache.S-t1	2004-12-01 17:58:16.000000000 +0100
@@ -505,6 +505,16 @@
 	ldi 64,%r1
 
 1:
+#ifdef __LP64__
+	std	%r0,0(%r28)
+	std	%r0,8(%r28)
+	std	%r0,16(%r28)
+	std	%r0,24(%r28)
+	std	%r0,32(%r28)
+	std	%r0,40(%r28)
+	std	%r0,48(%r28)
+	std	%r0,56(%r28)
+#else
 	stw %r0,0(%r28)
 	stw %r0,4(%r28)
 	stw %r0,8(%r28)
@@ -521,6 +531,7 @@
 	stw %r0,52(%r28)
 	stw %r0,56(%r28)
 	stw %r0,60(%r28)
+#endif
 	ADDIB>  -1,%r1,1b
 	ldo 64(%r28),%r28

I doubt that's enough because I don't yet find how r0 is set?

[...]
Thanks in advance for your attention,
    Joel

-------------------------------------------------------------------------=
--
Tiscali vous offre 3 mois d'ADSL et 3 mois de DVD gratuits...profitez-en.=
..
http://reg.tiscali.be/adsl/default.asp?lg=3DFR




_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
