Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sh.od.inet (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.140.233])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3F7FC4857
	for <parisc-linux@lists.parisc-linux.org>; Fri, 15 Feb 2002 05:46:34 -0700 (MST)
Received: (from carlos@localhost)
	by sh.od.inet (8.11.0/8.11.0) id g1FCkp219315
	for parisc-linux@lists.parisc-linux.org; Fri, 15 Feb 2002 07:46:51 -0500
Date: Fri, 15 Feb 2002 07:46:51 -0500
From: "Carlos O'Donell Jr." <carlos@baldric.uwo.ca>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Power LED
Message-ID: <20020215074651.C18453@systemhalted>
References: <002101c1b5ee$b5f8a620$02c1a8c0@james.co.uk> <20020214231312.37ca1c9e.csuder@cisco.com> <200202150826.29543.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200202150826.29543.deller@gmx.de>; from deller@gmx.de on Fri, Feb 15, 2002 at 08:26:57AM +0100
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

> I know the power button works correctly on my c3000 and 715/64. Both
> systems shuts down the computer cleanly.
> But on another Apollo/50 machine (712/50 or 715/50 - I don't remember) 
> pressing the power-button turns off the machine immediately. This is a bug
> and should be fixed if possible.
> 
> Helge
>

The 715/50 Apollo has a hard wired power button, and a full array
of leds on the front to indicate power/heartbeat/rx-tx/disk access.

My 712/60 definatley has a soft button (since I routinely pull
the rear power plug when my "tinkering" causes a kernel crash), 
and the led stays on after booting.

c.
