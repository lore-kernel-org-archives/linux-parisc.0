Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from reactor.hyte.de (reactor.hyte.de [212.84.215.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id 86958486B
	for <parisc-linux@lists.parisc-linux.org>; Thu, 20 Jun 2002 10:22:46 -0600 (MDT)
Date: Thu, 20 Jun 2002 18:21:26 +0200 (CEST)
From: Joachim Steiger <roh@hyte.de>
To: joel.soete@freebel.net
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] serial on hp712/80 buggy?
In-Reply-To: <1024589603.3d11ff23d499b@webmail.tiscalinet.be>
Message-ID: <Pine.LNX.4.21.0206201817550.4636-100000@reactor.hyte.de>
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

> Hmm, I find back my 712 Owner's guide in witch it is mentionned that "The port
> operates at up to a 19.2k baud rate."
> 
> Joel

ugh... but shouldnt the serial driver return -EIO or -EINVAL when setting
a unsupported baudrate?

roh
