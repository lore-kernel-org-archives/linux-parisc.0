From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: futex wait failure
Date: Wed, 23 Dec 2009 15:46:39 -0500
Message-ID: <119aab440912231246m3a9f34d8j184e16b7f37dfd11@mail.gmail.com>
References: <119aab440912221230x1011a218sec9c5a1a07e85800@mail.gmail.com>
	 <20091222220513.E436C4EA9@hiauly1.hia.nrc.ca>
	 <119aab440912230701g6656be6fsdaf5383d2ff02363@mail.gmail.com>
	 <20091223161504.GA13299@hiauly1.hia.nrc.ca>
	 <20091223164828.GA13631@hiauly1.hia.nrc.ca>
	 <20091223203956.GA14732@hiauly1.hia.nrc.ca>
	 <119aab440912231245u5f1b88d3j54e11ad6a6e8953c@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc@vger.kernel.org
To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab440912231245u5f1b88d3j54e11ad6a6e8953c@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, Dec 23, 2009 at 3:45 PM, Carlos O'Donell
<carlos@systemhalted.org> wrote:
> On Wed, Dec 23, 2009 at 3:39 PM, John David Anglin
> <dave@hiauly1.hia.nrc.ca> wrote:
>> The deadlock occurs at the third call to Tcl_MutexLock in NotifierTh=
readProc
>> (tclUnixNotfy.c:997). =A0This is in a while(1) loop, so I have to th=
ink
>> the previous call to Tcl_MutexUnlock failed, possibly because of a c=
all
>> to Tcl_ConditionNotify.
>
> You might get a better idea if you run this under strace and look at
> the futex syscalls being made. You won't see the locks since the fast
> path is through the light-weight-syscall compare-and-swap, but you
> will see the unlocks, and you can count them.

Sorry, let me be clearer here. The *first* lock is through the fast
path of the lws CAS operation. All subsequent locks take the form of a
futex wait. All subsequent unlocks are a futex wake.

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
