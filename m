Return-Path: <carlos@baldric.uwo.ca>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id AAA3548BA
	for <parisc-linux@lists.parisc-linux.org>;
	Sun, 14 Mar 2004 12:42:32 -0700 (MST)
Date: Sun, 14 Mar 2004 14:40:04 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] 	RE: New glibc patches 2004-03-08,
	fixes GLRO changes.
Message-ID: <20040314194004.GF24266@baldric.uwo.ca>
References: <20040312164116.GI24266@baldric.uwo.ca>
	<404EC1C600002B98@ocpmta1.freegates.net>
	<20040312212012.GS24266@baldric.uwo.ca>
	<40535A0A.4020209@tiscali.be>
	<20040314193237.GE24266@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20040314193237.GE24266@baldric.uwo.ca>
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Sun, Mar 14, 2004 at 02:32:37PM -0500, Carlos O'Donell wrote:
> > No pb if gdb don't segv (but iirc that only appened with gcc-3.5) and if 
> > lucky I could also garb a bt :).
> > 
> > Btw in previous test, I noticed that IAOQ was for instance =0x41007293 when 
> > gdb shows me the actual address of the crash at '0x41007293 - 3' and I find 
> > well the corresponding code at  7290 in an 'objdump -d'. Do you know why 
> > this diff of 3?
> 
> Instructions can only start at addresses that are modulo 32-bits, gdb is
> returning the start address of the insn that executed. While IAOQ is
> showing that the insn has finished (e.g. pointing at the last byte 0 1 2
> 3).

Sorry, I'm smoking crack.

Address OR Privilege = IAOQ

Privilege Kernel = 0
Privilege User   = 3 

c.
