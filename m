Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp3.pp.htv.fi (smtp3.pp.htv.fi [213.243.153.135])
	by dsl2.external.hp.com (Postfix) with ESMTP id AB14A4829
	for <parisc-linux@lists.parisc-linux.org>; Thu,  2 Jan 2003 11:41:27 -0700 (MST)
From: Arto Jantunen <viiru@debian.org>
To: Herb Radford <herbr@magma.ca>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] D370
References: <5.1.0.14.0.20030101115323.03a100e0@mail.magma.ca>
Date: Thu, 02 Jan 2003 20:41:07 +0200
In-Reply-To: <5.1.0.14.0.20030101115323.03a100e0@mail.magma.ca> (Herb
 Radford's message of "Wed, 01 Jan 2003 12:05:52 -0500")
Message-ID: <87el7vjsxo.fsf@welho.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

Herb Radford <herbr@magma.ca> writes:

> Has there been any change in the support for the D-Class machines with
> an Access Port card?
> I'm not sure I understand what's happening when the AP card is
> inserted. If I boot into the PDC I get the console on Serial 1. If I
> boot with my console plugged into the AP card serial port I get nada!
> When I plug my console into Serial 2 I also get zip!
> If I boot with the console in Serial 1, output stops at the famous
> "branching to" message.
>
> Must the AP card be removed for useful o[peration?

Thats how I did it for my D390 and after that it works fine. Also,
you can do the "switch to serial 2 after the branching point" dance..

Also, so that others know, with the current (as in 2.4.20) kernels
(which fixed some unaligned access issues, I believe), the machine
works just fine on 32-bit SMP.

-- 
Arto Jantunen
