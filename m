Return-Path: <carlos@baldric.uwo.ca>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 402B8482F
	for <parisc-linux@lists.parisc-linux.org>;
	Mon,  3 May 2004 20:08:51 -0600 (MDT)
Date: Sun, 2 May 2004 00:33:41 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Matthew Wilcox <willy@debian.org>
Subject: Re: [parisc-linux] Changing hppa default on panic to "reboot after
	180 seconds"?
Message-ID: <20040502043341.GA12850@baldric.uwo.ca>
References: <20040501223343.GX12850@baldric.uwo.ca>
	<20040501224554.GY12850@baldric.uwo.ca>
	<20040501225507.GZ12850@baldric.uwo.ca>
	<20040502005516.GE2281@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20040502005516.GE2281@parcelfarce.linux.theplanet.co.uk>
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

> We already output the msg; doing this would output it twice ...

So... the box is burning and in flames, printing it twice is a double 
reminder of the error?

The first time we print it along with a long string of other items,
followed by a register dump. The second time the kernel prints it just
before it does a proper panic and honours the panic=XX kernel option.

The cleanest fix is to register show_regs on the panic notifiers so it
can get printed after the panic() message. That way we don't have to
print our message, instead panic() prints it for us and then runs the
list of panic notification functions (the pdc chassis lights are
registered here too). Now that sounds like a lot of work for a dying
box...

or

We just print it twice... <- Easy fix ;o)

c.
