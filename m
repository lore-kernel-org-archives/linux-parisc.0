From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: Incorrect execve_wrapper macro?
Date: Wed, 24 Mar 2010 08:49:21 -0400
Message-ID: <119aab441003240549n7adc8fa5q32762d9b71987bad@mail.gmail.com>
References: <119aab441003231503v345dfacar374e2c06b88769ac@mail.gmail.com>
	 <20100324004504.6020F4EF4@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc@vger.kernel.org, kyle@mcmartin.ca, deller@gmx.de
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100324004504.6020F4EF4@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Mar 23, 2010 at 8:45 PM, John David Anglin
<dave@hiauly1.hia.nrc.ca> wrote:
>> The execve_wrapper macro loads thread->task like this:
>> LDREG =A0 TI_TASK-THREAD_SZ_ALGN-FRAME_SIZE(%r30),%r1
>>
>> This assumes that at the point the macro is called that there is onl=
y
>> THREAD_SZ_ALGN+FRAME_SIZE between %r30 and the starting value of %r3=
0
>> (cr30).
>>
>> However, in the syscall entry path I see (syscall.S):
>> ldo =A0 =A0 THREAD_SZ_ALGN+FRAME_SIZE(%r30),%r30 =A0/* set up kernel=
 stack */
>> ...
>> STREGM =A0%r1,FRAME_SIZE(%r30) =A0 =A0 =A0 =A0 =A0 =A0/* save r1 (us=
p) here for now */
>>
>> Which means that between %r30 and the start there is actually
>> THREAD_SZ_ALGN+2*FRAME_SIZE.
>
> This is wrong as there is a compensating LDREGM:
>
> =A0 =A0 =A0 =A0LDREGM =A0-FRAME_SIZE(%r30), %r2 =A0 =A0 =A0 =A0 =A0/*=
 get users sp back */

Thanks, I missed the `M` and thought it was just loading from a negativ=
e offset.

>> or heaven forbid the easier to read:
>>
>> mfctl =A0 %cr30,%r1 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* g=
et task ptr in %r1 */
>> LDREG =A0 TI_TASK(%r1),%r1
>
> The above looks safer...

It is, but a little bit slower, does it matter?

This change would make execve_wrapper independent of r30's value.

I think for now I'll just document the requirement.

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
