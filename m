Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA31141
	for <parisc-linux@puffin.external.hp.com>; Wed, 17 Jan 2001 16:31:23 -0700
To: Richard Hirst <rhirst@linuxcare.com>
Cc: parisc-linux@thepuffingroup.com
In-Reply-To: Message from Richard Hirst <rhirst@linuxcare.com>
   of "Wed, 17 Jan 2001 13:15:41 GMT." <20010117131541.L28638@linuxcare.com>
References: <20010117131541.L28638@linuxcare.com> 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 17 Jan 2001 16:37:00 -0700
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20010117233700.B324F38D85@carmen.fc.hp.com>
Subject: [parisc-linux] New XC available (was Re: glibc build failing)
List-ID: <linux-parisc.vger.kernel.org>


Richard Hirst writes...

> Guess this is for Alan and Matt really...
> 
> I am trying to build glibc using todays cvs main branch.  Building on
> x86 for parisc.  This is what I do:
[snip]
> And this is what happens...
[snip]
> ../sysdeps/generic/glob.c: In function `glob_in_dir':
> ../sysdeps/generic/glob.c:1446: Internal compiler error in eliminate_regs, at
>  reload1.c:2505
>    Please submit a full bug report.
>    See <URL:http://www.gnu.org/software/gcc/bugs.html> for instructions.
> make[2]: *** [/mnt/parisc/xc/build/glibc/posix/glob.o] Error 1
> make[2]: Leaving directory `/mnt/parisc/xc/source/glibc/posix'
> make[1]: *** [posix/subdir_lib] Error 2
> make[1]: Leaving directory `/mnt/parisc/xc/source/glibc'
> make: *** [install] Error 2

Yes I saw the same thing.

> The change that seems to have triggered this is in glibc/Makeconfig, 
> to build with -O2 rather that -O

Yeah it looks like this segment,

348 ifeq ($(release),stable)
349 default_cflags := -g -O2
350 else
351 default_cflags := -g -O
352 endif

Up till this merge we were still running bits from September 25th which didn't 
have a "stable" number. So someone needs to make our glibc -O2 clean.

OK, I switched to -O and built a new xc(x86->hppa). I was able to build/boot a 
kernel, and build/run a hello world program. The new xc is at,

ftp://puffin.external.hp.com/pub/parisc/binaries/LinuxX86/xc-20010117.tar.gz

Please let me know if you have any problems with it.

Thanks,

-- 
Matt Taggart        Linux Development Lab
taggart@fc.hp.com   HP Linux Systems Operation
