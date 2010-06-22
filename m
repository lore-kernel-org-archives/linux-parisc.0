From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: vfork test case.
Date: Tue, 22 Jun 2010 11:17:44 -0400
Message-ID: <AANLkTilfnhsd5mWmO_qJeCv0XmZ6IYKw6Il19No3_wnF@mail.gmail.com>
References: <119aab440912061319y5b863203ve5dc3dc568a6ccec@mail.gmail.com>
	<20100620042814.ECC205160@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: dave.anglin@nrc-cnrc.gc.ca, linux-parisc@vger.kernel.org,
	kyle@mcmartin.ca, James.Bottomley@hansenpartnership.com
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100620042814.ECC205160@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, Jun 20, 2010 at 12:28 AM, John David Anglin
<dave@hiauly1.hia.nrc.ca> wrote:
> Carlos,
>
>> I have constructed a vfork test case which shows some of the problem=
s
>> I have using vfork reliably. This fails every time on my PA8700 syst=
em
>> running 2.6.32-rc6. It appears as though r28 (ret0) in the parent is
>> being corrupted.
>
> It seems the vfork implementation has changed in 2.11.1 from
> using clone to the vfork syscall. =A0I tried to build gdb head
> today, but it dies at startup due to a problem with vfork. =A0This
> is potentially also an issue with gcc as it uses the same
> libiberty code.

On hppa calling vfork in a non-multithreaded environment does the follo=
wing:

vfork [vfork.c] ->
  __fork (__libc_fork) [nptl/fork.c, linux/fork.c] ->
    ARCH_FORK (clone syscall) []

On hppa in a multithreaded environment (linked against libpthread.so)
vfork does the following:

vfork ->
  vfork syscall (pt-vfork.S)

This has not changed in 2.11.1.

Could you please elaborate on the change that you believe occurred in 2=
=2E11.1?

> I filed a sourceware bug, but closed it when I realized that
> this is a glibc/kernel bug:
> http://sourceware.org/bugzilla/show_bug.cgi?id=3D11730
>
> After spending some time looking at this, I realized that __vfork
> is broken. =A0It should not allocate a frame as the child may clobber
> the parent's frame when it does a call, etc. =A0A frame should only
> be allocated and popped around the call to the syscall error handler.

Oh dear, yes I see. After the child returns from vfork, it calls exec,
clobbering the vfork frame that the parent must still unwind from. Is
that what you mean?

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
