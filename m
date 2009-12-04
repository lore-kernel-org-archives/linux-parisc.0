From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: make hangs reading pipe
Date: Thu, 3 Dec 2009 22:10:16 -0500
Message-ID: <119aab440912031910p569feb14ufa2472304610f671@mail.gmail.com>
References: <119aab440912031802u72b7c679uf8cfa47d8c77f27f@mail.gmail.com>
	 <20091204024701.BBB1D4FB2@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc@vger.kernel.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20091204024701.BBB1D4FB2@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, Dec 3, 2009 at 9:47 PM, John David Anglin
<dave@hiauly1.hia.nrc.ca> wrote:
>> Yes, it's not make's fault, it's waiting for the read to complete.
>> What is the process on the other side of the pipe?
>
> Thanks for explaining the inode numbers.
>
> The process on the other side is /bin/sh:
>
> root@hiauly6:/proc/14971# ps -ef|grep 14971
> dave =A0 =A0 14971 =A0 =A0 1 =A00 Dec01 ? =A0 =A0 =A0 =A000:00:00 /bi=
n/sh
>
> It's fd's are:
>
> root@hiauly6:/proc/14971/fd# ls -l
> total 0
> lr-x------ 1 dave dave 64 Dec =A03 21:20 0 -> pipe:[1401596]
> l-wx------ 1 dave dave 64 Dec =A03 21:20 1 -> pipe:[1401597]
> l-wx------ 1 dave dave 64 Dec =A03 21:20 2 -> /home/dave/gnu/gcc-4.5/=
objdir/build.log
> lr-x------ 1 dave dave 64 Dec =A03 21:20 3 -> pipe:[1383769]
> l-wx------ 1 dave dave 64 Dec =A03 21:20 4 -> pipe:[1383769]
> lr-x------ 1 dave dave 64 Dec =A03 21:20 5 -> /usr/include/sys/stat.h
> lr-x------ 1 dave dave 64 Dec =A03 21:20 6 -> pipe:[1401596]
> l-wx------ 1 dave dave 64 Dec =A03 21:20 7 -> pipe:[1401596]
> l-wx------ 1 dave dave 64 Dec =A03 21:20 9 -> pipe:[1401597]
>
> It's stuck reading 0:

It's stuck reading standard input, which happens to be attached to anot=
her pipe.

> root@hiauly6:/proc/14971# strace -p14971
> Process 14971 attached - interrupt to quit
> read(0,
>
> The only process using inode 1401596 is 14971. =A0As seen above, it
> seems to be talking to itself. =A0That probably would explain the han=
g.

Odd, is this normal for bash e.g. stdin -> pipe <- other fd.

> It's backtrace is:
>
> 0x4058607c in read () from /lib/libc.so.6
> (gdb) bt
> #0 =A00x4058607c in read () from /lib/libc.so.6
> #1 =A00x0009051c in zread ()
> #2 =A00x000618ac in buffered_getchar ()
> #3 =A00x0002c71c in ?? ()
> #4 =A00x0002ef74 in ?? ()
> #5 =A00x00032ebc in yyparse ()
> #6 =A00x00029e30 in parse_command ()
> #7 =A00x00029f30 in read_command ()
> #8 =A00x0002a0d0 in reader_loop ()
> #9 =A00x000292b8 in main ()

I don't know what to say at this point, it might be a bug in bash, or
a bug in pipefs for hppa where the same inode is given out incorrectly
under certain circumstances.

What does the normal behaviour look like, what is fd 6 being used for?
You should be able to use strace to observe the correct operation.

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
