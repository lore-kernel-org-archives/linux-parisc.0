Return-Path: <carlos@baldric.uwo.ca>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3E9A148B3
	for <parisc-linux@lists.parisc-linux.org>;
	Fri, 12 Mar 2004 14:22:33 -0700 (MST)
Date: Fri, 12 Mar 2004 16:20:12 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] 	RE: New glibc patches 2004-03-08,
	fixes GLRO changes.
Message-ID: <20040312212012.GS24266@baldric.uwo.ca>
References: <20040312164116.GI24266@baldric.uwo.ca>
	<404EC1C600002B98@ocpmta1.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <404EC1C600002B98@ocpmta1.freegates.net>
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Fri, Mar 12, 2004 at 06:33:11PM +0100, Joel Soete wrote:
> Hmmm all output files realted to Error1 was empty because of:
> hppa-linux-gcc -nostdlib -nostartfiles -o /Develop/parisc-linux/build/glibc/posix/tst-regex
>  -Wl,-dynamic-linker=/lib/ld.so.1
> /Develop/parisc-linux/build/glibc/csu/crt1.o /Develop/parisc-linux/build/glibc/csu/crti.o
> `hppa-linux-gcc --print-file-name=crtbegin.o` /Develop/parisc-linux/build/glibc/posix/tst-regex.o
> /Develop/parisc-linux/build/glibc/rt/librt.so  -Wl,-rpath-link=/Develop/parisc-linux/build/glibc:/Develop/parisc-linux/build/glibc/math:/Develop/parisc-linux/build/glibc/elf:/Develop/parisc-linux/build/glibc/dlfcn:/Develop/parisc-linux/build/glibc/nss:
> /Develop/parisc-linux/build/glibc/nis:/Develop/parisc-linux/build/glibc/rt:/Develop/parisc-linux/build/glibc/resolv:/Develop/parisc-linux/build/glibc/crypt:/Develop/parisc-linux/build/glibc/linuxthreads
> /Develop/parisc-linux/build/glibc/libc.so.6 /Develop/parisc-linux/build/glibc/libc_nonshared.a
> -lgcc `hppa-linux-gcc --print-file-name=crtend.o` /Develop/parisc-linux/build/glibc/csu/crtn.o
> /Develop/parisc-linux/build/glibc/rt/librt.so: undefined reference to `pthread_create'
> /Develop/parisc-linux/build/glibc/rt/librt.so: undefined reference to `_pthread_cleanup_pop'
> /Develop/parisc-linux/build/glibc/rt/librt.so: undefined reference to `pthread_once'
> /Develop/parisc-linux/build/glibc/rt/librt.so: undefined reference to `_pthread_cleanup_push'
> /Develop/parisc-linux/build/glibc/rt/librt.so: undefined reference to `pthread_atfork'
> collect2: ld returned 1 exit status
> make[2]: *** [/Develop/parisc-linux/build/glibc/posix/tst-regex] Error 1

Are you sure you thread library was built correctly? Do you see those
symbols in libpthread? All those issues are related to libpthread being
broken somehow.
 
> make[2]: *** [/Develop/parisc-linux/build/glibc/elf/tst-dlmodcount.out] Error 139
> do_page_fault() pid=9891 command='ld.so.1' type=15 address=0x401aca28
> vm_start = 0x40177000, vm_end = 0x4017c000

Can you run the loader through gdb, and give an assembly dump around the
address where it crashes?

c.
