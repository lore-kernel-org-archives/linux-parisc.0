Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 40BC54840
	for <parisc-linux@lists.parisc-linux.org>; Mon,  6 Oct 2003 08:37:22 -0600 (MDT)
Date: Mon, 6 Oct 2003 10:33:19 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Joel Soete <soete.joel@tiscali.be>
Cc: "M. Grabert" <xam@cs.ucc.ie>, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] traps.c 2.4 alignement [was: 2.6.0-test6-pa6 on b2k finaly crash]
Message-ID: <20031006143319.GC27512@systemhalted>
References: <3F5CB6FB0000CBFC@ocpmta1.freegates.net> <3F803388.5090304@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3F803388.5090304@tiscali.be>
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

On Sun, Oct 05, 2003 at 03:06:48PM +0000, Joel Soete wrote:
> Hi Carlos and all,
> 
> Regarding a bit more about this crash dump, I figure out that your patch 
> <http://lists.parisc-linux.org/pipermail/parisc-linux/2002-September/017565.html> 
> was not yet 'aligned' in 2.6.
> So may I suggest you this first draft:

The draft looks good. I'll merge it into 2.6 today and test on my
system.

c.
