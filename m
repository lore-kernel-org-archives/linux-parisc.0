Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id C7A454829
	for <parisc-linux@lists.parisc-linux.org>; Tue,  8 Oct 2002 17:36:17 -0600 (MDT)
Date: Tue, 8 Oct 2002 16:37:39 -0700
From: Randolph Chung <randolph@tausq.org>
To: Tobias Giesen <tobias_subscriber@tgtools.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Can't start X-windows on HP C240 with HP FX4 graphics card ?
Message-ID: <20021008233739.GE5602@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <20021008223316.GB3692@solo.franken.de> <000601c26f23$0d62c330$f10f51d9@PLUTO>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <000601c26f23$0d62c330$f10f51d9@PLUTO>
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

> > porting the kernel won't help, the X server modules 
> > contain all the important bits. 
> 
> ... and they are not open source, right? Damn.
> 
> And HP is not violating any versions GPL there? Did they build modules
> from scratch?

1. xfree86 does not have a GPL license
2. there have been many precedences for binary-only X drivers.

(I'm not saying this is a good thing, mind you...)

randolph
--  
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
