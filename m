Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from reactor.hyte.de (reactor.hyte.de [212.84.215.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9F3D04871
	for <parisc-linux@lists.parisc-linux.org>; Thu, 20 Jun 2002 10:08:52 -0600 (MDT)
Date: Thu, 20 Jun 2002 18:07:36 +0200 (CEST)
From: Joachim Steiger <roh@hyte.de>
To: joel.soete@freebel.net
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] serial on hp712/80 buggy?
In-Reply-To: <1024588748.3d11fbcc675a2@webmail.tiscalinet.be>
Message-ID: <Pine.LNX.4.21.0206201804430.4597-100000@reactor.hyte.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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


On Thu, 20 Jun 2002 joel.soete@freebel.net wrote:

> Do not works for me?
> In pppconfig I force 9600 bauds MyIsp connection, but do I also have to forc?
> the modem config to 9600bauds?
> 
> Thanks for advise,
> 	joel

i think the problem in this case could be that the 'handshake-wires' on
the serial are also not working?

i don't use them (no flow control at all) so i do'nt know..

i never used analog modems to dialin... we got isdn pretty early *eg*
so i can just 'think loud'

can you 'speak AT' to your modem via minicom or some app similar?

roh
