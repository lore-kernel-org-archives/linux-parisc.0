Return-Path: <pjlahaie@sims-ha.videotron.net>
Date: Sat, 27 Feb 1999 17:34:28 -0500
From: "Paul J.Y. Lahaie" <pjlahaie@ottawa.com>
Subject: Re: [hppa-linux] Another bootstrap test
Sender: pjlahaie@sims-ha.videotron.net
To: hppa-linux@thepuffingroup.com
Message-id: <36D872F4.58DFA911@ottawa.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
References: <199902262352.RAA13983@equator.com>
Resent-Message-ID: <"mQBZ72.0.BB3.z87ss"@sod.res.cmu.edu>
Reply-To: hppa-linux@thepuffingroup.com
List-Id: linux-parisc.vger.kernel.org

Jason Eckhardt wrote:
> 
> I would appreciate it if a few people would try out this updated bootstrap
> code on their systems (same directions as last time). This is basically
> complete, it loads and executes a "dummy" kernel. It has only been tested on
> a C160 so far.
> This is a debug version and prints a lot of noise. It would be useful if
> you would capture the output and email it to me. Or at least send the numbers
> for:
>  P0_IMM_max_mem, P0_BOOTCPU_10msec, P0_COUT_class, P0_CIN_class, and
>  P0_BOOTDEV_class.
IPL_DEBUG: Page zero parameters
  P0_IMM_max_mem:		33554432 (32MB)
  P0_IMM_spa_size:		33554432
  P0_MC_cont_size:		33554432
  P0_MC_phys_size:		33554432
  P0_MC_ad_size:		33554432
  P0_BOOTCPU_mem_free:		0x00008000
  P0_BOOTCPU_hpa:		0xFFFBE000
  P0_BOOTCPU_pdc:		0xF0010480
  P0_BOOTCPU_10mesc:		600000
  P0_COUT_iodc_io:		0x0000892C
  P0_CIN_iodc_io:		0x00008000
  P0_BOOTDEV_iodc_io:		0x0000BF94
  P0_COUT_class:		0x00000009
  P0_CIN_class:			0x00000008
  P0_BOOTDEV_class:		0x00001002
Reading parameters...done.
(kLoading kernel...done


    That's where it stops.

    This is on a 712/60 booting over bootp.

								- Paul

-------------------------------------------------------------------------
To unsubscribe: send e-mail to hppa-linux-request@thepuffingroup.com with
`unsubscribe' as the subject.
