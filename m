Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from thinkpad.home (pc4-hem11-4-cust39.bre.cable.ntl.com [213.105.90.39])
	by dsl2.external.hp.com (Postfix) with ESMTP id 91A2A4843
	for <parisc-linux@lists.parisc-linux.org>; Thu,  4 Jul 2002 14:15:30 -0600 (MDT)
Date: Thu, 4 Jul 2002 20:14:55 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Alex Green <alexdgreen@hotmail.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Installing on C3600
Message-ID: <20020704191454.GA971@sleepie.demon.co.uk>
References: <OE62b63Kbc9oLfgzBsc00001390@hotmail.com> <3D21DFDD.9090002@freebel.net> <3D21E354.8050701@freebel.net> <OE17H31NKzHWcQTLwR20000190f@hotmail.com> <3D2460E6.2040608@freebel.net> <OE40wtsQztQoPAzdaQY00001f9b@hotmail.com> <3D2469AB.3080102@freebel.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3D2469AB.3080102@freebel.net>
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

On Thu, Jul 04, 2002 at 03:28:43PM +0000, Joel Soete wrote:
> Humm...
> 
> We would so to have a look in more details the terminal setup (baud rate 
> 9600, flow control ,...) I will give you my setup next week (except if 
> some one else could give you those details in the mean time).

Typically 9600 baud, 8 bit, no parity.  I usually go for no flow
control, and it hasn't caused me any problems.  vt100 or vt102 should be
fine.

What sort of screen corruption do you get?  First screen should be the
release notes.  Is it completely random, or mostly correct, or what?

Do you have a PC running linux handy?  Many people run minicom as a
terminal emulator successfully.

Richard
