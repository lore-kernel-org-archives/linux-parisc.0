Return-Path: <hppa-linux@thepuffingroup.com>
From: Steven Beattie <beattie@cse.ogi.edu>
Message-Id: <199903020034.QAA19394@church.cse.ogi.edu>
Subject: Re: [hppa-linux] Another bootstrap test
To: hppa-linux@thepuffingroup.com
Date: Mon, 1 Mar 1999 16:34:32 -0800 (PST)
In-Reply-To: <199902281700.JAA18341@milano.cup.hp.com> from "Grant Grundler" at Feb 28, 99 09:00:34 am
Content-Type: text
Resent-Message-ID: <"en5VL1.0.2O4.v8pss"@sod.res.cmu.edu>
Reply-To: hppa-linux@thepuffingroup.com
List-Id: linux-parisc.vger.kernel.org

Here's a late report on a 720/50 booted via rbootd:

IPL_DEBUG: Page zero parameters:
  P0_IMM_max_mem:       67108864 (64MB)
  P0_IMM_spa_size:      67108864
  P0_MC_cont_size:      67108864
  P0_MC_phys_size:      67108864
  P0_MC_ad_size:        67108864
  P0_BOOTCPU_mem_free:  0x00006400
  P0_BOOTCPU_hpa:       0xFFFBE000
  P0_BOOTCPU_pdc:       0xF0007768
  P0_BOOTCPU_10msec:    500000
  P0_COUT_iodc_io:      0x00006400
  P0_CIN_iodc_io:       0x00009A3C
  P0_BOOTDEV_iodc_io:   0x0000AB88
  P0_COUT_class:        0x00000009
  P0_CIN_class:         0x00000008
  P0_BOOTDEV_class:     0x00000001
Reading parameters...done.
(kernel size = 28672 Loading kernel...

And then it hangs.

Steve

-------------------------------------------------------------------------
To unsubscribe: send e-mail to hppa-linux-request@thepuffingroup.com with
`unsubscribe' as the subject.
