From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: Stuck gnat1 processes
Date: Thu, 9 Jun 2011 22:21:34 -0400
Message-ID: <BANLkTim57hUshC5Uaeojn9nzCxy23UE=Xg@mail.gmail.com>
References: <20110610013034.GA5353@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc@vger.kernel.org
To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20110610013034.GA5353@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, Jun 9, 2011 at 9:30 PM, John David Anglin
<dave@hiauly1.hia.nrc.ca> wrote:
> Here is another wierd bug -- four gnat1 process stuck at exactly the
> same location making zero forward progress. =A0I have seen this a num=
ber
> of times, so I thought it would be useful to report.
>
> As far as I can tell, all are stuck in the kernel. =A0Gdb can't step
> the code, nor do breaks on the next instruction ever get hit. =A0This
> may have something to do with the fact that the instruction is trying
> to read from text (C switch statement).
>
> This is with 2.6.39.1 with James' last two, but I have also seen this
> without the patches. =A0Machine is rp3440.

This looks like a combination of multiple bugs, the process is
probably dead, or not running, which is why gdb can't do anything with
it. I'm surprised the ptrace API isn't returning some more diagnostics
about the stuck process.

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
