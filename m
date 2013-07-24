From: Chen Gang <gang.chen@asianux.com>
Subject: [Suggestion] parisc: kernel: about section mismatch warning.
Date: Wed, 24 Jul 2013 16:27:25 +0800
Message-ID: <51EF8FED.9090903@asianux.com>
References: <51EF8C52.50403@asianux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Cc: Parisc List <linux-parisc@vger.kernel.org>
To: "James E.J. Bottomley" <jejb@parisc-linux.org>,
	Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <51EF8C52.50403@asianux.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hello Maintainers:

When building parisc with allmodconfig by 'hppa64-linux-gnu-', I find section mismatch warnings.

I am not quite sure whether they will cause real issue or not, please
help check, thanks.

  LD      arch/parisc/kernel/built-in.o
WARNING: arch/parisc/kernel/built-in.o(.data+0x118): Section mismatch in reference from the variable .L24 to the function .init.text:do_device_inventory()
The variable .L24 references
the function __init do_device_inventory()
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

WARNING: arch/parisc/kernel/built-in.o(.data+0x120): Section mismatch in reference from the variable .L26 to the function .init.text:parisc_pdc_chassis_init()
The variable .L26 references
the function __init parisc_pdc_chassis_init()
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console


At least, I am sure it is not the source code issue, is it the cross-
compiler's issue (need change suitable compiler), or just skip them ?

Welcome any suggestions or completions.


Thanks.
--
Chen Gang
