Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Wed, 11 Dec 2002 10:37:28 -0700
To: Tim Kemna <t.kemna@student.utwente.nl>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] another kernel compilation error
Message-ID: <20021211173728.GA672@dsl2.external.hp.com>
References: <20021211035731.GB9521@systemhalted> <Pine.LNX.4.44.0212110410060.6654-100000@sal.ucc.ie> <20021211063321.GB10185@systemhalted> <006e01c2a11c$71745200$4fe85982@kabel.utwente.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <006e01c2a11c$71745200$4fe85982@kabel.utwente.nl>
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

On Wed, Dec 11, 2002 at 02:51:44PM +0100, Tim Kemna wrote:
> I'm trying to compile a kernel, version 2.4.20-pa13. But I get the following
> error:
...
> drivers/char/char.o: In function `hp_diva_check':
> drivers/char/char.o(.text.hp_diva_check+0x60): undefined reference to
> `rs_interrupt'

Maybe you don't have CONFIG_PCI=y/CONFIG_SERIAL_SHARE_IRQ=y?

grant
