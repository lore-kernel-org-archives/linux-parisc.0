Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Sun, 6 Jul 2003 00:31:50 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: parisc-linux@lists.parisc-linux.org
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: [parisc-linux] IDE modules build prob
Message-ID: <20030706063150.GB18646@dsl2.external.hp.com>
References: <20030627151546.GA30607@dsl2.external.hp.com> <3ED70CF10000AE2E@ocpmta2.freegates.net> <20030705230834.GB9682@dsl2.external.hp.com> <20030706055754.GA18646@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030706055754.GA18646@dsl2.external.hp.com>
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

On Sat, Jul 05, 2003 at 11:57:54PM -0600, Grant Grundler wrote:
> I gather each .o file is only allowed to have one module_init().

My tree builds/links/modules_install now.

Removed ide-default.o from ide-core-objs.
Added the following line after the device (disk/tape/cd) drivers:

obj-$(CONFIG_BLK_DEV_IDE) += ide-default.o

I need to go back and see if the EXPORT_SYMBOLS() I added
to various IDE files are still needed. Not tonight.

I've updated the -pa2 patch at:
	ftp://ftp.parisc-linux.org/patches/diff-2.4.21-pa2

and corresponding binaries/.config at:
	ftp://ftp.parisc-kernel.org/kernels/c3000/2.4.21-pa2.tgz

grant
