From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: Stuck gnat1 processes
Date: Fri, 10 Jun 2011 07:29:35 -0400
Message-ID: <BANLkTim6vmM2Q-ebUEYs3T872Xi-9rFDbA@mail.gmail.com>
References: <20110610013034.GA5353@hiauly1.hia.nrc.ca>
	<BANLkTim57hUshC5Uaeojn9nzCxy23UE=Xg@mail.gmail.com>
	<20110610030134.GA7699@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc@vger.kernel.org
To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20110610030134.GA7699@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, Jun 9, 2011 at 11:01 PM, John David Anglin
<dave@hiauly1.hia.nrc.ca> wrote:
> On Thu, 09 Jun 2011, Carlos O'Donell wrote:
>
>> This looks like a combination of multiple bugs, the process is
>> probably dead, or not running, which is why gdb can't do anything wi=
th
>> it. I'm surprised the ptrace API isn't returning some more diagnosti=
cs
>> about the stuck process.
>
> Why do you think the processes are dead or not running? =A0Top thinks
> they are running at 100% CPU. =A0The general system responsiveness
> seemed like full load.

If it's not dead, and running, why do you always attach and show $pc
at the same place?

This is either a ptrace bug, a gdb bug, or a kernel bug.

Either:

* Ptrace is incorrectly always returning $pc at a fixed location.

* Process is stuck faulting, running a signal handler, and returning
to the fault location.
- Does gnat it have a signal handler?

* Kernel is not running the process therefore whenever you attach it's
in the same place.

* gdb bug causes the process to always show as being in the same place.

You have to start ruling these out.

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
