Return-Path: <carlos@baldric.uwo.ca>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 713614834
	for <parisc-linux@lists.parisc-linux.org>;
	Sat,  1 May 2004 16:46:36 -0600 (MDT)
Received: from carlos by baldric with local (Exim 3.35 #1 (Debian))
	id 1BK3F4-0003cc-00 for <parisc-linux@lists.parisc-linux.org>;
	Sat, 01 May 2004 18:45:54 -0400
Date: Sat, 1 May 2004 18:45:54 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Changing hppa default on panic to "reboot after
	180 seconds"?
Message-ID: <20040501224554.GY12850@baldric.uwo.ca>
References: <20040501223343.GX12850@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20040501223343.GX12850@baldric.uwo.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Sat, May 01, 2004 at 06:33:43PM -0400, Carlos O'Donell wrote:
> 
> parisc-linux,
> 
> I do a lot of my work remotely on older parisc boxes, and I usually slam
> the kernel into a panic. Previously I had my entire cluster of 32+ boxes
> running, so I could crash 32 times before having to go into the office.
> Lately I've been a little more power conservative.
> 
> I remember having lots more fun on my PowerPC box because it would
> reboot after 180 seconds after a panic.
> 
> Would anyone be opposed to adding 'panic_timeout = 180' in our
> arch/parisc/kernel/setup.c:setup_arch()? :)

Ignore this please... I missed the __setup("panic=", panic_setup) line.

c.
