Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.speakeasy.net (mail14.speakeasy.net [216.254.0.214])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7CF874836
	for <parisc-linux@lists.parisc-linux.org>; Tue,  4 Jun 2002 09:50:09 -0600 (MDT)
Date: Tue, 4 Jun 2002 08:49:54 -0700
From: Randolph Chung <randolph@tausq.org>
To: "Carlos O'Donell Jr." <carlos@baldric.uwo.ca>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] kdb_v21 branch updated to -pa26, and kallsyms cross-compile
Message-ID: <20020604154954.GA29187@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <20020529110118.A3691@systemhalted> <20020529162438.GJ9919@tykepenguin.com> <20020529132631.B3691@systemhalted> <20020529180739.GL9919@tykepenguin.com> <20020530143626.GF810@tykepenguin.com> <20020530133515.B15631@systemhalted> <20020531072849.GD1145@tykepenguin.com> <20020531085419.B18658@systemhalted> <20020604115547.GB1808@tykepenguin.com> <20020604084440.A24973@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020604084440.A24973@systemhalted>
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

> I think there are two maybe three places where kdb initializes 
> certain structures during startup. I'm going to have to check 
> those paths to see how far it gets before dying.
> 
> Any comments from the crowd would be helpfull :)
> 
> /me goes off to add some printk's and extra check

i've been offline for a bit so i might have missed something... but aiui
the symptom you've been seeing is that it hangs at the "If this is the
last message you see" message? has anyone tried to compile a kernel with
early bootup messages (there's a #define in pdc_cons.c to enable this)
and see if they get farther?

there are some debugging stuff that you can turn on in
arch/parisc/kernel/unwind.c ... that piece of code has caused some hangs 
in the past, you might want to enable those printks as well.

randolph
-- 
   @..@                                         http://www.TauSq.org/
  (----)
 ( >__< )
 ^^ ~~ ^^
