Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from lxorguk.ukuu.org.uk (pc2-cwma1-4-cust86.swan.cable.ntl.com [213.105.254.86])
	by dsl2.external.hp.com (Postfix) with ESMTP id DB3024829
	for <parisc-linux@lists.parisc-linux.org>; Sun,  6 Jul 2003 01:26:27 -0600 (MDT)
Received: from dhcp22.swansea.linux.org.uk (dhcp22.swansea.linux.org.uk [127.0.0.1])
	by lxorguk.ukuu.org.uk (8.12.8/8.12.5) with ESMTP id h667NlKd000748;
	Sun, 6 Jul 2003 08:23:47 +0100
Received: (from alan@localhost)
	by dhcp22.swansea.linux.org.uk (8.12.8/8.12.8/Submit) id h667NiL8000746;
	Sun, 6 Jul 2003 08:23:44 +0100
Subject: Re: [parisc-linux] IDE modules build prob
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
To: Grant Grundler <grundler@parisc-linux.org>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <20030706063150.GB18646@dsl2.external.hp.com>
References: <20030627151546.GA30607@dsl2.external.hp.com>
	 <3ED70CF10000AE2E@ocpmta2.freegates.net>
	 <20030705230834.GB9682@dsl2.external.hp.com>
	 <20030706055754.GA18646@dsl2.external.hp.com>
	 <20030706063150.GB18646@dsl2.external.hp.com>
Content-Type: text/plain
Message-Id: <1057476223.704.0.camel@dhcp22.swansea.linux.org.uk>
Mime-Version: 1.0
Date: 06 Jul 2003 08:23:44 +0100
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

On Sul, 2003-07-06 at 07:31, Grant Grundler wrote:
> On Sat, Jul 05, 2003 at 11:57:54PM -0600, Grant Grundler wrote:
> > I gather each .o file is only allowed to have one module_init().
> 
> My tree builds/links/modules_install now.
> 
> Removed ide-default.o from ide-core-objs.
> Added the following line after the device (disk/tape/cd) drivers:
> 
> obj-$(CONFIG_BLK_DEV_IDE) += ide-default.o
> 
> I need to go back and see if the EXPORT_SYMBOLS() I added
> to various IDE files are still needed. Not tonight.

The module patch relies on you having the 2.4.22-pre3 IDE changes for
things like ide-default

$grep init_module drivers/ide/ide-default.c
$
