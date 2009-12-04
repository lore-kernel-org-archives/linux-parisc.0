From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: make hangs reading pipe
Date: Thu, 3 Dec 2009 21:47:01 -0500 (EST)
Message-ID: <20091204024701.BBB1D4FB2@hiauly1.hia.nrc.ca>
References: <119aab440912031802u72b7c679uf8cfa47d8c77f27f@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org
To: carlos@systemhalted.org (Carlos O'Donell)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab440912031802u72b7c679uf8cfa47d8c77f27f@mail.gmail.com> from "Carlos O'Donell" at Dec 3, 2009 09:02:05 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> > The current hang could be debugged more if anybody has further ideas.
> > Any thoughts?
> 
> Yes, it's not make's fault, it's waiting for the read to complete.
> What is the process on the other side of the pipe?

Thanks for explaining the inode numbers.

The process on the other side is /bin/sh:

root@hiauly6:/proc/14971# ps -ef|grep 14971
dave     14971     1  0 Dec01 ?        00:00:00 /bin/sh

It's fd's are:

root@hiauly6:/proc/14971/fd# ls -l
total 0
lr-x------ 1 dave dave 64 Dec  3 21:20 0 -> pipe:[1401596]
l-wx------ 1 dave dave 64 Dec  3 21:20 1 -> pipe:[1401597]
l-wx------ 1 dave dave 64 Dec  3 21:20 2 -> /home/dave/gnu/gcc-4.5/objdir/build.log
lr-x------ 1 dave dave 64 Dec  3 21:20 3 -> pipe:[1383769]
l-wx------ 1 dave dave 64 Dec  3 21:20 4 -> pipe:[1383769]
lr-x------ 1 dave dave 64 Dec  3 21:20 5 -> /usr/include/sys/stat.h
lr-x------ 1 dave dave 64 Dec  3 21:20 6 -> pipe:[1401596]
l-wx------ 1 dave dave 64 Dec  3 21:20 7 -> pipe:[1401596]
l-wx------ 1 dave dave 64 Dec  3 21:20 9 -> pipe:[1401597]

It's stuck reading 0:

root@hiauly6:/proc/14971# strace -p14971
Process 14971 attached - interrupt to quit
read(0, 

The only process using inode 1401596 is 14971.  As seen above, it
seems to be talking to itself.  That probably would explain the hang.

It's backtrace is:

0x4058607c in read () from /lib/libc.so.6
(gdb) bt
#0  0x4058607c in read () from /lib/libc.so.6
#1  0x0009051c in zread ()
#2  0x000618ac in buffered_getchar ()
#3  0x0002c71c in ?? ()
#4  0x0002ef74 in ?? ()
#5  0x00032ebc in yyparse ()
#6  0x00029e30 in parse_command ()
#7  0x00029f30 in read_command ()
#8  0x0002a0d0 in reader_loop ()
#9  0x000292b8 in main ()

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
