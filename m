Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id F2FFB4841
	for <parisc-linux@parisc-linux.org>; Fri, 11 Jan 2002 15:37:30 -0700 (MST)
Message-Id: <200201112237.g0BMbRd0023762@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] FWD: The problematic asm code
To: randolph@tausq.org
Date: Fri, 11 Jan 2002 17:37:27 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@parisc-linux.org
In-Reply-To: <20020111152452.GD365@tausq.org> from "Randolph Chung" at Jan 11, 2002 07:25:04 am
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

> #include <stdio.h>
> void	out(const char *str, double x)
> {
> 	printf("%s: %f\n", str, x);
> }
> int	main(int argc, char **argv)
> {
> 	void	(*f)(const char *, double) = out;
> 	f("Calling via function pointer", 3.1415926535);
> 	out("Calling directly", 3.1415926535);
> 	return 0;
> }
> 
> This gives:
> % ./realind
> Calling via function pointer: 0.000000
> Calling directly: 3.141593
> 
> The RTL and the disassembly shows that in the function pointer case gcc
> tries to load the floating point argument into an integer register.

Gcc's behavior is correct.  The ABI specifies that arguments are passed
in general registers in dynamic calls.  This is most likely a linker problem.
The linker has to create the correct stub to copy the argument to a floating
register.  The test runs as expected with HP's som linker.  With the HP
assembler, gcc passes floats in both general and floating registers because
there is no way to specifiy argument locations in static functions.  With
GAS, gcc uses .PARAM to specify argument locations in static functions.

See pa.c around line 7236 for more information on what is being done.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
