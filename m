Return-Path: <hppa-linux@thepuffingroup.com>
Message-ID: <36E5D015.D565BC93@home.com>
Date: Tue, 09 Mar 1999 19:51:17 -0600
From: dorin <dmandachi@home.com>
MIME-Version: 1.0
To: hppa-linux@thepuffingroup.com
Content-Type: text/plain; charset=us-ascii
Subject: [hppa-linux] 712/100
Resent-Message-ID: <"v4I8K1.0.2S5.o1Tvs"@sod.res.cmu.edu>
Reply-To: hppa-linux@thepuffingroup.com
List-Id: linux-parisc.vger.kernel.org

hi all, 
it worked: 712/100 (128ram) with the hipo-0.01

here's what the screen looks like:

PARISC/Linux Bootstrap Version 0.1 (non-interactive)
By Jason Eckhardt
Built Fri Feb 26 17:19:38 CST 1999 by jason@bimbo

IPL_DEBUG: Page zero parameters
  P0_IMM_max_mem:	134217728 (128MB)
  P0_IMM_spa_size:	134217728
  P0_MC_cont_size:	134217728
  P0_MC_phys_size:	134217728
  P0_MC_ad_size:	134217728
  P0_BOOTCPU_mem_free:  0x00008000
  P0_BOOTCPU_hpa:	0xFFFBE000
  P0_BOOTCPU_pdc:	0xF0010488
  P0_BOOTCPU_10msec:	100000
  P0_COUT_iodc_io:	0x00008AAC
  P0_CIN_iodc_io:	0x00008000
  P0_BOOTDEV_iodc_io:	0x0000C114
  P0_COUT_class:	0x00000009
  P0_CIN_class:		0x00000008
  P0_BOOTDEV_class:	0x00000001
Reading parameters...done
(kernel size = 28672 bytes, entry point = 0x00001000)
Loadin kernel...done
Transferring control to kernel

******* (yiipee)

VMLINUX 0.0: Dummy kernel image loaded and executing!

It is now safe to reboot

-------------------------------------------------------------------------
To unsubscribe: send e-mail to hppa-linux-request@thepuffingroup.com with
`unsubscribe' as the subject.
