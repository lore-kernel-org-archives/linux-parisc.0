From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: [parisc-linux] 2.6.23-rc5 warnings
Date: Mon, 3 Sep 2007 18:45:02 -0400 (EDT)
Message-ID: <200709032245.l83Mj2cU010914__10895.4125702896$1416624430$gmane$org@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
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

Some section mismatches in 64-bit kernel build:

WARNING: vmlinux.o(.text+0xb0): Section mismatch: reference to .init.text:start_
kernel (between '$pgt_fill_loop' and 'common_stext')
WARNING: vmlinux.o(.text+0xb4): Section mismatch: reference to .init.text:start_
kernel (between '$pgt_fill_loop' and 'common_stext')
WARNING: vmlinux.o(.text+0x290): Section mismatch: reference to .init.text:smp_c
allin (between 'smp_slave_stext' and 'flush_tlb_all_local')
WARNING: vmlinux.o(.text+0x294): Section mismatch: reference to .init.text:smp_c
allin (between 'smp_slave_stext' and 'flush_tlb_all_local')
WARNING: vmlinux.o(.text.write_profile+0x19c): Section mismatch: reference to .i
nit.text:setup_profiling_timer (after 'write_profile')

I think there was a warning about a missing syscall fallocate.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
