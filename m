Return-Path: <soete.joel@tiscali.be>
Received: from smtp-out.tiscali.be (spoolo2.tiscali.be [62.235.13.211])
	by dsl2.external.hp.com (Postfix) with ESMTP id 995D348A8
	for <parisc-linux@lists.parisc-linux.org>;
	Wed, 24 Dec 2003 05:38:43 -0700 (MST)
Message-ID: <3FE98907.40903@tiscali.be>
Date: Wed, 24 Dec 2003 12:39:35 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] serial 2 broken in 2.6.0 for b180?(followup)
References: <1072192334.1815.0.camel@mulgrave>
	<3FB2652500018822@ocpmta2.freegates.net>
	<20031224050510.GF24091@colo.lackof.org>
In-Reply-To: <20031224050510.GF24091@colo.lackof.org>
Content-Type: text/plain; charset=us-ascii; format=flowed
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>



Grant Grundler wrote:
> On Tue, Dec 23, 2003 at 06:42:03PM +0100, Joel Soete wrote:
> 
>>hmm it seems that 'setserial /dev/ttyS1 port 0xfff83800' locks the memtioned
>>serial port (even thought "port 0xfff83800" is well the one related in dmesg).
> 
> 
> setserial has always caused me more trouble than solved problems.

Ah ok (it was just install at one moment because help me in 2.4 adventure :) )

> It might be a great program for x86, but certain people keep telling
> me NOT to use it on parisc or ia64. I've removed it from all my machines.

I will do the same

Thanks for advise,
	Joel
