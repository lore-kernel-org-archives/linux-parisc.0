From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: futex wait failure
Date: Wed, 23 Dec 2009 16:48:25 -0500
Message-ID: <119aab440912231348y3731ce2bge2a41cf998d573f7@mail.gmail.com>
References: <119aab440912221230x1011a218sec9c5a1a07e85800@mail.gmail.com>
	 <20091222220513.E436C4EA9@hiauly1.hia.nrc.ca>
	 <119aab440912230701g6656be6fsdaf5383d2ff02363@mail.gmail.com>
	 <20091223161504.GA13299@hiauly1.hia.nrc.ca>
	 <20091223164828.GA13631@hiauly1.hia.nrc.ca>
	 <20091223203956.GA14732@hiauly1.hia.nrc.ca>
	 <119aab440912231245u5f1b88d3j54e11ad6a6e8953c@mail.gmail.com>
	 <20091223210807.GB14837@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc@vger.kernel.org
To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20091223210807.GB14837@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, Dec 23, 2009 at 4:08 PM, John David Anglin
<dave@hiauly1.hia.nrc.ca> wrote:
>> You might get a better idea if you run this under strace and look at
>> the futex syscalls being made. You won't see the locks since the fas=
t
>> path is through the light-weight-syscall compare-and-swap, but you
>> will see the unlocks, and you can count them.
>
> I would guess that the notifierMutex is locked/unlocked millions of
> time in a typical GCC testsuite run. =A0So, the problem won't be easy
> to duplicate manually.

You would be surprised how easy it is to duplicate some of these
problems. We need to write a small skeleton application that does
something similar to the notification done by tcl and uses
pthread_cond_timedwait. Setup main to run forever signaling the child
which does something and then goes back to waiting. Eventually this
should lock up like it does in tcl.

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
