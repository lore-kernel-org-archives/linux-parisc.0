Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from systemhalted (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.140.233])
	by dsl2.external.hp.com (Postfix) with ESMTP id 605F44865
	for <parisc-linux@lists.parisc-linux.org>; Thu, 20 Jun 2002 11:48:19 -0600 (MDT)
Date: Thu, 20 Jun 2002 13:48:20 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Joachim Steiger <roh@hyte.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] serial on hp712/80 buggy?
Message-ID: <20020620174820.GE4111@systemhalted>
References: <Pine.LNX.4.21.0206201644330.4291-100000@reactor.hyte.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.21.0206201644330.4291-100000@reactor.hyte.de>
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

> 
> i just played around with my machine and stated that setting the baudrate
> on the serial(rs232) to 57600(8n1) didnt work...
> using 9600baud works ok
>

Where did you set the baud rate?
In minicom _and_ the console (Boot admin)?

It's up to both ends to support automatic baud rate selection
via a terminal protocol. I don't think the console on the
712 will do that (I'm sure VT-MODEM can...).

c.
