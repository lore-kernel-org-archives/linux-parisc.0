Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1D3BD611F
	for <parisc-linux@lists.parisc-linux.org>; Sun, 25 Nov 2001 21:02:20 -0700 (MST)
Message-Id: <200111260357.UAA02910@puffin.external.hp.com>
To: "Craig D. Lansing" <lansing@beldar.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] J2240 - It Runs! 
In-Reply-To: Message from "Craig D. Lansing" <lansing@beldar.com>
   of "Sun, 25 Nov 2001 20:47:49 EST." <00fe01c1761c$5bf18000$0101a8c0@pogo>
Date: Sun, 25 Nov 2001 20:57:19 -0700
From: Grant Grundler <grundler@puffin.external.hp.com>
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

"Craig D. Lansing" wrote:
> Maybe I'll go to the latest kernel to see what that does to / for me.

I think you'll be alot better off.

>  So far, I've only been able
> to connect to the serial port via a Reflection session to login to the =
> system after getting through the boot path & IPL on the attached =
> graphics terminal.

You probably have the palo param "console=ttyS0" and that's why
it's switching to serial console. Palo documentation suggests
using "console=tty" for auto-detecting the console.

>   Does anyone know how to use the graphics terminal =
> exclusively?  I assume that I need to change some of the IPL parms, e.g. =
> sti=3D or console=3D, but I do not know what values to use.  Any help =
> would be appreciated.

With 0.9.2, if the graphics head were recognized and has a working
STI ROM, I would expect the console to remain on the graphics head.

Caveat: this is from one of the few people who *only* uses serial
consoles on hppa-linux.

grant
