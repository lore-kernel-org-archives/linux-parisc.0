Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from systemhalted (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.140.233])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3C8214831
	for <parisc-linux@lists.parisc-linux.org>; Fri, 21 Jun 2002 11:55:03 -0600 (MDT)
Date: Fri, 21 Jun 2002 13:54:53 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Ted Love <ted@tedlove.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] my find... (and a plea for advice)
Message-ID: <20020621175453.GA9039@systemhalted>
References: <1024672425.3d1342a9668b1@mail.tedlove.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1024672425.3d1342a9668b1@mail.tedlove.net>
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

> The other day, I stumbled on to an HP 745 machine.  Figuring I could 
> do "something" with it, and having the urge to dive into playing with a RISC 
> box(and another linux machine), I stumbled on to your community here.

What types of monitors have you connected to the box?
A good multi-sync should do... anything that can handle 1280x1024.

Without an HIL keyboard you are still in trouble since you can't
set the console to serial. 

And if you can't access the console you can't change the primary
boot path to LAN.

c.
