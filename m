Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id E5A08482D
	for <parisc-linux@lists.parisc-linux.org>; Mon, 14 Jul 2003 12:50:21 -0600 (MDT)
Date: Mon, 14 Jul 2003 14:49:13 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Thibaut VAR?NE <varenet@esiee.fr>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 2.4.21-paX on an rp2430
Message-ID: <20030714184913.GD14114@systemhalted>
References: <20030714182347.GC14114@systemhalted> <47013C75-B62B-11D7-997E-0030656F07A2@esiee.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <47013C75-B62B-11D7-997E-0030656F07A2@esiee.fr>
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

> >
> >processor                 system initialization      1C00
> >processor                 system initialization      1C00
> 
> these two messages show that the kernel went up to calling INIT
> (the second "system initialization" is sent just before INIT is called).
> 
> You can check the real logs by issuing the CL command in your GSP.
> You'll find there the console log, without the VFP messages.

What does this mean from the viewpoint of the boot process? Did the
kernel actually boot or just got stuck here?

c.
