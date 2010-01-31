From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: Questions about hppa *context functions.
Date: Sun, 31 Jan 2010 18:47:24 -0500
Message-ID: <119aab441001311547o7d605b1dqab7908d0d3077ddc@mail.gmail.com>
References: <119aab441001310825x6fa7254u85c00dc1b0588950@mail.gmail.com>
	 <119aab441001311215p6c13d7a7tcee4747393b1efbe@mail.gmail.com>
	 <4B65EC6F.9020205@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc <linux-parisc@vger.kernel.org>,
	libc-ports@sourceware.org
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4B65EC6F.9020205@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, Jan 31, 2010 at 3:47 PM, Helge Deller <deller@gmx.de> wrote:
> Carlos,
>
> thanks a lot for your work!
>
> First of all, if it works, I'm fine with it.
>
> One minor question:
> I'm used to test sizeof long instead of sizeof int to check for 32/64=
bit.
> You changed it to "(sizeof(unsigned int) =3D=3D 8)".
> I always thought a long is usually the type of a register, while an i=
nt can
> be anything.

You are correct, this code is wrong. Since hppa64 is LP64, and hppa32
is ILP32, the only way to tell the difference between the two is by
using "sizeof(unsigned long)" or "sizeof(void *)", the two types which
differ between the ABIs.

>> 1. Why limit the number of input arguments to 8?
>
> I didn't had real reasons.
> At some point I read that software usually should not rely on the fac=
t that
> the
> *context funtions =A0can handle more than 4 arguments. To be on the s=
afe side,
> software
> should better hand over a pointer to a struct in one of the first 4
> arguments.
> But with your patch, which extends it for parisc to more than 8 argum=
ents,
> it's even better :-)

OK, perfect, the new implementation should handle as many arguments as
you have stack space.

>> 2. It doesn't appear that the current implementation transfers
>> ucp->uc_stack.ss_sp to the stack pointer when makecontext() is calle=
d.
>
> You seem to have fixed this in your patch.

Yes, I did fix this, I was just curious if you considered this in the
initial implementation?

>> 3. POSIX says that all the arguments must be of type int, but in a
>> comment you write "XXX: This implementation only handles integer
>> arguments."
>> Is there any reason this comment should stay there?
>
> Yep. Just drop it.

Thanks.

> Again, I didn't tested you patch, but just by looking at it, it seems=
 OK.

Thanks.

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
