Return-Path: <hppa-linux@thepuffingroup.com>
Date: Thu, 11 Mar 1999 17:43:42 -0800 (PST)
From: Kevin Vajk <kvajk@cup.hp.com>
To: hppa-linux@thepuffingroup.com
Subject: Re: [hppa-linux] Bootstrap #4 successful
Message-Id: <Pine.LNX.4.04.9903111741010.2848-100000@uxho0334.cup.hp.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Resent-Message-ID: <"YiYYA2.0.wY2.U57ws"@sod.res.cmu.edu>
Reply-To: hppa-linux@thepuffingroup.com
List-Id: linux-parisc.vger.kernel.org



Another success booting from disk on an 816/E35.

- Kevin Vajk
  <kvajk@ricochet.net>



Main Menu: Enter command or menu > boot 56/40.6
Interact with IPL (Y or N)?> y

Booting... 
Boot IO Dependent Code (IODC) revision 4


HARD Booted.

------------------------------------------------------------------------------

PARISC/Linux Bootstrap Version 0.2 (interactive)
By Jason Eckhardt
Built Thu Mar 11 16:01:50 CST 1999 by jason@sathanas

IPL_DEBUG: Page zero parameters:
  P0_IMM_max_mem:          134217728 (128 MB)
  P0_BOOTCPU_10msec:       640000 (64 MHz)
  P0_BOOTCPU_mem_free:     0x00008000
  P0_BOOTCPU_hpa:          0xFFFBE000
  P0_BOOTCPU_pdc:          0xF001F648
  P0_COUT_iodc_io:         0x00008000
  P0_CIN_iodc_io:          0x00008000
  P0_BOOTDEV_iodc_io:      0x00008410
  P0_COUT_class:           0x00000007
  P0_CIN_class:            0x00000007
  P0_BOOTDEV_class:        0x00000001
Reading parameters...done.
Size = 28672 bytes, entry = 0x00001000, location = 0x0001B000.
Loading kernel...done.
Transferring control to kernel.

*********************************************************

VMLINUX 0.0: Dummy kernel image loaded and executing!


It is now safe to reboot.
/


-------------------------------------------------------------------------
To unsubscribe: send e-mail to hppa-linux-request@thepuffingroup.com with
`unsubscribe' as the subject.
