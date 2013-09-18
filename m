From: Helge Deller <deller@gmx.de>
Subject: Re: systemd real-time signals choices clash with Linux/PARISC available
 SIGRT range, WAS: fanotify_mark()
Date: Wed, 18 Sep 2013 20:40:18 +0200
Message-ID: <5239F392.60901@gmx.de>
References: <20130813154958.7514d525@marga.jer-c2.orkz.net> <520AA546.2070503@gmx.de> <20130814005400.3766f068@marga.jer-c2.orkz.net> <20130826014657.05f4c466@marga.jer-c2.orkz.net> <521BC84B.4090602@gmx.de> <BLU0-SMTP101B187CC9D02E87059A7C297490@phx.gbl> <20130827164601.4accbbfb@marga.jer-c2.orkz.net> <521CC531.6020106@bell.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: Jeroen Roovers <jer@gentoo.org>, linux-parisc@vger.kernel.org
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <521CC531.6020106@bell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 08/27/2013 05:26 PM, John David Anglin wrote:
> On 8/27/2013 10:46 AM, Jeroen Roovers wrote:
>> On Mon, 26 Aug 2013 18:37:54 -0400 John David Anglin
>> <dave.anglin@bell.net> wrote:
>> 
>>> On 26-Aug-13, at 5:27 PM, Helge Deller wrote:
>>>>> [1] Sneak preview:
>>>>> https://bugs.gentoo.org/show_bug.cgi?id=482214
>>>> Did you already filed this signal-problem upstream as suggested
>>>> in comment #3
>>>> (https://bugs.gentoo.org/show_bug.cgi?id=482214#c3)?
>> Well, there are two ways to resolve this problem, and seeing who
>> is developing systemd and seeing the generous way the "available"
>> signal range is used, I'm pretty doubtful about changes there.

I can see why they wouldn't like to change this again.
It might break systemd binaries on other existing arches which already 
support systemd.

Anyway, has there been any further upstream discussion?

>> As I said in comment #2, that range could be compacted (a lot) and
>> then fit easily on any future platform. Since it was a design
>> choice even reflected in man pages[1] ("[...], SIGRTMIN+29   Sets
>> the log level to [...]"), I'm very afraid they will not change it
>> easily.
>> 
>>> I believe two of the signal numbers come from HP-UX.
>> #define SIGXCPU         33 #define SIGXFSZ         34
> The signal numbers for these two signals come from HP-UX but the
> signals are used by Linux, so I can't see how they can change.
>> #define SIGSTKFLT       36
>> 
>> According to [2], SIGSTKFLT isn't used.
> This signal isn't used by HP-UX but it is used by Linux, so again
> this can't change.

changing those would break our binary compatibility...
 
> Can we change _NSIG to 69 so there are 32 RT signals as on other
> arches? [Dave followup]: It looks like it needs to be a power of 2.
> MIPS uses 128.

127 seems to be the better choice then... (signal #128 seems to conflict with
the core dump bit)

So, how should we proceed here?
If I haven't overlooked something, it seems that changing the parisc kernel
 & glibc is possible.
Downside is, that people of course need newer kernel/glibc and at least 
systemd recompiled.
Another downside is that we add more overhead in the signal paths, but I'm not
sure if this really hurts performance (is signal handling performance-relevant
at all?).

I can come up with a kernel/glibc patch (which seem to be trivial) if we agree 
to really go that way...

Helge

>> [1] http://www.freedesktop.org/software/systemd/man/systemd.html 
>> [2]
>> http://h21007.www2.hp.com/portal/download/files/unprot/STK/Linux_STK/impacts/i60.html
