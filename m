Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: parisc-linux@lists.parisc-linux.org, saw@saw.sw.com.sg
Subject: Re: [parisc-linux] PCI Intel EtherExpressPro100 strangeness on C200 machine. 
In-Reply-To: Message from Andreas Seltenreich <s_selten@informatik.uni-karlsruhe.de>
   of "Sun, 18 Aug 2002 00:37:15 +0200." <20020817223713.GA25852@gate450.dyndns.org>
References: <3D5EB2D6.9090403@charter.net>  <20020817223713.GA25852@gate450.dyndns.org> 
Date: Mon, 19 Aug 2002 18:18:06 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020820001806.364034829@dsl2.external.hp.com>
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

Andreas Seltenreich wrote:
> Hi,
> 
> just append " || defined(__hppa__)" to line 47 of drivers/net/eepro100.c
> I got mine working that way.

Sorry - I just noticed that eepro100 for 2.4.19 is substantially
different from 2.4.18. My previous repl was WRT 2.4.18 (RX_ALIGN).

BTW, rx_copybreak is a module param and there must be some way
of passing that in as a boot param too.

grant
