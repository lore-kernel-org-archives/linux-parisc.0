Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8BF47482B
	for <parisc-linux@lists.parisc-linux.org>; Wed,  9 Jul 2003 11:27:13 -0600 (MDT)
Received: from carlos by baldric with local (Exim 3.35 #1 (Debian))
	id 19aIhz-0006aW-00
	for <parisc-linux@lists.parisc-linux.org>; Wed, 09 Jul 2003 13:26:23 -0400
Date: Wed, 9 Jul 2003 13:26:22 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20030709172622.GD21298@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] ntop vs. linux-hppa kernel
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

pa,

Is anyone runing ntop on hppa? I've got a c3k on unstable running
2.4.21-pa2 and ntop (lastest in unstable) causes a protection id trap 27
which seems to sends the kernel into a loop, but atleast not an 
outright crash.

The box's network and console are gone, but it's showing heartbeat and I
can shutdown via the software button.

I'll take down the full oops when I get all the users off the box (and
recreate the pb.).

c.
