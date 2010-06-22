From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: vfork test case.
Date: Tue, 22 Jun 2010 15:53:35 -0400
Message-ID: <AANLkTinhRqCVK3NlPvqH4XfQiq_jnz3dWfp4k_vK1Eqf@mail.gmail.com>
References: <AANLkTimN025LJidxvbeHRApq2_0F6N1ir_dZoYBGSl3h@mail.gmail.com>
	<20100622184419.CCF1C5057@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: dave.anglin@nrc-cnrc.gc.ca, linux-parisc@vger.kernel.org,
	kyle@mcmartin.ca, James.Bottomley@hansenpartnership.com
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100622184419.CCF1C5057@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Jun 22, 2010 at 2:44 PM, John David Anglin
<dave@hiauly1.hia.nrc.ca> wrote:
>> > I looked at the hpux implementation and it doesn't create a frame.
>> > Of course, the vfork syscall then must not clobber the return addr=
ess,
>> > etc.
>>
>> Yes, the vfork syscall *must not* clobber r2, without a stack we hav=
e
>> nowhere to save it. I'm pretty sure the kernel preserves r2 across a
>> vfork. The next step is to verify that :-)
>
> Actually, it's ok to save it in the __fork caller's frame at the stan=
dard
> location. =A0r2 is always saved there by the callee. =A0The argument =
slots for
> r26 thru r23 and the PIC register slot also can be used.

I disagree with you.

What about this scenario:
* Parent call vfork, saves rp in -20(%sp) (parents frame)
* Parent suspends upon entry to vfork syscall
* Child returns from vfork syscall
* Child restores rp from -20(%sp) (parents frame)
* Child calls close which saves rp in -20(%sp) (parents frame)
* Child calls execve
* Parent resumes, restores rp from -20(%sp) and incorrectly returns to
just after the call to close.

At this point if the parent restores rp from the parents frame it will
get the rp the child's call to close saved.

The only way to get around this is to *ensure* the kernel
saves/restores r2 across the syscall.

I see no other way around it.

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
