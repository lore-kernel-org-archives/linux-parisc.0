From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: sys_accept4, SOCK_CLOEXEC, misc, bonghits, and others...
Date: Mon, 1 Feb 2010 09:11:23 -0500
Message-ID: <119aab441002010611y8977762k3ce0a827b503d3f8@mail.gmail.com>
References: <20091226182050.GH11593@bombadil.infradead.org>
	 <20100201135427.GA24051@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
To: Kyle McMartin <kyle@mcmartin.ca>,
	linux-parisc <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100201135427.GA24051@bombadil.infradead.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Feb 1, 2010 at 8:54 AM, Kyle McMartin <kyle@mcmartin.ca> wrote:
> ping?

Thanks for the ping.

> On Sat, Dec 26, 2009 at 01:20:50PM -0500, Kyle McMartin wrote:
>> So I wired up sys_accept4 over lunch today... it works ok in general=
,
>> and takes arguments such that it doesn't need a wrapper (yay.)
>>
>> Problem. O_CLOEXEC is special on parisc because of the HPUX gunk whi=
ch
>> makes everything miserable. The value in glibc is one bit off the va=
lue
>> in the kernel, and kaboom. No worky syscall.
>>
>> Carlos, patch included below, tested with test_accept4.c, from Ulric=
h's
>> commit adding this syscall, modified (fixed) version of the test cas=
e
>> is attached to this email unless I'm a muppet and forgot.
>>
>> Happy hacking^WHolidays, Kyle
>>
>> diff --git a/ChangeLog.hppa b/ChangeLog.hppa
>> index 24a152e..4ce4cc7 100644
>> --- a/ChangeLog.hppa
>> +++ b/ChangeLog.hppa
>> @@ -1,3 +1,7 @@
>> +2009-12-26 =A0Kyle McMartin =A0 <kyle@redhat.com>
>> + =A0 =A0 * sysdeps/unix/sysv/linux/hppa/bits/socket.h: Fix value of
>> + =A0 =A0 SOCK_CLOEXEC to match O_CLOEXEC.
>> +
>> =A02009-11-25 =A0Carlos O'Donell =A0<carlos@codesourcery.com>
>>
>> =A0 =A0 =A0 * sysdeps/unix/sysv/linux/hppa/nptl/bits/pthreadtypes.h:
>> diff --git a/sysdeps/unix/sysv/linux/hppa/bits/socket.h b/sysdeps/un=
ix/sysv/linux/hppa/bits/socket.h
>> index ac6e81b..d552d85 100644
>> --- a/sysdeps/unix/sysv/linux/hppa/bits/socket.h
>> +++ b/sysdeps/unix/sysv/linux/hppa/bits/socket.h
>> @@ -62,7 +62,7 @@ enum __socket_type
>> =A0 =A0/* Flags to be ORed into the type parameter of socket and soc=
ketpair and
>> =A0 =A0 =A0 used for the flags parameter of paccept. =A0*/
>>
>> - =A0SOCK_CLOEXEC =3D 02000000, =A0 /* Atomically set close-on-exec =
flag for the
>> + =A0SOCK_CLOEXEC =3D 01000000, =A0 /* Atomically set close-on-exec =
flag for the
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0n=
ew descriptor(s). =A0*/
>> =A0#define SOCK_CLOEXEC SOCK_CLOEXEC
>> =A0#undef SOCK_NONBLOCK

IIUC SOCK_CLOEXEC only works in 2.6.27 or higher with accept4?

In which case, since accept4 has never existed before, it's OK to
change this value?

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
