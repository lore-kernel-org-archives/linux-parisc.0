Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Mon, 17 Feb 2003 19:52:30 -0700
To: Joel Soete <jsoe0708@tiscali.be>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] .config fo a N class?
Message-ID: <20030218025230.GA13514@dsl2.external.hp.com>
References: <3E48B5950000297E@ocpmta3.freegates.net> <3E4ABE5000002044@ocpmta2.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3E4ABE5000002044@ocpmta2.freegates.net>
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

On Mon, Feb 17, 2003 at 06:51:01PM +0100, Joel Soete wrote:
> >I grab the config file of the test-drive L model; apply it against current
> >k-2.4.20-pa26 (just change 64 to 32 bits).
>                             ^^^^^^^^^^^^^ My bad: I would have to remember
> that hpux-11 have to be 64bits on L and N servers :?

right. But L-class also only supports 64-bit.
And you want to disable CONFIG_SMP for N-class and L3000.

> Well, for now I just boot with a dpkg kernel-image-2.4.19-64 (up) and still
> have to see what is wrong with eth0:

You were not very clear about the symptom.
And we need a slightly more accurate description
of the kernel-image version number.

But this might help you anyway
| > cvs log driver/nets/tulip/media.c
...
| revision 1.14
| 
| date: 2002/10/14 23:34:02;  author: grundler;  state: Exp;  lines: +13 -13
|
| 2.4.19-pa22 Fix tulip phy reset/init
| DP83840A.pdf and lxt971d.pdf both require polling
| the reset bit (bit 15) in mdio control register to
| determine when a reset has completed. Then the
| "init" sequence can be sent.


> eth0 Digital DS21143 Tulip rev 65 at 0x80 ... irq 128
> 
> Is there known problem with this type of NIC?

yes - there was. But built-in should work. add-on cards had problems.

> Next step would be to install a gcc-64 to recompile the kernel 2.4.20-pa27
> and have a new look on this eth0.

yes - good plan

grant
