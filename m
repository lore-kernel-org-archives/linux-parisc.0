From: Carlos O'Donell <carlos@systemhalted.org>
Subject: Re: Thread stack allocation
Date: Mon, 10 Sep 2012 11:13:51 -0400
Message-ID: <504E03AF.2070204@systemhalted.org>
References: <BLU0-SMTP405E1823EA93DF4FBFC1797AD0@phx.gbl> <BLU0-SMTP91500D9B875298D4CD828597AD0@phx.gbl> <BLU0-SMTP297D308BBF8A72A121C16397AD0@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: Parisc List <linux-parisc@vger.kernel.org>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU0-SMTP297D308BBF8A72A121C16397AD0@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 9/9/2012 6:24 PM, John David Anglin wrote:
> On 9-Sep-12, at 4:23 PM, John David Anglin wrote:
> 
>> It seems to me this must be a kernel bug:
> 
> Nope, it's a problem with guard page allocation in openjdk.
> It assumes stack grows down.

Yes, that's wrong :-)

If you allocate your own stacks then glibc can't setup guard
pages for you since it violates some POSIX constraints.

For avoidance of doubt you *can* get a thread with PTHREAD_STACK_MIN
as the stack size if:

(a) RLIMIT_STACK is a useful value e.g. != infinity

... but ....

(b) RLIMIT_STACK < PTHREAD_STACK_MIN

.... then ....

We allocate PTHREAD_STACK_MIN by default which might not be enough
space for what you need.

I'm actually working heavily on a BZ for glibc that would split up
the accounting of stack space and other incidentals to avoid grouping
them. For example if you had a lot of TLS variables they could actually
consume your stack and that's wrong.

http://sourceware.org/bugzilla/show_bug.cgi?id=11787

Cheers,
Carlos.

