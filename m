From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: missing compat_sys_ptrace conversions for mips and parisc
Date: Tue, 19 Aug 2008 08:44:22 -0400
Message-ID: <119aab440808190544j18422e4fu285f65c70a6d4454@mail.gmail.com>
References: <20080817022924.GA23625@lst.de> <48A8081A.4080609@gmx.de>
	 <48A8D39D.3070005@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: "Helge Deller" <deller@gmx.de>, "Kyle McMartin" <kyle@mcmartin.ca>,
	linux-parisc@vger.kernel.org
To: "Randolph Chung" <randolph@tausq.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <48A8D39D.3070005@tausq.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, Aug 17, 2008 at 9:42 PM, Randolph Chung <randolph@tausq.org> wrote:
>> I could take care of this for parisc. Just looked into the code and it
>> seems it could cleanup the code nicely as well.
>>
>> But I don't want to step on Kyle's toe, since I assume he prepares the
>> asm-parisc/ move in the parisc-2.6 git tree during the next days.
>
> Whoever does this change, I would appreciate if you could run a gdb
> testsuite before and after and compare the results.
>
> You can just build the debian package. I believe it runs the testsuite by
> default. (although i see from buildd.d.o that the latest version is FTBFS
> because of some header issues?)

This is fixed by my changes in upstream libc ports.

The kernel no longer provides an empty user.h, and therefore libc
should not include <linux/user.h> in <sys/user.h>, but instead provide
an empty version to satisfy any userspace application that may try to
include the file.

On hppa linux/user.h has always been empty.

Cheers,
Carlos.
