Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 891DB482D
	for <parisc-linux@lists.parisc-linux.org>; Tue, 12 Aug 2003 08:43:03 -0600 (MDT)
Date: Tue, 12 Aug 2003 10:40:12 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Joel Soete <jsoe0708@tiscali.be>
Cc: Matthew Wilcox <willy@debian.org>,
	parisc-linux@lists.parisc-linux.org, LaMont Jones <lamont@hp.com>
Subject: Re: [parisc-linux] itlb miss handler optimizations!
Message-ID: <20030812144012.GE9325@systemhalted>
References: <20030812035810.GB9325@systemhalted> <3F29178A00002C09@ocpmta7.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3F29178A00002C09@ocpmta7.freegates.net>
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

> I apply your patch against 2.4.21-pa9 on the N-4000 and compile it successfully
> with hppa64-linux-gcc (3.2.3). (having no clue about lmbench) I take this
> exercise to roughly compare. 
> 
> Running the original 2.4.21-pa9 here are times:
> Tue Aug 12 09:59:55 CEST 2003
> [...] # Build kernel: 19'58"
> Tue Aug 12 10:19:53 CEST 2003
> [...] # Build modules: 7'46"
> Tue Aug 12 10:27:39 CEST 2003
> 
> Running this new kernel:
> 
> Tue Aug 12 12:28:37 CEST 2003
> [...] # Build kernel: 20'8"
> Tue Aug 12 12:48:45 CEST 2003
> [...] # Build modules: 7'47"
> Tue Aug 12 12:56:32 CEST 2003
> 
> The difference are so small that a more accurate tools would be requested.

Thanks Joel! Yeah, I figured that perhaps the change might get lost in
the noise... I'm still running lmbench multiple times to get good
numbers.

Thanks again!

c.
