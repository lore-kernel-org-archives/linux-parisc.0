From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: futex wait failure
Date: Fri, 29 Jan 2010 12:53:44 -0500
Message-ID: <119aab441001290953r74009887x7be7173bfad95d1e@mail.gmail.com>
References: <20100108163756.48BDE5183@hiauly1.hia.nrc.ca>
	 <4B47A130.8060603@gmx.de>
	 <119aab441001081344j38000314p1931df34149eabd3@mail.gmail.com>
	 <4B524912.4070204@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
	dave.anglin@nrc-cnrc.gc.ca, linux-parisc@vger.kernel.org
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4B524912.4070204@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, Jan 16, 2010 at 6:17 PM, Helge Deller <deller@gmx.de> wrote:
> This coding seems to indicate that we call _exit(), but we aren't (as
> you see above in the strace).
> So I'm wondering if the "bl _exit,%rp" needs changing.
> Something with HIDDEN_JUMPTARGET(_exit) or similar, so that
> _exit() instead of exit() is called?
>
> Actually I did tested this with the minifail test program, and change=
d
> thread_run() to call _exit(0) at the end instead of "return 0":
> void* thread_run(void* arg) {
> =A0 =A0 =A0 =A0...
> /* =A0 =A0 =A0return (void *)&status; =A0*/
> =A0 =A0 =A0 =A0_exit(0);
> }
> With strace I then suddenly got exit_group() which seems more correct=
:
> [pid =A01910] write(1, "Thread OK.\n", 11) =3D 11
> [pid =A01910] exit_group(0) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =3D ?

I agree with this analysis. I'm testing a change which uses
HIDDEN_JUMPTARGET(). I will tell you how it goes.

Calling exit_group is important for threads.

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
