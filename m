From: John David Anglin <dave.anglin@bell.net>
Subject: Re: C3600 kernel/64bit 4.* slow IO due to -mlong-calls
Date: Fri, 16 Mar 2018 13:44:04 -0400
Message-ID: <7168081c-5f62-6632-ca1c-2f374dacca17@bell.net>
References: <CA+QBN9C=wHxV5Y=SSt2UB_4b1H_Nx1mZxZu3rvuTY2wRe=GWBw@mail.gmail.com>
 <d637ebd1-db27-585b-c324-0e02baf8c8b2@gmx.de>
 <113ad157-e8c3-81dc-5752-75416c8ce531@bell.net>
 <trinity-f7583046-4aa6-488a-a797-20501118a1c0-1521199558775@3c-app-gmx-bs75>
 <CAEdQ38Fr1yy6Q5a2jkcO_SUCYYh0URtW6CY=D0zxHp0K4W19eA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Cc: debian-hppa@lists.debian.org, linux-parisc <linux-parisc@vger.kernel.org>
To: Matt Turner <mattst88@gmail.com>, Helge Deller <deller@gmx.de>
Return-path: <bounce-debian-hppa=debian-hppa=m.gmane.org@lists.debian.org>
In-Reply-To: <CAEdQ38Fr1yy6Q5a2jkcO_SUCYYh0URtW6CY=D0zxHp0K4W19eA@mail.gmail.com>
Resent-Message-ID: <2B3pYOgtx6M.A.A_F.3JAraB@bendel>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-URL: <https://lists.debian.org/debian-hppa/>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>
List-Archive: https://lists.debian.org/msgid-search/7168081c-5f62-6632-ca1c-2f374dacca17@bell.net

On 2018-03-16 1:29 PM, Matt Turner wrote:
> This week I succeeded in building a stripped-down kernel without
> mlong-calls (in Gentoo), but was unable to get anything to link
> without mlong-calls when CONFIG_PARISC_PAGE_SIZE_16KB=y.
>
I wouldn't recommend the above option.  It affects alignment of some 
things in kernel
and as you found it makes the kernel bigger.  There are also some things 
in userspace
that assume 4KB pages.

Dave
