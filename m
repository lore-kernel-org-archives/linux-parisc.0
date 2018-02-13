From: Meelis Roos <mroos@linux.ee>
Subject: Re: parisc 4.16-rc1 error: ERROR: "$$remU" [drivers/net/tun.ko]
 undefined!
Date: Tue, 13 Feb 2018 21:55:00 +0200 (EET)
Message-ID: <alpine.LRH.2.21.1802132145050.24929@math.ut.ee>
References: <alpine.LRH.2.21.1802131552240.9153@math.ut.ee> <5abecbed-e50f-e41c-1fd1-a7bcc4768f2a@bell.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Cc: linux-parisc@vger.kernel.org
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <5abecbed-e50f-e41c-1fd1-a7bcc4768f2a@bell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> On 2018-02-13 8:55 AM, Meelis Roos wrote:
> >    MODPOST 9 modules
> > ERROR: "$$remU" [drivers/net/tun.ko] undefined!
> > make[1]: *** [scripts/Makefile.modpost:92: __modpost] Error 1
> I believe $$remU comes from the millicode library milli.a.  It is bundled with
> compiler.
> Try adding V=1 to the make command so you can see the gcc command for the
> above.

The command is modpost:

  find .tmp_versions -name '*.mod' | xargs -r grep -h '\.ko$' | sort -u | sed 's/\.ko$/.o/' | scripts/mod/modpost   -o ./Module.symvers    -S    -s -T -
ERROR: "$$remU" [drivers/net/tun.ko] undefined!

hppa64-linux-objdump --disassemble drivers/net/tun.ko
and
hppa64-linux-nm drivers/net/tun.ko
do not show any sign of the $$remU.

mroos@a500 ~/linux $ fgrep -r '$$remU' arch/parisc/ 
arch/parisc/kernel/parisc_ksyms.c:extern void $$remU(void);
arch/parisc/kernel/parisc_ksyms.c:EXPORT_SYMBOL($$remU);

It's in /usr/lib/gcc/hppa64-unknown-linux-gnu/5.4.0/libgcc.a

CONFIG_CROSS_COMPILE="hppa64-linux-" - maybe modpost gets this wrong 
somehow?

mroos@a500 ~/linux $ file scripts/mod/modpost
scripts/mod/modpost: ELF 32-bit MSB executable, PA-RISC, *unknown arch 0xf* version 1 (GNU/Linux), dynamically linked, interpreter /lib/ld.so.1, for GNU/Linux 3.2.0, not stripped

This is strange, *unknown arch 0xf* ?? This hould be native binary... 
yes, all my binaries under /bin have this arch, so my toolchain is 
broken is some funny way...

-- 
Meelis Roos (mroos@linux.ee)
