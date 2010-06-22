From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: vfork test case.
Date: Tue, 22 Jun 2010 14:34:31 -0400
Message-ID: <AANLkTimN025LJidxvbeHRApq2_0F6N1ir_dZoYBGSl3h@mail.gmail.com>
References: <AANLkTilfnhsd5mWmO_qJeCv0XmZ6IYKw6Il19No3_wnF@mail.gmail.com>
	<20100622162651.E4CA1505C@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: dave.anglin@nrc-cnrc.gc.ca, linux-parisc@vger.kernel.org,
	kyle@mcmartin.ca, James.Bottomley@hansenpartnership.com
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100622162651.E4CA1505C@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Jun 22, 2010 at 12:26 PM, John David Anglin
<dave@hiauly1.hia.nrc.ca> wrote:
>> vfork ->
>> =A0 vfork syscall (pt-vfork.S)
>>
>> This has not changed in 2.11.1.
>
> I just assumed that a change must have occurred because of the behavi=
or
> of pex_unix_exec_child in libiberty/pex-unix.c. =A0I didn't investiga=
te
> history.

Thank you, I don't expect anything has changed, but even if it hasn't
there is still a bug in glibc.

> Yes. =A0Actually, pex_unix_exec_child may call dup2 and close as well=
=2E
> In my gdb build, the parent's return address in the frame is clobbere=
d
> resulting in pex_child_error being called by the parent.

Technically POSIX says it can't call dup2/close, but under Linux the
vfork implementation duplicates file descriptors and therefore
dup2/close are OK to use before execve.

The important part is that vfork *must not* create a frame in the
parent that the child unwinds.

> I looked at the hpux implementation and it doesn't create a frame.
> Of course, the vfork syscall then must not clobber the return address=
,
> etc.

Yes, the vfork syscall *must not* clobber r2, without a stack we have
nowhere to save it. I'm pretty sure the kernel preserves r2 across a
vfork. The next step is to verify that :-)

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
