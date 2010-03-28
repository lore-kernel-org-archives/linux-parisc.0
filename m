From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: Question about execve.
Date: Sun, 28 Mar 2010 16:39:22 -0400
Message-ID: <119aab441003281339p184be3d3x167b7a7684af98d8@mail.gmail.com>
References: <119aab441003281240m6be2cedeh3b8ce77d39d095be@mail.gmail.com>
	 <20100328202239.162785145@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: dave.anglin@nrc-cnrc.gc.ca, deller@gmx.de, kyle@mcmartin.ca,
	linux-parisc@vger.kernel.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100328202239.162785145@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, Mar 28, 2010 at 4:22 PM, John David Anglin
<dave@hiauly1.hia.nrc.ca> wrote:
>> Does this mean that we need to either (a) fix the kernel to stop
>> clobbering r19 and r21 or fix userspace?
>
> r21 is an syscall argument register and it looks like CLOB_ARGS_*
> handles it. =A0So, I doubt we need to worry about about r21.

Right.

>> I'm inclined to think the kernel is wrong, and lazy here, and pt_reg=
s
>> should have another PT_GR2_CHILD and PT_GR30_CHILD entries for the
>> case above.
>
> Fixing the kernel will fix broken userspace code. =A0Fixing glibc to
> save and restore r19 in non-PIC code will allow new code to work
> with broken kernels. =A0Thus, I tend to think both should be fixed.

Agreed, I'll get a fix for this into glibc.

> Instead of using PT_GR19 and PT_GR21, can't we use PT_SR4 and PT_SR5
> to store r2 and r30 for the child. =A0We don't seem to ever actually
> save sr4 or sr5 in the syscall path and we restore fixed values.
> This is a hack, but avoids increasing the size of the task structure.

I don't like hacks like this. They are confusing and hard to maintain.

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
