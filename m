Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: "B. Douglas Hilton" <bdhilton@charter.net>,
	parisc-linux@lists.parisc-linux.org, saw@saw.sw.com.sg
Subject: Re: [parisc-linux] PCI Intel EtherExpressPro100 strangeness on C200 machine. 
In-Reply-To: Message from Andreas Seltenreich <s_selten@informatik.uni-karlsruhe.de>
   of "Sun, 18 Aug 2002 00:37:15 +0200." <20020817223713.GA25852@gate450.dyndns.org>
References: <3D5EB2D6.9090403@charter.net>  <20020817223713.GA25852@gate450.dyndns.org> 
Date: Fri, 30 Aug 2002 00:37:25 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020830063725.4D0FD4829@dsl2.external.hp.com>
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
> just append " || defined(__hppa__)" to line 47 of drivers/net/eepro100.c
> I got mine working that way.

Andreas,
I've just committed this change to 2.4.19-pa8.
Works on my c3000 too.

I wasn't real happy with this method of disabling something we
know doesn't work. The compiler can't optimize it away.
The alternative I was playing with is at
	ftp://ftp.parisc-linux.org/patches/eepro100-rxcopy.diff

but I'm not comfortable committing that since I don't know if
other arches *can't* support it or just prefer it be disabled.

thanks,
grant
