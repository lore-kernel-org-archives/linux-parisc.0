From: Kyle McMartin <kyle@parisc-linux.org>
Subject: [parisc-linux] parisc v2.6.22-rc5-pa1
Date: Thu, 21 Jun 2007 05:26:33 -0400
Message-ID: <20070621092633.GB10043__219.452280043875$1416624400$gmane$org@fattire.cabal.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
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

http://ftp.kernel.org/pub/linux/kernel/people/kyle/parisc/2.6.22-rc5/v2.6.22-rc5-pa1.diff.bz2

added:
+parisc/led-lcd-no-space-removal.patch
+parisc/mmap-handle-expand_upwards-wrap.patch

merged:
-parisc/make-command_line-static.patch
-parisc/sync-compat-getdents.patch
-parisc/move-undef-to-end-of-syscall-table.patch
-parisc/wire-up-kexec_load-syscall.patch
-parisc/convert-proc-gsc-pcxl_dma-to-seq_file.patch
-parisc/let-pa8900-processors-boot.patch
-parisc/disable-lws-debugging.patch
-parisc/spelling-fixes-arch-parisc.patch
-parisc/ROUND_UP-macro-cleanup-in-arch-parisc.patch
-parisc/ROUNDUP-macro-cleanup-in-drivers-parisc.patch
-parisc/kobject-is-embedded-in-subsys-not-kset.patch
-parisc/build-fixes-for-power.c.patch
-parisc/fix-lasi_82596-build.patch
-parisc/fix-section-mismatch-in-parport_gsc.patch
-parisc/fix-section-mismatch-in-parisc-STI-video-dr.patch
-parisc/fix-section-mismatch-in-ccio-dma.patch
-parisc/fix-section-mismatches-in-arch-parisc-kerne.patch
-parisc/fix-section-mismatch-in-parisc-eisa-driver.patch
-parisc/fix-section-mismatch-in-superio-serial-driv.patch
-parisc/wire-up-utimensat-signalfd-timerfd-eventfd.patch
-parisc/fix-ENTRY-macro-redefinition.patch
-parisc/fix-section-mismatch-in-smp.c.patch
-parisc/remove-remnants-of-parisc-specific-softirq.patch
-parisc/fix-trivial-spelling-nit-in-asm-linkage.h.patch
-parisc/fix-null-ptr-deref-in-unwind.c.patch
-parisc/fix-reduce-size-of-task_struct-on-64-bit-m.patch
-parisc/be-more-defensive-in-process.c-get_wchan.patch
-parisc/fix-bug-when-syscall-nr-is-__NR_Linux_sysca.patch
-parisc/fix-kernel-panic-in-check_ivt.patch
-parisc/remove-global_ack_eiem.patch
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
