Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from beavis.ybsoft.com (bradetich.net [209.161.7.161])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7DC8E4834
	for <parisc-linux@lists.parisc-linux.org>; Mon,  8 Jul 2002 14:06:51 -0600 (MDT)
Subject: Re: [parisc-linux] modem on k210/819
From: Ryan Bradetich <rbradetich@uswest.net>
To: Stephan Trajkoff <stephan@itp.bg>
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
In-Reply-To: <3D2973B4.4080807@itp.bg>
References: <3D2973B4.4080807@itp.bg>
Content-Type: text/plain
Date: 08 Jul 2002 14:06:49 -0600
Message-Id: <1026158810.1523.2.camel@beavis>
Mime-Version: 1.0
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

Stephan,

The mux support is currently under development.  Right now,
the console on the K class systems is done via a PDC (firmware)
console that Christoph Plattner wrote.  

I have been working on getting support for the native mux in
but I have a few minor bugs left to flush out before I can
commit the first version.

Also I have only been testing the mux for console support,
not modem support, so additional work might need to be completed
before the modem works .. not sure on that.

thanks,

- Ryan

On Mon, 2002-07-08 at 05:12, Stephan Trajkoff wrote:
> Hello, anyone knows how to run modem under k210/819 HP?
> I want to make dial-in with this modem
> 
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 
