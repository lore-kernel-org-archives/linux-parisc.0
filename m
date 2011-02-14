From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Section mismatch seen building 2.6.38-rc4-next-20110211+
Date: Sun, 13 Feb 2011 22:49:16 -0500
Message-ID: <20110214034915.GA917@hiauly1.hia.nrc.ca>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

WARNING: vmlinux.o(.data+0x241b0): Section mismatch in reference from the variab
le lba_driver to the function .init.text:lba_driver_probe()
The variable lba_driver references
the function __init lba_driver_probe()
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console, 

WARNING: vmlinux.o(.data+0x24250): Section mismatch in reference from the variab
le superio_driver to the function .init.text:superio_probe()
The variable superio_driver references
the function __init superio_probe()
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console, 

Good news is the kernel (UP 32-bit) boots without problems on c3750.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
