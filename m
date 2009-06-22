From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: HPPA linux compat wrappers
Date: Mon, 22 Jun 2009 08:05:11 -0400
Message-ID: <119aab440906220505l26bda054r4280165627332473@mail.gmail.com>
References: <Pine.LNX.4.62.0906221117370.2390@sci.felk.cvut.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: debian-hppa@lists.debian.org, linux-parisc@vger.kernel.org
To: Petr Salinger <Petr.Salinger@seznam.cz>
Return-path: <bounce-debian-hppa=debian-hppa=m.gmane.org@lists.debian.org>
In-Reply-To: <Pine.LNX.4.62.0906221117370.2390@sci.felk.cvut.cz>
Resent-Message-ID: <5NELBav06uC.A.YzG.FO3PKB@liszt>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>

On Mon, Jun 22, 2009 at 6:51 AM, Petr Salinger<Petr.Salinger@seznam.cz> wro=
te:
>> However, the usability testing in a chroot + vnc is showing that some
>> applications are segfaulting. I've been looking into this today.
>
> I still think there should be support for mixed ABI calls.
> See also thread http://lists.debian.org/debian-hppa/2008/09/msg00018.html

It sounds like a good feature, but my time is restricted so I
implemented the simplest interface possible that I could prove worked.
If you have ample free time I suggest you post a version of the patch
with your enhancements. I'd be more than willing to test your patches.

> The question is why have been sizeof(pthread_cond_t)
> expanded from 48 bytes under linuxthreads into
> 64 bytes under NPTL. I do not see a reson for it.
> IMHO, it might significantly break compatibility.

This is technically a mistake, the new NPTL structure should be 48
bytes as well. I'll fix that in my sources.

However, it doesn't break compatibility in the current patches, only
in your scheme of mixed ABI support.

> The current NPTL implementation zeroes all the fields at the begining,
> doesn't it ?

Which implementation? The compat code? No, it uses the ldcw spinlock
to protect structure accesses.

> So at the begin of each affected function will be (asm coded ?)
>
> =A0if (v->__lt_compat)
> =A0{
> =A0 =A0 lock_global_pt_lock();
> =A0 =A0 if (v->__lt_compat)
> =A0 =A0 {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0zero_all_but_lt_compat_field();
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0barrier();
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0v->__lt_compat =3D 0;
> =A0 =A0 };
> =A0 =A0 unlock_global_pt_lock();
> =A0};
>
> For the new NPTL layout the zeroing code will not be taken,
> therefore almost no overhead.
> There might be a congestion on global_pt_lock, but I do not believe,
> there are many static initilized mutexes in any real program.
> There will be no need for allocation any new structures.

There are tons of statically initialized mutexs, gnome and gdk are
full of them as an example.

> The drawback is hppa specific pthread.h or need to convince Uli
> to add unused zeroed field into affected structures globally.

That is no longer a drawback, most machines these days need to copy
core header files and modify.

Cheers,
Carlos.
