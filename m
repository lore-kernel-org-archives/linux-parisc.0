Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Sat, 5 Jul 2003 17:08:34 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: Joel Soete <jsoe0708@tiscali.be>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] warning: minor abi change
Message-ID: <20030705230834.GB9682@dsl2.external.hp.com>
References: <20030627151546.GA30607@dsl2.external.hp.com> <3ED70CF10000AE2E@ocpmta2.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3ED70CF10000AE2E@ocpmta2.freegates.net>
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

On Fri, Jun 27, 2003 at 06:14:58PM +0200, Joel Soete wrote:
> I need it to make work my ide cdrom onto my b2k (I grab this stuff
> from another platform)


Joel,
I've reworked the __save_and_cli and __save_and_sti mess so that's ok to
commit along with most of what you previously preposed.  I've tested on
64-bit (a500) but am having several problems with 32-bit (c3000) config.

Patch applies to our current CVS:
	ftp://ftp.parisc-linux.org/patches/diff-2.4.21-pa2

My .config and untested kernel/modules are at:
	ftp://ftp.parisc-kernel.org/kernels/c3000/2.4.21-pa2.tgz

Summary of issues that follow:
1) __canonicalize_funcptr_for_compare still a problem with 32-bit modules
2) Makefiles messed up for ide-proc.o	(seems to have a fix already)
3) various IDE modules not exporting symbols.
4) added EXPORT_SYMBOL(sys_wait4) as well.
5) Lack of a test machine at home. Can someone test c3000/2.4.21-pa2.tgz?

Patch also fixes asm problem with arch/parisc/kernel/real2.S.


Details:

1) Dave warned us last December about __canonicalize_funcptr_for_compare
   and gcc-3.3. "make modules_install" fails with this symbol missing in:

   	drivers/ide/ide-disk.o (fixed in patch but won't be committed)
	drivers/scsi/aic79xx/aic79xx.o
	fs/smbfs/smbfs.o
	lib/zlib_deflate/zlib_deflate.o

   Having no clue how to properly fix this in either the toolchain
   or where to find the man page for __canonicalize_funcptr_for_compare(),
   I disabled the last three in my .config and hacked ide-disk.c
   to use (void *) for comparisons.
   Any volunteer to write some sample code for this?
   
2) CONFIG_IDE=m leads to lots of unresolved symbols in IDE modules.
   Willy just pointed me at

   	http://www.ussg.iu.edu/hypermail/linux/kernel/0307.0/0995.html

   which should solve this problem.  The description below is just FYI.
   I'll rework the IDE patch to follow "upstream" fix in the next
   couple of days.

   Basic problem starts with drivers/Makefile:
   	subdir-$(CONFIG_IDE) += ide
   causing the "make vmlinux" to ignore drivers/ide subdir if CONFIG_IDE=m.
   This doesn't work when CONFIG_PROC_FS=y. ide-proc.o doesn't get built.
   drivers/ide/Makefile:
	ifeq($(CONFIG_BLK_DEV_IDE),y)
		obj-$(CONFIG_PROC_FS) += ide-proc.o
	endif

   I hacked  drivers/ide/Makefile to read:
	ifeq ($(CONFIG_PROC_FS),y)
	obj-$(CONFIG_BLK_DEV_IDE)               += ide-proc.o
	endif
   It presumes (1) PROC_FS is y or n and never 'm' and (2) IDE /proc
   support should be loaded as a module if CONFIG_BLK_DEV_IDE=m.


3) various IDE modules not exporting symbols.
	+EXPORT_SYMBOL_GPL(ide_release_dma);
	+EXPORT_SYMBOL(do_ide_request);
	+EXPORT_SYMBOL(ide_modules);
	+EXPORT_SYMBOL(generic_subdriver_entries);
	+EXPORT_SYMBOL(ide_find_setting_by_name);
	+EXPORT_SYMBOL(ide_read_setting);
	+EXPORT_SYMBOL(ide_add_generic_settings);
	+EXPORT_SYMBOL_GPL(ide_scan_pcibus);

4) added EXPORT_SYMBOL(sys_wait4) as well.

5) Lack of a test machine at home. I'm waiting for c3k's I've ordered.
   Nice folks sent me "workstation power cord kit" via priority mail but
   no sign of the workstation itself. :^/
   If someone can test this patch on a C3k, I'd be willing to commit
   the non-IDE parts of it. IDE needs rework to follow upstream's fix.

hth,
grant
