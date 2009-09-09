From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: Segfault in __c_f_f_c during strace of nptl application.
Date: Wed, 9 Sep 2009 11:24:43 -0400
Message-ID: <119aab440909090824n55dff67sb32c0d3468a19d25@mail.gmail.com>
References: <119aab440909090739s1f7af068s65bb4d389b626a4d@mail.gmail.com>
	 <20090909151650.551584FC6@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: dave.anglin@nrc-cnrc.gc.ca, linux-parisc@vger.kernel.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090909151650.551584FC6@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, Sep 9, 2009 at 11:16 AM, John David
Anglin<dave@hiauly1.hia.nrc.ca> wrote:
>> The workaround is to cast both long. I tested this and it works. I'll
>> submit this to debian as the fix.
>
> This is simplest fix.

Yes, it would appear that strace/gdb (applications that ptrace
addresses from another process) are most likely applications to suffer
from this problem, and it may be easier to work around the problem
there instead of in the compiler.

Cheers,
Carlos.
