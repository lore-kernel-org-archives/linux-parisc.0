Return-Path: <carlos@baldric.uwo.ca>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 890CE4829
	for <parisc-linux@lists.parisc-linux.org>;
	Tue, 27 Apr 2004 11:15:51 -0600 (MDT)
Date: Tue, 27 Apr 2004 13:15:21 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] RE: [PATCH] glibc-2.3.3 error with debian
	unstable	compiler...
Message-ID: <20040427171521.GF14937@baldric.uwo.ca>
References: <20040427145741.GD14937@baldric.uwo.ca>
	<408D436000000F0D@ocpmta1.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <408D436000000F0D@ocpmta1.freegates.net>
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Tue, Apr 27, 2004 at 07:06:06PM +0200, Joel Soete wrote:
> > Can you verify this by running tst-timer4 by hand and sending the output
> > ot the list?
> Yes naturally, here there are:
> 
> # ./tst-timer4 
> clock_gettime returned timespec = { 1083087449, 554351000 }
> clock_getres returned timespec = { 0, 10000000 }
> # echo $?
> 0
> 
> Well duno if results are right (first line different on each test but the
> second is constant with or without TIMEOUTFACTOR)?
> 
> Don't hesitate with more questions ;)

Okay, it's a 64-bit kernel problem them. What kernel are you running
right now?

c.
