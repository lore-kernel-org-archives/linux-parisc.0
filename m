Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mta203-rme.xtra.co.nz (mta203-rme.xtra.co.nz [210.86.15.146])
	by dsl2.external.hp.com (Postfix) with ESMTP id B620B4829
	for <parisc-linux@lists.parisc-linux.org>; Fri, 20 Dec 2002 20:20:02 -0700 (MST)
From: Gavin Hubbard <ghub005@xtra.co.nz>
Reply-To: ghub005@xtra.co.nz
To: <grundler@dsl2.external.hp.com>
Cc: <parisc-linux@lists.parisc-linux.org>
Subject: Re: Re: [parisc-linux] rp2430 questions
Date: Sat, 21 Dec 2002 16:19:55 +1300
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Message-Id: <20021221031955.AYR14518.web4-rme.xtra.co.nz@[127.0.0.1]>
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

> On Thu, Dec 19, 2002 at 03:08:15PM +1300, Gavin Hubbard wrote:
> > The other difference is the PCI controller support - the rp2430 has two
> > working PCI slots and two disabled slots which are enabled by the upgrade.
> 
> ok. I didn't know that.
> 
> > Since I don't actually know how the device disabling is done in hardware,
> > I'm not convinced that parisc-linux will come up smoothly after
> > I install the upgrade (I'm not worried about HP-UX - it will be fine).
> 
> Well, if you really end up with the equivalent to an rp2470, then
> I can assure you there is a kernel out there that will work since
> that's what several developers are using (including myself).
> 
> > Can anyone shed light on this?
> 
> I suspect the rp2430 PDC simply doesn't report one (or two) of the
> PCI bus controllers. Neither HPUX nor parisc-linux will see those slots.
> Very simple to implement and requires no HW changes.
> 
> grant

Thanks for the info Grant. If the only difference is in the PDC device tables then the transition should work with no problem.

The reason we are going with a rp2430 -> rp2470 rather than starting with an rp2470 is that upgrade will coincide with the system moving from development into production. This move is dependent on guesses we've made about business conditions in a few months time (which might be wrong).

Regards,

Gavin
