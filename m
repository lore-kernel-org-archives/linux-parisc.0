From: John David Anglin <dave.anglin@bell.net>
Subject: Re: systemd real-time signals choices clash with Linux/PARISC available
 SIGRT range, WAS: fanotify_mark()
Date: Tue, 27 Aug 2013 11:26:41 -0400
Message-ID: <521CC531.6020106@bell.net>
References: <20130813154958.7514d525@marga.jer-c2.orkz.net> <520AA546.2070503@gmx.de> <20130814005400.3766f068@marga.jer-c2.orkz.net> <20130826014657.05f4c466@marga.jer-c2.orkz.net> <521BC84B.4090602@gmx.de> <BLU0-SMTP101B187CC9D02E87059A7C297490@phx.gbl> <20130827164601.4accbbfb@marga.jer-c2.orkz.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: linux-parisc@vger.kernel.org, Helge Deller <deller@gmx.de>
To: Jeroen Roovers <jer@gentoo.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20130827164601.4accbbfb@marga.jer-c2.orkz.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 8/27/2013 10:46 AM, Jeroen Roovers wrote:
> On Mon, 26 Aug 2013 18:37:54 -0400
> John David Anglin <dave.anglin@bell.net> wrote:
>
>> On 26-Aug-13, at 5:27 PM, Helge Deller wrote:
>>>> [1] Sneak preview: https://bugs.gentoo.org/show_bug.cgi?id=482214
>>> Did you already filed this signal-problem upstream as suggested in
>>> comment #3 (https://bugs.gentoo.org/show_bug.cgi?id=482214#c3)?
> Well, there are two ways to resolve this problem, and seeing who is
> developing systemd and seeing the generous way the "available" signal
> range is used, I'm pretty doubtful about changes there.
>
> As I said in comment #2, that range could be compacted (a lot) and then
> fit easily on any future platform. Since it was a design choice even
> reflected in man pages[1] ("[...], SIGRTMIN+29   Sets the log level to
> [...]"), I'm very afraid they will not change it easily.
>
>> I believe two of the signal numbers come from HP-UX.
> #define SIGXCPU         33
> #define SIGXFSZ         34
The signal numbers for these two signals come from HP-UX but the signals 
are used
by Linux, so I can't see how they can change.
> #define SIGSTKFLT       36
>
> According to [2], SIGSTKFLT isn't used.
This signal isn't used by HP-UX but it is used by Linux, so again this 
can't change.

Can we change _NSIG to 69 so there are 32 RT signals as on other arches?

>
> Do we still support HP-UX? I have never seen a binary for it I could
> try with, but then maybe I never went looking for one, either. :)
Doesn't really matter...
>
>
>       jer
>
>
> [1] http://www.freedesktop.org/software/systemd/man/systemd.html
> [2]
> http://h21007.www2.hp.com/portal/download/files/unprot/STK/Linux_STK/impacts/i60.html
> --
> To unsubscribe from this list: send the line "unsubscribe linux-parisc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>


-- 
John David Anglin    dave.anglin@bell.net

