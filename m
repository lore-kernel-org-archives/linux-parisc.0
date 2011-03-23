From: James Bottomley <James.Bottomley@suse.de>
Subject: [PATCH] fix compile breakage caused by linux/smp.h header
 definition problem
Date: Wed, 23 Mar 2011 10:11:58 -0500
Message-ID: <1300893119.15899.15.camel@mulgrave.site>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Amerigo Wang <amwang@redhat.com>,
	Parisc List <linux-parisc@vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

The problem is this:

  CC      arch/parisc/kernel/asm-offsets.s
In file included from include/linux/sched.h:71,
                 from arch/parisc/kernel/asm-offsets.c:31:
include/linux/smp.h:117: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'setup_nr_cpu_ids'
include/linux/smp.h:118: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'smp_init'
  HOSTLD  scripts/mod/modpost
make[1]: *** [arch/parisc/kernel/asm-offsets.s] Error 1

It's caused by two __init attributes on function prototypes, which
shouldn't be there (__init should only mark functions not prototypes).
This was introduced by

commit 34db18a054c600b6f81787165669dc572fe4de25
Author: Amerigo Wang <amwang@redhat.com>
Date:   Tue Mar 22 16:34:06 2011 -0700

    smp: move smp setup functions to kernel/smp.c

Removing the spurious __init attributes fixes this

Signed-off-by: James Bottomley <James.Bottomley@suse.de>

---

We didn't pick this up in our -next compiles, presumably because the
patch moved rather fast from -next to mainline?

diff --git a/include/linux/smp.h b/include/linux/smp.h
index 48159dd..04d6e0d 100644
--- a/include/linux/smp.h
+++ b/include/linux/smp.h
@@ -114,8 +114,8 @@ int on_each_cpu(smp_call_func_t func, void *info, int wait);
 void smp_prepare_boot_cpu(void);
 
 extern unsigned int setup_max_cpus;
-extern void __init setup_nr_cpu_ids(void);
-extern void __init smp_init(void);
+extern void setup_nr_cpu_ids(void);
+extern void smp_init(void);
 
 #else /* !SMP */
 


