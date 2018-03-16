From: Matt Turner <mattst88@gmail.com>
Subject: Re: Re: C3600 kernel/64bit 4.* slow IO due to -mlong-calls
Date: Fri, 16 Mar 2018 10:29:13 -0700
Message-ID: <CAEdQ38Fr1yy6Q5a2jkcO_SUCYYh0URtW6CY=D0zxHp0K4W19eA@mail.gmail.com>
References: <CA+QBN9C=wHxV5Y=SSt2UB_4b1H_Nx1mZxZu3rvuTY2wRe=GWBw@mail.gmail.com>
 <d637ebd1-db27-585b-c324-0e02baf8c8b2@gmx.de> <113ad157-e8c3-81dc-5752-75416c8ce531@bell.net>
 <trinity-f7583046-4aa6-488a-a797-20501118a1c0-1521199558775@3c-app-gmx-bs75>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: John David Anglin <dave.anglin@bell.net>, debian-hppa@lists.debian.org,
	linux-parisc <linux-parisc@vger.kernel.org>
To: Helge Deller <deller@gmx.de>
Return-path: <bounce-debian-hppa=debian-hppa=m.gmane.org@lists.debian.org>
In-Reply-To: <trinity-f7583046-4aa6-488a-a797-20501118a1c0-1521199558775@3c-app-gmx-bs75>
Resent-Message-ID: <HtEL5WHwa8E.A.vzD.S8_qaB@bendel>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-URL: <https://lists.debian.org/debian-hppa/>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>
List-Archive: https://lists.debian.org/msgid-search/CAEdQ38Fr1yy6Q5a2jkcO_SUCYYh0URtW6CY=D0zxHp0K4W19eA@mail.gmail.com

On Fri, Mar 16, 2018 at 4:25 AM, Helge Deller <deller@gmx.de> wrote:
>> >> kernel  gcc     binutils    with mlong    without mlong
>> >> 4.15.7  4.9.3   2.25.1     13.4 MB/s    27.0 MB/s
>> >> 4.15.7  6.4.0   2.25.1     13.4 MB/s    27.0 MB/s
>> >> 4.15.7  6.4.0   2.29.1     14.4 MB/s    25.0 MB/s
>> > Interesting bad results!
>> >
>> It's hard to understand why the performance would deteriorate so much
>> but I see essentially the same behavior.
>
> Speaking of debian kernel, it's nearly impossible to link a kernel without mlong-calls.

This week I succeeded in building a stripped-down kernel without
mlong-calls (in Gentoo), but was unable to get anything to link
without mlong-calls when CONFIG_PARISC_PAGE_SIZE_16KB=y.

With mlong-calls, I couldn't get a 16K page-size kernel to boot
either. Is this a configuration anyone uses or tests? 16K pages are
supposed to give better performance, so it'd be good if they worked.
