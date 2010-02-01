From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: futex wait failure
Date: Mon, 1 Feb 2010 16:36:22 -0500
Message-ID: <119aab441002011336u676bdef4oaf3b891a94916949@mail.gmail.com>
References: <4B67252A.2000501@gmx.de>
	 <20100201191141.EE51F4EA9@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: Helge Deller <deller@gmx.de>, dave.anglin@nrc-cnrc.gc.ca,
	linux-parisc@vger.kernel.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100201191141.EE51F4EA9@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Feb 1, 2010 at 2:11 PM, John David Anglin
<dave@hiauly1.hia.nrc.ca> wrote:
>>
>> No, sadly it didn't fixed it.
>
> I tend to think clone/fork syscalls need to be guarded to ensure a st=
able
> configuration while the syscall executes. =A0It may be the problem ar=
ises
> because we use clone for fork. =A0Do any other targets do this?

All targets call nptl/sysdeps/unix/sysv/linux/fork.c, which calls
ARCH_FORK, which is implemented using clone() for *all* targets.

In fact, owing to the POSIX atfork requirements, it's very difficult
to implement fork properly without using Linux clone.

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
