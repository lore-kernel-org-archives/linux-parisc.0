Return-Path: <soete.joel@tiscali.be>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 886E948B2
	for <parisc-linux@lists.parisc-linux.org>;
	Fri, 19 Mar 2004 09:27:58 -0700 (MST)
Date: Fri, 19 Mar 2004 17:27:52 +0100
Message-ID: <40561EAF00003770@ocpmta1.freegates.net>
In-Reply-To: <40561EAF000035FA@ocpmta1.freegates.net>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: RE: [parisc-linux] Spinlock patch, take 2
To: "Randolph Chung" <randolph@tausq.org>, parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Cc: 
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

>Ongoing to try to apply it against 2.6.[45] and encounter very early a pb
>which seems to be solved by following patch:
--- include/asm-parisc/smp.h.orig	2004-01-28 08:24:41.000000000 +0100
+++ include/asm-pari
> c/smp.h	2004-03-19 11:34:04.078456992 +0100
@@ -54,7 +54,7 @@
 #define smp_processor_id()	(current_thread_info()->cpu)
 #define cpu_online(cpu) cpu_isset(cpu, cpu_online_map)
 
-#define cpu_possible_map	cpu_present_map
+#define cpu_possible_map	cpu_present_mask
 
 #endif /* CONFIG_SMP */
=========><=========
>
>Is it correct?
>
it seems ok as it even boot on a up b2k with this smp 32bit kernel :)

>But using c3k config and adding smp support to 2.6.5-rc1, I encounter this
>ld pb:
>[snip]
well apologies, though a 'make clean' before build the new kernel is just
requested.

hth,
    Joel


----------------------------------------------------------------------------------------
Tiscali ADSL: 35 €/mois, la meilleure offre du marché!
http://reg.tiscali.be/default.asp?lg=fr
