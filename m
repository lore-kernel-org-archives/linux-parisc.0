Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sh.od.inet (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.140.233])
	by dsl2.external.hp.com (Postfix) with ESMTP id A24CE483C
	for <parisc-linux@lists.parisc-linux.org>; Tue,  4 Jun 2002 11:28:01 -0600 (MDT)
Date: Tue, 4 Jun 2002 13:27:50 -0400
From: "Carlos O'Donell Jr." <carlos@baldric.uwo.ca>
To: Randolph Chung <randolph@tausq.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] kdb_v21 branch updated to -pa26, and kallsyms cross-compile
Message-ID: <20020604132750.I25630@systemhalted>
References: <20020529162438.GJ9919@tykepenguin.com> <20020529132631.B3691@systemhalted> <20020529180739.GL9919@tykepenguin.com> <20020530143626.GF810@tykepenguin.com> <20020530133515.B15631@systemhalted> <20020531072849.GD1145@tykepenguin.com> <20020531085419.B18658@systemhalted> <20020604115547.GB1808@tykepenguin.com> <20020604084440.A24973@systemhalted> <20020604154954.GA29187@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020604154954.GA29187@tausq.org>; from randolph@tausq.org on Tue, Jun 04, 2002 at 08:49:54AM -0700
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
> i've been offline for a bit so i might have missed something... but aiui
> the symptom you've been seeing is that it hangs at the "If this is the
> last message you see" message? has anyone tried to compile a kernel with
> early bootup messages (there's a #define in pdc_cons.c to enable this)
> and see if they get farther?
> 
> there are some debugging stuff that you can turn on in
> arch/parisc/kernel/unwind.c ... that piece of code has caused some hangs 
> in the past, you might want to enable those printks as well.
> 
> randolph

Yeah I've seen the code in pdc_cons.c, but I didn't know about 
the issues with the stack unwinding (though I just read JDA's
comments in the code... so I'll look at that).

I'll hack on this tonight and see how far I get.
Currently my test box is turned off, and since I haven't
built my remote power switch (spp + solid state relay) ....
I can't reboot the sucker :}

Thanks to the external led I know that the box (712/60) doesn't 
get far since it never reaches the pdc soft power button 
initialization routine (__init power_init).

c.
