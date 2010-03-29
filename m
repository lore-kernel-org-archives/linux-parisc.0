From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: CAS (lws_compare_and_swap32)
Date: Mon, 29 Mar 2010 15:31:55 -0400
Message-ID: <119aab441003291231j320e6637g87c201f75ee61faf@mail.gmail.com>
References: <4BB0B2C8.8000302@fsij.org>
	 <119aab441003290913x6cb925b9v66b44a14c31393cb@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: debian-hppa@lists.debian.org,
	linux-parisc <linux-parisc@vger.kernel.org>,
	Kyle McMartin <kyle@mcmartin.ca>, Helge Deller <deller@gmx.de>
To: NIIBE Yutaka <gniibe@fsij.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab441003290913x6cb925b9v66b44a14c31393cb@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Mar 29, 2010 at 12:13 PM, Carlos O'Donell
<carlos@systemhalted.org> wrote:
> 2010/3/29 NIIBE Yutaka <gniibe@fsij.org>:
>> I am currently investigating FTBFS of gauche (a scheme interpreter) =
on
>> hppa. =A0My knowledge of hppa is quite limited, though. =A0I am not =
on
>> this list. =A0Please send Cc: to me.
>>
>> I have a question of CAS implementation. =A0I assume uni processor
>> system.
>>
>> I am looking at:
>> =A0 =A0 =A0 =A0linux-source-2.6.30/arch/parisc/kernel/syscall.S
>>
>> ----------------
>> =A0 =A0 =A0 =A0/*
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0prev =3D *addr;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if ( prev =3D=3D old )
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*addr =3D new;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return prev;
>> =A0 =A0 =A0 =A0*/
>> [...]
>> cas_action:
>> [...]
>> =A0 =A0 =A0 =A0/* The load and store could fail */
>> 1: =A0 =A0 =A0ldw =A0 =A0 0(%sr3,%r26), %r28
>> =A0 =A0 =A0 =A0sub,<> =A0%r28, %r25, %r0
>> 2: =A0 =A0 =A0stw =A0 =A0 %r24, 0(%sr3,%r26)
>> ----------------
>>
>> Suppose that <addr> points to copy-on-write memory. =A0At the label =
2,
>> storing data to <addr> will invoke memory trap and it will go to
>> do_page_fault() to get new memory. =A0In this scenario, is there a
>> possibility for the process to be scheduled off?
>>
>> Call chain in question is:
>> =A0 =A0 =A0 =A0do_page_fault()
>> =A0 =A0 =A0 =A0 =A0->..-> do_wp_page()
>> =A0 =A0 =A0 =A0 =A0 =A0->..-> __alloc_pages_internal() with GFP_HIGH=
USER_MOVABLE
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0->..> schedule()
>>
>> linux/gfp.h has the definition:
>> #define GFP_HIGHUSER_MOVABLE =A0 =A0(__GFP_WAIT | __GFP_IO | __GFP_F=
S | \
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 __GF=
P_HARDWALL | __GFP_HIGHMEM | \
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 __GF=
P_MOVABLE)
>
> I wrote the LWS CAS implementation.
>
> At the time I wrote it I tried to verify that the process calling the
> CAS could never sleep, since this would make it non-atomic.
>
> There are checks in entry.S to prevent return code-paths from
> scheduling or delivering signals if the process was executing on the
> gateway page.
>
> If we are certain that the above could happen, then a possible soluti=
on is:
> * Enable locks for SMP and UP.
> * If lock is taken for your addresss, return to userspace with EAGAIN=
=2E
> * Userspace yields on EAGAIN and then tries again (we can't use
> FUTEX_WAIT/FUTEX_WAKE on a global process unique variable because LWS
> CAS is expected to work on shmem).
>
> Do we really think the above can happen?

I have CC'd the linux-parisc kernel list.

Kyle,

Do you think the above scenario is possible?

When trying to LWS CAS on a page that is COW, the copy process could
sleep, and thus CAS is non-atomic.

What do you think about the solution I propose?

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
