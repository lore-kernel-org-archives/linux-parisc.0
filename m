Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id KAA14412
	for <parisc-linux@puffin.external.hp.com>; Wed, 17 Nov 1999 10:42:59 -0700
Date: Wed, 17 Nov 1999 14:00:19 +0100
From: Philipp Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>
To: Philippe Benard <phi@hpfrcu03.france.hp.com>
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>, frowand@cup.hp.com,
        Philipp Heinrich Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>,
        parisc-linux@thepuffingroup.com, adevries@thepuffingroup.com
Subject: Re: [parisc-linux] depi?
Message-Id: <19991117140019.J750@mathe.stud.uni-erlangen.de>
References: <E11nhb8-0002Zh-00@the-village.bc.nu> <383145A5.C2AF5857@hpfrcu03.france.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <383145A5.C2AF5857@hpfrcu03.france.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

> > Thats why someone pulled that number out of a hat. You can pull any other
> > page aligned number out of a hat and that will be fine too.

Fine with the MM subsystem.  If you fix all the code stolen to work with the
new PAGE_OFFSET.  And fix it again when we merge with 2.3.

> Hum interesting, too bad the hat didn't got 0x1000 or 0x10000 i.e something
> that could be mapped to 0.0x0x1000 or 0.0x10000 this would greatly simplify
> the kernel code writing that need to run traslation off, I bet they used a red
> hat :-)

While any other page-aligned value for PAGE_OFFSET is fine with the Linux MM
code, it isn't with parisc hardware.  For that we need 1 MB-aligned addresses
(theoretically) or 512 KB-aligned addresses (according to the rumors about
undocumented hardware I heard).

> Anyway I'm sure that after a significant effort and marco's vmlinux will
> finally boot with all those funny things, 2 os in 1 file etc... :-) 

It boots quite fine now, and it never did that for PAGE_OFFSET == 0x0000 0000
(as it was back in the dark time when we didn't use VM at all).

The problem right now is we cannot run C code while PAGE_OFFSET is 0, and I
would like to do that (if I were good at parisc assembly, we wouldn't need to
do that.  Unfortunately, I'm quite bad, and I happen to prefer reading debug
messages over staring at PIM dumps for hours (which I've done, too)).

> I'm still in the dark regarding spaces usage (that is hppa dependent) in
> vmlinux, since this define the VAS usage, I'm back to the initial question how
> the VAS is used/designed for the kernel and for user processes.

> For instance how big can be a process under linux on pa1.1?

Right now TASK_SIZE, which is #defined to PAGE_OFFSET, which is defined to be
0xc000 0000.

Soon, 0x8000 0000 (without changing anything else).

> If you answer is lnear 4Gb,  I would say whoa they must have a real good
> design.

Eventually, we might have a flat 3 GB address space.  (4 GB is more difficult
because the syscall pages are at 0xc000 0000 / 0xc000 1000 currently).

Flat 4 GB is more difficult because HP/UX's ABI puts a syscall page after 3 GB
but otherwise there shouldn't be a problem (of course the pages at 0xc000 0000
and 0xc000 1000 always will be special).

> If you say 4x1Gb, I would say hum, they are using spaces

No need to do that, is there ?  (It looks okay as long as 1 GB looks huge
and you don't think you'll ever reach it - 80's literature can be so amusing).

On the other hand, 64 bits is really huge and we'll never run out of address
space on 64-bit machines.  This is here so it can be quoted.

> For now I have the feeling (hoping I completly wrong) that the user space is
> confined into the low 2Gb and the kernel space is located into the high 2Gb,
> well I bet I'm wrong here, I will try to find this mm.c code you spoke about,
> I was more hoping de design document even very thin, there is no need for a
> big book to describe how a VAS is implemented.

Right now you're right, we don't implement anything fancy and have to flush the
TLB on context switch (strictly speaking maybe we don't and could survive by
flushing TLB entries after we got a protection id mismatch).

In the near future we'll be using spaces in the obvious way - i.e. a process
has all space registers set to a unique value (unique per view of the memory,
so similar to the traditional process id (on Linux threads have pids too so
it isn't all that easy)).

My current impression is the easiest way to implement the unique value is
using the same value for protection id and the space registers.  Userspace is
expected never to change the values in the space registers and doing so will
result in a segmentation fault.  Is this consistent with what HP/UX binaries
expect ?

In the far future, we might consider doing fancy things using more than one
protection identifier at a time, allowing more than 32768 processes (not
counting all threads per process), directly mapping a file using SR1-SR3 (I
can see some applications that would like the performance improvement of
mmapping a complete disk) and other, even sicker, things.

	Philipp Rumpf
