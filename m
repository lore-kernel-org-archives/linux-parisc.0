From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: Question about execve.
Date: Sun, 28 Mar 2010 17:04:39 -0400
Message-ID: <119aab441003281404y7bc37dddw14db435b85704b4f@mail.gmail.com>
References: <119aab441003281339p184be3d3x167b7a7684af98d8@mail.gmail.com>
	 <20100328210134.3D6005145@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: dave.anglin@nrc-cnrc.gc.ca, deller@gmx.de, kyle@mcmartin.ca,
	linux-parisc@vger.kernel.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100328210134.3D6005145@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, Mar 28, 2010 at 5:01 PM, John David Anglin
<dave@hiauly1.hia.nrc.ca> wrote:
>> > Instead of using PT_GR19 and PT_GR21, can't we use PT_SR4 and PT_S=
R5
>> > to store r2 and r30 for the child. =A0We don't seem to ever actual=
ly
>> > save sr4 or sr5 in the syscall path and we restore fixed values.
>> > This is a hack, but avoids increasing the size of the task structu=
re.
>>
>> I don't like hacks like this. They are confusing and hard to maintai=
n.
>
> However, it says in ptrace.h:
>
> =A0* N.B. gdb/strace care about the size and offsets within this
> =A0* structure. If you change things, you may break object compatibil=
ity
> =A0* for those applications.
>
> There is one free slot in pt_regs:
>
> =A0 =A0 =A0 =A0unsigned long pad0; =A0 =A0 /* available for other use=
s */
>
> Given that this struct leaks to userspace, I don't think we should
> mess with it.

Maybe. I would certainly test this out before adding new entries.

If I provide you with a new glibc with the r19 fix would you be able
to test it out?

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
