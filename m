From: "Joel Soete" <soete.joel@tiscali.be>
Subject: [parisc-linux] cacheflush.h: a smp simplification
Date: Mon, 29 Nov 2004 10:48:31 +0100
Message-ID: <418A80030000906C@mail-1-bnl.tiscali.it>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-15"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hello all,

I would also suggested this code simplification:
--- linux-2.6.10-rc2-bk12-pa18M/include/asm-parisc/cacheflush.h.orig1	200=
4-11-29
09:44:46.940675194 +0100
+++ linux-2.6.10-rc2-bk12-pa18M/include/asm-parisc/cacheflush.h	2004-11-2=
9
09:44:05.702579346 +0100
@@ -9,12 +9,6 @@

 /* Cache flush operations */

-#ifdef CONFIG_SMP
-#define flush_cache_mm(mm)		flush_cache_all()
-#else
-#define flush_cache_mm(mm)		flush_cache_all_local()
-#endif
-
 #define flush_kernel_dcache_range(start,size) \
 	flush_kernel_dcache_range_asm((start), (start)+(size));

@@ -32,6 +26,8 @@
 	on_each_cpu(cacheflush_h_tmp_function, NULL, 1, 1);
 }

+#define flush_cache_mm(mm)		flush_cache_all()
+
 #define flush_cache_vmap(start, end)	flush_cache_all()
 #define flush_cache_vunmap(start, end)	flush_cache_all()
=3D=3D=3D=3D=3D=3D=3D=3D><=3D=3D=3D=3D=3D=3D=3D=3D=3D

acoording to on_each_cpu() def of linux/smp.h it seems to me ok (but I co=
uld
always missed something?)

Joel

PS: another question realted to cacheflush:
in our cache.c we have:
[...]
#ifdef CONFIG_SMP
void
flush_data_cache(void)
{
	on_each_cpu((void (*)(void *))flush_data_cache_local, NULL, 1, 1);
}
void
flush_instruction_cache(void)
{
	on_each_cpu((void (*)(void *))flush_instruction_cache_local, NULL, 1, 1)=
;
}
#endif

void
flush_cache_all_local(void)
{
	flush_instruction_cache_local();
	flush_data_cache_local();
}
EXPORT_SYMBOL(flush_cache_all_local);

[...]
In the same maner as above suggested couldn't we get rid of #ifdef CONFIG=
_SMP
and #endif
and btw define here
void
flush_cache_all(void)
{
	flush_instruction_cache();
	flush_data_cache();
}
EXPORT_SYMBOL(flush_cache_all);

Or why didn't we define 
flush_cache_all(void)
{
        on_each_cpu((void (*)(void *))flush_cache_all_local, NULL, 1, 1);=

}
as the other functions?

Thanks for additional info ;-)


-------------------------------------------------------------------------=
--
Tiscali ADSL GO & Light, 2 mois gratuits, profitez-en...
http://reg.tiscali.be/adsl/welcome.asp?lg=3DFR




_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
