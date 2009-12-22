From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: futex wait failure
Date: Tue, 22 Dec 2009 15:30:59 -0500
Message-ID: <119aab440912221230x1011a218sec9c5a1a07e85800@mail.gmail.com>
References: <20091222164810.DBF3B516F@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc@vger.kernel.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20091222164810.DBF3B516F@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Dec 22, 2009 at 11:48 AM, John David Anglin
<dave@hiauly1.hia.nrc.ca> wrote:
> Debian gdb 7.0 provides slightly different backtraces:
>
> (gdb) bt
> #0 =A00x4039934c in __lll_lock_wait (futex=3D0x1c538,
> =A0 =A0private=3D<value optimized out>)
> ...
>
> and
>
> (gdb) bt
> #0 =A00x4038f92c in __lll_mutex_lock (mutex=3D0x1c538)

Any idea why both threads would try to lock the same mutex? This is
never going to work?

I think we need to step back from the edge and ask ourselves what
Tcl_WaitForEvent() is trying to do with the locks.

Do you know?

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
