Return-Path: <grundler@lackof.org>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id 24F7848A0
	for <parisc-linux@lists.parisc-linux.org>;
	Tue, 23 Dec 2003 22:05:12 -0700 (MST)
Date: Tue, 23 Dec 2003 22:05:10 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] serial 2 broken in 2.6.0 for b180?(followup)
Message-ID: <20031224050510.GF24091@colo.lackof.org>
References: <1072192334.1815.0.camel@mulgrave>
	<3FB2652500018822@ocpmta2.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3FB2652500018822@ocpmta2.freegates.net>
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Tue, Dec 23, 2003 at 06:42:03PM +0100, Joel Soete wrote:
> hmm it seems that 'setserial /dev/ttyS1 port 0xfff83800' locks the memtioned
> serial port (even thought "port 0xfff83800" is well the one related in dmesg).

setserial has always caused me more trouble than solved problems.
It might be a great program for x86, but certain people keep telling
me NOT to use it on parisc or ia64. I've removed it from all my machines.

grant
