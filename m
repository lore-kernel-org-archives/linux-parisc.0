From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: tst-cputimer1 and tst-timer4
Date: Mon, 4 Jul 2011 12:09:37 -0400
Message-ID: <CADZpyiw1O=AYJ1Y+fNDRSnPpdxzPDir-rPaWOiVF_jPPy=nxww@mail.gmail.com>
References: <CADZpyizeDz0mRxLU3-Scx37DZ4jYMtKBjQn6_ZfxMyjhsT6Lkg@mail.gmail.com>
	<BLU0-SMTP9158F203DF2B6A1AD1D9A4975D0@phx.gbl>
	<CADZpyiwjD2kMPoh9rm1KL_+mYm72nPz8ERHcSuHODkD31qncuQ@mail.gmail.com>
	<CADZpyiwDx-6oHNaCXoVC_XWpeUuZ3_n5RLzdmZK0Aoeh0ra3tw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc <linux-parisc@vger.kernel.org>,
	John David Anglin <dave.anglin@nrc.ca>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <CADZpyiwDx-6oHNaCXoVC_XWpeUuZ3_n5RLzdmZK0Aoeh0ra3tw@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Jul 4, 2011 at 11:26 AM, Carlos O'Donell
<carlos@systemhalted.org> wrote:
> On Mon, Jul 4, 2011 at 11:21 AM, Carlos O'Donell
> <carlos@systemhalted.org> wrote:
>> pthread_create: ALLOCATE_STACK failed.
>>
>> timer_helper_thread: pthread_create ret 22
>> ~~~
>>
>> The second threads stack fails to allocate.
>
> 1309792564.144002 set_robust_list(0x4000b4f0, 0xc) =3D 0
> 1309792564.144002 rt_sigtimedwait([RTMIN], {si_signo=3DSIGRTMIN,
> si_code=3DSI_TIMER, si_pid=3D4, si_uid=3D0, si_value=3D{int=3D90456,
> ptr=3D0x16158}}, NULL, 8) =3D 37
> 1309792564.368004 write(1, "timer_helper_thread: creating th"..., 40)=
 =3D 40
> 1309792564.368004 write(1, "\n", 1) =A0 =A0 =3D 1
> 1309792564.368004 mmap(NULL, 8388608, PROT_READ|PROT_WRITE|PROT_EXEC,
> MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) =3D 0x41349000
> 1309792564.368004 mprotect(0x41b47000, 4096, PROT_NONE) =3D 0
> 1309792564.368004 write(1, "do_clone: ARCH_CLONE...\n", 24) =3D 24
> 1309792564.368004 write(1, "\n", 1) =A0 =A0 =3D 1
> 1309792564.372004 clone(child_stack=3D0x41349040,
> flags=3DCLONE_VM|CLONE_FS|CLONE_FILES|CLONE_SIGHAND|CLONE_THREAD|CLON=
E_SYSVSEM|CLONE_SETTLS|CLONE_PARENT_SETTID|CLONE_CHILD_CLEARTID,
> parent_tidptr=3D0x41b484e8, tls=3D0x41b48900, child_tidptr=3D0x41b484=
e8) =3D
> 21795
> 1309792564.372004 write(1, "timer_helper_thread: pthread_cre"..., 42)=
 =3D 42
> 1309792564.372004 rt_sigtimedwait([RTMIN], {si_signo=3DSIGRTMIN,
> si_code=3DSI_TIMER, si_pid=3D5, si_uid=3D0, si_value=3D{int=3D90520,
> ptr=3D0x16198}}, NULL, 8) =3D 37
> 1309792564.476005 write(1, "timer_helper_thread: creating th"..., 40)=
 =3D 40
> 1309792564.476005 write(1, "\n", 1) =A0 =A0 =3D 1
> 1309792564.480005 mprotect(0x41b47480, 4096,
> PROT_READ|PROT_WRITE|PROT_EXEC) =3D -1 EINVAL (Invalid argument)
> 1309792564.480005 munmap(0x41349000, 8388608) =3D 0
> 1309792564.480005 write(1, "pthread_create: ALLOCATE_STACK f"..., 39)=
 =3D 39
>
> Why would this mprotect fail with -EINVAL? It's not page aligned?
>
> You can see the earlier mmap/mprotect from thread one's stack looks
> page aligned.
>
> I'll look into this.

Alright, the documetnation for mprotect definately says "addr must be
aligned to a page boundary."

And matches the return failure:
"EINVAL addr is not a valid pointer, or not a multiple of the system pa=
ge size."

So it would seem that this just works in the _S_G_D case because of
the way addresses line up.

I'm instrumenting the stack allocation code and guard setup to see if
I missed anything.

This part of glibc has been heavily patched by me to enable _S_G_U,
and it's probably the ugliest part of the thread startup code.

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
