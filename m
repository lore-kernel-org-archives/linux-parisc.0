Return-Path: <hppa-linux@thepuffingroup.com>
Message-Id: <199902270047.QAA27829@meow.sr.hp.com>
Subject: Re: [hppa-linux] Another bootstrap test
In-Reply-To: <199902262352.RAA13983@equator.com> from Jason Eckhardt at "Feb 26, 1999  5:52: 6 pm"
To: hppa-linux@thepuffingroup.com
Date: Fri, 26 Feb 1999 16:47:23 -0800 (PST)
From: Bill Katz <billk@sr.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Resent-Message-ID: <"yc6ye.0.-E7.63qrs"@sod.res.cmu.edu>
Reply-To: hppa-linux@thepuffingroup.com
List-Id: linux-parisc.vger.kernel.org

> I would appreciate it if a few people would try out this updated bootstrap
> code on their systems (same directions as last time). This is basically
> complete, it loads and executes a "dummy" kernel. It has only been tested on
> a C160 so far.
> This is a debug version and prints a lot of noise. It would be useful if
> you would capture the output and email it to me. Or at least send the numbers 
> for:
>  P0_IMM_max_mem, P0_BOOTCPU_10msec, P0_COUT_class, P0_CIN_class, and
>  P0_BOOTDEV_class.
> 
> If it works completely, you'll see a message from the dummy kernel image
> folloed by "It is now safe to reboot." Let me know if it makes it that far
> on your system.
> 
> Thanks, Jason Eckhardt.
> 

Jason,
	I tried this on a board I use here at work, it is very similar
to a B32/B160.  It gets through a bunch of stuff, and then dies:

PARISC/Linux Bootstrap Version 0.1 (non-interactive)
By Jason Eckhardt
Built Fri Feb 26 17:19:38 CST 1999 by jason@bimbo

IPL_DEBUG: Page zero parameters:
  P0_IMM_max_mem:          167772160 (160MB)
  P0_IMM_spa_size:         167772160
  P0_MC_cont_size:         167772160
  P0_MC_phys_size:         167772160
  P0_MC_ad_size:           167772160
  P0_BOOTCPU_mem_free:     0x00008000
  P0_BOOTCPU_hpa:          xFFFBE000
  P0TCPU_pdc:       0x00004800
  P0_BOOTCPU_10msec:       1200000
  P0_COUT_iodc_io:         0x00008000
  P0_CIN_iodc_io:          0x00008000
  P0_BOOTDEV_iodc_io:      0x00012000
  P0_COUT_class:           0x00000007
  P0_CIN_class:            0x00000007
  P0_BOOTDEV_class:        0x00001002
Reading parameters...done.
(kerneÿÐpLoading kernel..done.
Transferring contrFLT  1009

The FLT1009 is a chassis code that means "Unexpected interrupt".  You did
get the speed correct at 120 MHz.  I booted over LAN via tftp.

	-Bill


-------------------------------------------------------------------------
To unsubscribe: send e-mail to hppa-linux-request@thepuffingroup.com with
`unsubscribe' as the subject.
