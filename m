Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from systemhalted (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.140.233])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6010F4866
	for <parisc-linux@lists.parisc-linux.org>; Wed,  3 Jul 2002 06:13:16 -0600 (MDT)
Date: Wed, 3 Jul 2002 08:13:06 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Ralf Hildebrandt <Ralf.Hildebrandt@charite.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Power Button doesn't turn machine off anymore
Message-ID: <20020703121306.GA8464@systemhalted>
References: <20020702183558.GO25586@charite.de> <B1225F09-8DEC-11D6-A95C-0030656F07A2@esiee.fr> <20020702185708.GP25586@charite.de> <20020702190606.GA3678@systemhalted> <20020702190842.GR25586@charite.de> <20020702192147.GC3678@systemhalted> <20020702193116.GU25586@charite.de> <20020703052415.GB32490@charite.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020703052415.GB32490@charite.de>
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
> I rebooted that kernel. No output if I press the power switch.
> I checked /proc/sys/kernel/power, it's set to 1
> 

Do you see _anything_ in your log files when you press
the power switch?

Could you please post the .config that your kernel 
builds with?

c.
