Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1B1E04840
	for <parisc-linux@lists.parisc-linux.org>; Mon,  6 Oct 2003 11:37:16 -0600 (MDT)
Date: Mon, 6 Oct 2003 13:34:01 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Joel Soete <soete.joel@tiscali.be>
Cc: "M. Grabert" <xam@cs.ucc.ie>, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] traps.c 2.4 alignement [was: 2.6.0-test6-pa6 on b2k finaly crash]
Message-ID: <20031006173401.GE27512@systemhalted>
References: <20031006143319.GC27512@systemhalted> <3F5CB6FB0000DD78@ocpmta1.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3F5CB6FB0000DD78@ocpmta1.freegates.net>
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

On Mon, Oct 06, 2003 at 06:21:50PM +0200, Joel Soete wrote:
> Finaly it works on my c110 and also on a b180l :)
> 
> But, as we could awaiting when such code=13 (conditional trap iirc), occurs
> in kernel mode (as on my b2k or Max's c3k) the kernel hang without advise
> :(

It happens in "kernel mode" ? That should trigger an oops? It's a SIGFPE
for the kernel :)

c.
