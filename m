Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from beavis.ybsoft.com (bradetich.net [209.161.7.161])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7D22A482C
	for <parisc-linux@parisc-linux.org>; Tue, 26 Mar 2002 18:39:14 -0700 (MST)
Subject: Re: [parisc-linux] X on J5000
From: Ryan Bradetich <rbradetich@uswest.net>
To: Jeremy Drake <jeremyd@apptechsys.com>
Cc: parisc-linux@parisc-linux.org
In-Reply-To: 
	<Pine.LNX.4.33L2.0203261716430.13376-100000@eiger.apptechsys.com>
References: 
	<Pine.LNX.4.33L2.0203261716430.13376-100000@eiger.apptechsys.com>
Content-Type: text/plain
Date: 26 Mar 2002 18:39:12 -0700
Message-Id: <1017193152.8324.6.camel@beavis>
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

Jeremy,

When the system booted up, did you see Tux?  If you saw the Tux
log that means the fb is setup properly and fbset -i should work.

If you didn't see tux that means the fb is not working for your card.

hope that helps!

- Ryan

On Tue, 2002-03-26 at 18:19, Jeremy Drake wrote:
> I've finally got a fairly stable setup - the latest 2.4.18-pa11 single
> proc.  Now I've got a USB card, and I am able to make the graphics console
> and hid keyboard working.  Now I've moved on to X.  I read somewhere, tho
> I forget where, that I have to do fbset -i to get the resolution.  This
> reports no such device.
> 
> So, I'd like a pointer to an X on J5000 setup howto and a little help
> figuring out the fb stuff.
> 
> 
> TIA
> 
> 
> -- 
> If you sell diamonds, you cannot expect to have many customers.
> But a diamond is a diamond even if there are no customers.
> 		-- Swami Prabhupada
> 
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 
