Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Wed, 15 Jan 2003 18:41:45 -0700
To: jsoe0708@tiscali.be
Cc: Randolph Chung <tausq@debian.org>,
	parisc-linux@lists.parisc-linux.org, debian-hppa@lists.debian.org
Subject: Re: [parisc-linux] new gcc-default for hppa
Message-ID: <20030116014145.GC8543@dsl2.external.hp.com>
References: <3DED9A6600005A12@ocpmta3.freegates.net> <3E1AA52C0000167E@ocpmta1.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3E1AA52C0000167E@ocpmta1.freegates.net>
From: grundler@dsl2.external.hp.com (Grant Grundler)
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Wed, Jan 15, 2003 at 05:14:47PM +0100, jsoe0708@tiscali.be wrote:
> and I got this time actual stack dump:
>  for builtin NIC:
> Stack Dump:
>  1ebd4780:  0004ff0f 54203230 38204345 35343a30
>  1ebd4770:  2031343a 101e0e7c 64204a61 31205765
>  1ebd4760:  2e0a2023 6d61696c 61766520 6f752068
>  1ebd4750:  75780a59 2f4c696e 20474e55 00075f10
>  1ebd4740:  0000001b 00069e0c 00069e0c 00000008
>  1ebd4730:  1ebd4588 101e27e4 1fe3ac80 00000000
> 
> Kernel addresses on the stack:
>  [<101e0e7c>]  [<101e27e4>]  [<101e25f8>]  [<101e0bec>]
>  [<1014b828>]  [<101de398>]  [<10104a6c>]  [<1013f4ac>]
>  [<10109f90>]  [<10109084>]  [<10109d4c>]  [<1013ff24>]
>  [<1013e3e4>]  [<1014ec28>]  [<101213f0>]

Randolph made the matching config/System.map available to me.

> Kernel Fault: Code=26 regs=1ebd4780 (Addr=00000082)

data page fault. looks like a null ptr dereference.
Above Kernel addresses point to:
0x101e0e7c opost+c8
0x101e27e4 write_chan+1ec
0x101e25f8 write_chan+0
0x101e0bec do_tty_write+134
0x1014b828 path_walk+14
0x101de398 tty_write+30
0x10104a6c handle_interruption+150
0x1013f4ac sys_write+a4
0x10109f90 syscall_exit+0
0x10109084 intr_check_sig+0
0x10109d4c child_return+0
0x1013ff24 chrdev_open+64
0x1013e3e4 dentry_open+f4
0x1014ec28 locate_fd+70
0x101213f0 it_real_fn+0

Seems like a jumble of stack traces.
Start with IOAQ (0x101e0dcc opost+18) and GR02 (rp, 0x101e27e4
write_chan+1ec) and look at source code to see which
kernel stack addresses are valid.

In any case, doesn't look like a problem with tulip driver.
I'll let someone else keep poking at this.

>   AND FOR External Nic:

> Kernel Fault: Code=6 regs=1ec3e080 (Addr=701e49c4)

This is bad. The kernel branched off into the weeds
or something. Could be the same problem though.

grant
