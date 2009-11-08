From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: gcj port to hppa...
Date: Sun, 8 Nov 2009 13:59:47 -0500
Message-ID: <119aab440911081059q435ca194va5f4df4e56c2033d@mail.gmail.com>
References: <119aab440911081045j32cf37base2aa9d08f713effc@mail.gmail.com>
	 <20091108185835.17A394FC6@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc@vger.kernel.org, debian-hppa@lists.debian.org,
	dave.anglin@nrc-cnrc.gc.ca
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20091108185835.17A394FC6@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, Nov 8, 2009 at 1:58 PM, John David Anglin
<dave@hiauly1.hia.nrc.ca> wrote:
>> On Sun, Nov 8, 2009 at 1:40 PM, John David Anglin
>> <dave@hiauly1.hia.nrc.ca> wrote:
>> >> The gcj port to hppa uses a locking implementation
>> >> (libjava/sysdeps/pa/locks.h) which is not signal safe.
>> >
>> > Yes. =3DA0Is this the gcj problem that you were seeing with nptl?
>>
>> No it is not, but I noticed this during my investigations. I might a=
s
>> well fix it while I'm poking about.
>
> There's similar code in libstdc++.

Where? I'll fix that case too.

BTW, the gcj problem looks like a missing _STACK_GROWS_UP case in boehm=
-gc.

>> Oh, that's a perefect idea, I wasn't sure that libjava could make us=
e
>> of those atomic builtins.
>>
>> Doesn't this restrict the gcc version you can use to rebuild libjava=
?
>> Is that OK?
>
> In my opinion, yes.

Is that OK?

>> >> Does locks.h also need to work for HPUX?
>> >
>> > Yes.
>>
>> OK, how do I write conditional code for HPUX vs. Linux?
>
> Check __linux and/or __hpux. =A0Look at the arm code. =A0It looks
> like they have done this. =A0So, you should just be able to copy
> what they have done.

Thanks.

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
