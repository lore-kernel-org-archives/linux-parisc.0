Return-Path: <hppa-linux@thepuffingroup.com>
Message-Id: <199903011150.MAA23883@be3334.schering.de>
From: "Strelow, Ulrich" <Ulrich.Strelow@Schering.DE>
To: ",hppa-linux@thepuffingroup.com " <hppa-linux@thepuffingroup.com>,
        ",Jason Eckhardt " <jason@equator.com>
Subject: Betr.: [hppa-linux] Another bootstrap test
Date: Mon, 1 Mar 1999 12:49:00 +0100 
MIME-Version: 1.0
Content-Type: text/plain
Resent-Message-ID: <"4Pp3I1.0.ox1.8zdss"@sod.res.cmu.edu>
Reply-To: hppa-linux@thepuffingroup.com
List-Id: linux-parisc.vger.kernel.org

     Hi all,
     
     this time it did not work on my 715/33 booted via rbootd:
     
     
     PARISC/Linux Bootstrap Version 0.1 (interactive) By Jason Eckhardt
     Built Fri Feb 26 17:19:38 CST 1999 by jason@bimbo
     
     IPL_DEBUG: Page zero parameters:
     P0_IMM_max_mem:          50331648 (48MB)
     P0_IMM_spa_size:         50331648
     P0_MC_cont_size:         50331648
     P0_MC_phys_size:         50331648
     P0_MC_ad_size:           50331648
     P0_BOOTCPU_mem_free:     0x00006400
     P0_BOOTCPU_hpa:          0xFFFBE000
     P0_BOOTCPU_pdc:          0xF0008988
     P0_BOOTCPU_10msec:       333335
     P0_COUT_iodc_io:         0x00006400
     P0_CIN_iodc_io:          0x00009A3C
     P0_BOOTDEV_iodc_io:      0x00009F4C
     P0_COUT_class:           0x00000009
     P0_CIN_class:            0x00000008
     P0_BOOTDEV_class:        0x00000001
     Reading parameters...done.
     (kernel size = 28672 bytes Loading kernel...
     
     Then it hangs ...
     
     
     Ulrich
     ---------------------------------------------
     Ulrich Strelow
     <ulrich.strelow@schering.de or
      ulrich_strelow@csi.com>
      Berlin, Germany
     

-------------------------------------------------------------------------
To unsubscribe: send e-mail to hppa-linux-request@thepuffingroup.com with
`unsubscribe' as the subject.
