From: "Joel Soete" <soete.joel@tiscali.be>
Subject: [parisc-linux] 2.6.15-rc3 merged successfully with rc2-pa2 but
	failed to build :<(
Date: Tue, 29 Nov 2005 16:21:46 +0100
Message-ID: <IQQ2OA$24369881EF560DF3182403C54DA7DA20@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1
To: "parisc-linux" <parisc-linux@parisc-linux.org>
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

Hi *,

I just get a try to this merge (near straightforward :<)) but failled to =
build
in 2 places with the same error:
  gcc -Wp,-MD,mm/.memory.o.d  -nostdinc -isystem
/usr/lib/gcc/hppa-linux-gnu/4.0.3/include -D__KERNEL__ -Iinclude -Iinclud=
e2
-I/CAD/
linux-2.6.15-rc2-pa2-20051127/include -include include/linux/autoconf.h
-I/CAD/linux-2.6.15-rc2-pa2-20051127/mm -Imm -Wall -Wundef -
Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common
-ffreestanding -O2 -fomit-frame-pointer -pipe -mno-space-regs -mf
ast-indirect-calls -mdisable-fpregs -ffunction-sections -march=3D2.0
-mschedule=3D8000 -Wdeclaration-after-statement -Wno-pointer-sign
-DKBUILD_BASENAME=3Dmemory -DKBUILD_MODNAME=3Dmemory -c -o mm/memory.o
/CAD/linux-2.6.15-rc2-pa2-20051127/mm/memory.c
/CAD/linux-2.6.15-rc2-pa2-20051127/mm/memory.c: In function do_wp_page:
/CAD/linux-2.6.15-rc2-pa2-20051127/mm/memory.c:1349: error: pfn undeclare=
d
(first use in this function)
/CAD/linux-2.6.15-rc2-pa2-20051127/mm/memory.c:1349: error: (Each undecla=
red
identifier is reported only once
/CAD/linux-2.6.15-rc2-pa2-20051127/mm/memory.c:1349: error: for each func=
tion
it appears in.)
make[2]: *** [mm/memory.o] Error 1

and:
  gcc -Wp,-MD,mm/.rmap.o.d  -nostdinc -isystem
/usr/lib/gcc/hppa-linux-gnu/4.0.3/include -D__KERNEL__ -Iinclude -Iinclud=
e2
-I/CAD/li
nux-2.6.15-rc3-pa2mm-20051127/include -include include/linux/autoconf.h
-I/CAD/linux-2.6.15-rc3-pa2mm-20051127/mm -Imm -Wall -Wundef
 -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common
-ffreestanding -O2 -fomit-frame-pointer -pipe -mno-space-regs -
mfast-indirect-calls -mdisable-fpregs -ffunction-sections -march=3D2.0
-mschedule=3D8000 -Wdeclaration-after-statement -Wno-pointer-sign
  -DKBUILD_BASENAME=3Drmap -DKBUILD_MODNAME=3Drmap -c -o mm/rmap.o
/CAD/linux-2.6.15-rc3-pa2mm-20051127/mm/rmap.c
/CAD/linux-2.6.15-rc3-pa2mm-20051127/mm/rmap.c: In function try_to_unmap_=
cluster:
/CAD/linux-2.6.15-rc3-pa2mm-20051127/mm/rmap.c:644: error: pfn undeclared=

(first use in this function)
/CAD/linux-2.6.15-rc3-pa2mm-20051127/mm/rmap.c:644: error: (Each undeclar=
ed
identifier is reported only once
/CAD/linux-2.6.15-rc3-pa2mm-20051127/mm/rmap.c:644: error: for each funct=
ion
it appears in.)
make[2]: *** [mm/rmap.o] Error 1

This ack seems to make the drill:
--- mm/memory.c.Orig    2005-11-29 14:20:21.000000000 +0100
+++ mm/memory.c 2005-11-29 14:27:49.000000000 +0100
@@ -1346,7 +1346,7 @@
                int reuse =3D can_share_swap_page(old_page);
                unlock_page(old_page);
                if (reuse) {
-                       flush_cache_page(vma, address, pfn);
+                       flush_cache_page(vma, address, pte_pfn(orig_pte))=
;
                        entry =3D pte_mkyoung(orig_pte);
                        entry =3D maybe_mkwrite(pte_mkdirty(entry), vma);=

                        ptep_set_access_flags(vma, address, page_table, e=
ntry, 1);
@@ -1390,7 +1390,7 @@
                        }
                } else
                        inc_mm_counter(mm, anon_rss);
-               flush_cache_page(vma, address, pfn);
+               flush_cache_page(vma, address, pte_pfn(orig_pte));
                entry =3D mk_pte(new_page, vma->vm_page_prot);
                entry =3D maybe_mkwrite(pte_mkdirty(entry), vma);
                ptep_establish(vma, address, page_table, entry);
=3D=3D=3D=3D<>=3D=3D=3D=3D
--- mm/rmap.c.Orig      2005-11-29 14:32:43.000000000 +0100
+++ mm/rmap.c   2005-11-29 14:36:21.000000000 +0100
@@ -641,7 +641,7 @@
                        continue;
 
                /* Nuke the page table entry. */
-               flush_cache_page(vma, address, pfn);
+               flush_cache_page(vma, address, pte_pfn(*pte));
                pteval =3D ptep_clear_flush(vma, address, pte);
 
                /* If nonlinear, store the file page offset in the pte. *=
/
=3D=3D=3D=3D<>=3D=3D=3D=3D

I doubt it could be the fix as it seems that it was already build without=
 that
stuff (<http://lkml.org/lkml/2005/11/29/27>)?

Thanks for your attention,
    Joel=0A=0A-------------------------------------------------------=0AN=
OTE! My email address is changing to ... @scarlet.be=0APlease make the ne=
cessary changes in your address book. =0A=0A

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
