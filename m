Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from fep02-app.kolumbus.fi (fep02-0.kolumbus.fi [193.229.0.44])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7C3904829
	for <parisc-linux@lists.parisc-linux.org>; Tue, 20 Aug 2002 02:23:20 -0600 (MDT)
Received: from azrael.blades.cxm ([62.248.234.162])
          by fep02-app.kolumbus.fi with ESMTP
          id <20020820082315.KVMT4192.fep02-app.kolumbus.fi@azrael.blades.cxm>
          for <parisc-linux@lists.parisc-linux.org>;
          Tue, 20 Aug 2002 11:23:15 +0300
Received: (from blades@localhost)
	by azrael.blades.cxm (SGI-8.9.3/8.9.3) id LAA01252
	for parisc-linux@lists.parisc-linux.org; Tue, 20 Aug 2002 11:23:06 +0300 (EEST)
Date: Tue, 20 Aug 2002 11:23:06 +0300
From: Harri Haataja <harri.haataja@cs.helsinki.fi>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] PCI Intel EtherExpressPro100 strangeness on C200 machine.
Message-ID: <20020820112305.A1245@azrael.smilehouse.com>
References: <3D5EB2D6.9090403@charter.net> <20020817223713.GA25852@gate450.dyndns.org> <s_selten@informatik.uni-karlsruhe.de> <20020820001806.364034829@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020820001806.364034829@dsl2.external.hp.com>; from grundler@dsl2.external.hp.com on Mon, Aug 19, 2002 at 06:18:06PM -0600
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

On Mon, Aug 19, 2002 at 06:18:06PM -0600, Grant Grundler wrote:
> Andreas Seltenreich wrote:
> > just append " || defined(__hppa__)" to line 47 of
> > drivers/net/eepro100.c I got mine working that way.
> Sorry - I just noticed that eepro100 for 2.4.19 is substantially
> different from 2.4.18. My previous repl was WRT 2.4.18 (RX_ALIGN).
> BTW, rx_copybreak is a module param and there must be some way of
> passing that in as a boot param too.

All along I wondered why people would quote line numbers instead of code
bits (and linenumbers).
