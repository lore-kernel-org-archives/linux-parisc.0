From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: Re: can't compile kernel for parisc
Date: Fri, 27 Feb 2009 20:55:28 +0300
Message-ID: <a4423d670902270955j5562dd4bkce8142e0a89750f9@mail.gmail.com>
References: <119aab440902270756w4cceb56bq4c247d70e3e34786@mail.gmail.com>
	 <20090227164630.642474EF8@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: "Carlos O'Donell" <carlos@systemhalted.org>,
	linux-parisc@vger.kernel.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090227164630.642474EF8@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

2009/2/27 John David Anglin <dave@hiauly1.hia.nrc.ca>:
>> On Fri, Feb 27, 2009 at 10:40 AM, Alexander Beregalov
>> <a.beregalov@gmail.com> wrote:
>> > The same problem: ld segfaults:
>> > do_page_fault() pid=3D15739 command=3D'ld' type=3D15 address=3D0x0=
0000c84
>>
>> This is likely a bug in the static linker, or a miscompilation of th=
e
>> static linker by your toolchain.
>
> If the problem is fully, reproducable, then I agree its likely
> a toolchain issue. =C2=A0However, as indicated multiple times on the =
list,
> we get random segfaults in various programs. =C2=A0In my experience,
> this occurs more frequently with kernels after 2.6.22 but I'm sure
> 2.6.22 is affected.
Yes, it is fully reproducible, I have tried 2.18 and 2.19.1 versions
of binutils.

(gdb) run
Starting program: /usr/bin/ld --build-id -o .tmp_vmlinux1 -T
arch/parisc/kernel/vmlinux.lds arch/parisc/kernel/head.o
init/built-in.o --start-group usr/built-in.o arch/parisc/mm/built-in.o
arch/parisc/kernel/built-in.o arch/parisc/math-emu/built-in.o
arch/parisc/kernel/init_task.o kernel/built-in.o mm/built-in.o
fs/built-in.o ipc/built-in.o security/built-in.o crypto/built-in.o
block/built-in.o lib/lib.a arch/parisc/lib/lib.a
/usr/lib/gcc/hppa2.0-unknown-linux-gnu/4.3.3/libgcc.a lib/built-in.o
arch/parisc/lib/built-in.o
/usr/lib/gcc/hppa2.0-unknown-linux-gnu/4.3.3/libgcc.a
drivers/built-in.o sound/built-in.o firmware/built-in.o net/built-in.o
--end-group
(no debugging symbols found)
(no debugging symbols found)
(no debugging symbols found)
/usr/bin/ld:
Program received signal SIGSEGV, Segmentation fault.
0x4080f404 in strlen () from /lib/libc.so.6
(gdb) backtrace
#0  0x4080f404 in strlen () from /lib/libc.so.6
#1  0x407d5428 in vfprintf () from /lib/libc.so.6
#2  0x407d1304 in ?? () from /lib/libc.so.6
#3  0x407d18b0 in vfprintf () from /lib/libc.so.6
#4  0x4088359c in __vfprintf_chk () from /lib/libc.so.6
#5  0x4040cdc8 in _bfd_default_error_handler () from
/usr/lib/binutils/hppa2.0-unknown-linux-gnu/2.18/libbfd-2.18.so
#6  0x40432034 in ?? () from
/usr/lib/binutils/hppa2.0-unknown-linux-gnu/2.18/libbfd-2.18.so
#7  0x40452f58 in bfd_elf_final_link () from
/usr/lib/binutils/hppa2.0-unknown-linux-gnu/2.18/libbfd-2.18.so
#8  0x4042e764 in ?? () from
/usr/lib/binutils/hppa2.0-unknown-linux-gnu/2.18/libbfd-2.18.so
#9  0x00029f3c in ?? ()
#10 0x000295c8 in main ()

Glibc is  2.9_p20081201, I will try older version.
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
