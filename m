From: Helge Deller <deller@gmx.de>
Subject: Re: [parisc-linux] 2.6.23-rc5 warnings
Date: Tue, 4 Sep 2007 22:21:18 +0200
Message-ID: <200709042221.18878.deller__21263.5603420951$1416624431$gmane$org@gmx.de>
References: <200709032245.l83Mj2cU010914@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200709032245.l83Mj2cU010914@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tuesday 04 September 2007, John David Anglin wrote:
> Some section mismatches in 64-bit kernel build:
> 
> WARNING: vmlinux.o(.text+0xb0): Section mismatch: reference to .init.text:start_
> kernel (between '$pgt_fill_loop' and 'common_stext')
> WARNING: vmlinux.o(.text+0xb4): Section mismatch: reference to .init.text:start_
> kernel (between '$pgt_fill_loop' and 'common_stext')
> WARNING: vmlinux.o(.text+0x290): Section mismatch: reference to .init.text:smp_c
> allin (between 'smp_slave_stext' and 'flush_tlb_all_local')
> WARNING: vmlinux.o(.text+0x294): Section mismatch: reference to .init.text:smp_c
> allin (between 'smp_slave_stext' and 'flush_tlb_all_local')
> WARNING: vmlinux.o(.text.write_profile+0x19c): Section mismatch: reference to .i
> nit.text:setup_profiling_timer (after 'write_profile')
> 
> I think there was a warning about a missing syscall fallocate.

The first two warnings are valid for 32bit as well. Reason is:
[head.S:122]		load32          start_kernel,%r11

fallocate() syscall is missing in 32bit too.

Helge

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
