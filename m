Return-Path: <hppa-linux@thepuffingroup.com>
Date: Fri, 26 Feb 1999 18:14:17 -0800 (PST)
From: Kevin Vajk <kvajk@ricochet.net>
To: hppa-linux@thepuffingroup.com
Subject: Re: [hppa-linux] Another bootstrap test
In-Reply-To: <199902262352.RAA13983@equator.com>
Message-ID: <Pine.LNX.4.04.9902261811450.4650-100000@barbelo.localdomain>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Resent-Message-ID: <"PWntM.0.dX7.VJrrs"@sod.res.cmu.edu>
Reply-To: hppa-linux@thepuffingroup.com
List-Id: linux-parisc.vger.kernel.org



Success on an 816/E35:



Main Menu: Enter command or menu > boot 56/40.6
Interact with IPL (Y or N)?> y

Booting... 
Boot IO Dependent Code (IODC) revision 4


HARD Booted.

------------------------------------------------------------------------------

PARISC/Linux Bootstrap Version 0.1 (interactive)
By Jason Eckhardt
Built Fri Feb 26 17:19:38 CST 1999 by jason@bimbo

IPL_DEBUG: Page zero parameters:
  P0_IMM_max_mem:          134217728 (128MB)
  P0_IMM_spa_size:         134217728
  P0_MC_cont_size:         134217728
  P0_MC_phys_size:         134217728
  P0_MC_ad_size:           134217728
  P0_BOOTCPU_mem_free:     0x00008000
  P0_BOOTCPU_hpa:          0xFFFBE000
  P0_BOOTCPU_pdc:          0xF001F648
  P0_BOOTCPU_10msec:       640000
  P0_COUT_iodc_io:         0x00008000
  P0_CIN_iodc_io:          0x00008000
  P0_BOOTDEV_iodc_io:      0x00008410
  P0_COUT_class:           0x00000007
  P0_CIN_class:            0x00000007
  P0_BOOTDEV_class:        0x00000001
Reading parameters...done.
(kernel size = 28672 bytes, entry point = 0x00001000)
Loading kernel...done.
Transferring control to kernel.

*********************************************************

VMLINUX 0.0: Dummy kernel image loaded and executing!


It is now safe to reboot.


-------------------------------------------------------------------------
To unsubscribe: send e-mail to hppa-linux-request@thepuffingroup.com with
`unsubscribe' as the subject.
