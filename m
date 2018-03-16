From: Helge Deller <deller@gmx.de>
Subject: Re: C3600 kernel/64bit 4.* slow IO due to -mlong-calls
Date: Fri, 16 Mar 2018 20:50:33 +0100
Message-ID: <255e5ebc-4178-2969-9f15-953188108810@gmx.de>
References: <CA+QBN9C=wHxV5Y=SSt2UB_4b1H_Nx1mZxZu3rvuTY2wRe=GWBw@mail.gmail.com>
 <d637ebd1-db27-585b-c324-0e02baf8c8b2@gmx.de>
 <113ad157-e8c3-81dc-5752-75416c8ce531@bell.net>
 <trinity-f7583046-4aa6-488a-a797-20501118a1c0-1521199558775@3c-app-gmx-bs75>
 <CAEdQ38Fr1yy6Q5a2jkcO_SUCYYh0URtW6CY=D0zxHp0K4W19eA@mail.gmail.com>
 <7168081c-5f62-6632-ca1c-2f374dacca17@bell.net>
 <CAEdQ38HCbZ3Rw2KCNRpBOqjeUciP3_cnw67mAvPD3OZx24zFNw@mail.gmail.com>
 <25172070-e33d-bd4e-feb7-fc24acdffa72@bell.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Cc: debian-hppa@lists.debian.org, linux-parisc <linux-parisc@vger.kernel.org>
To: John David Anglin <dave.anglin@bell.net>, Matt Turner <mattst88@gmail.com>
Return-path: <bounce-debian-hppa=debian-hppa=m.gmane.org@lists.debian.org>
In-Reply-To: <25172070-e33d-bd4e-feb7-fc24acdffa72@bell.net>
Resent-Message-ID: <pFiO83NiyJ.A.GPB.0DCraB@bendel>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-URL: <https://lists.debian.org/debian-hppa/>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>
List-Archive: https://lists.debian.org/msgid-search/255e5ebc-4178-2969-9f15-953188108810@gmx.de

On 16.03.2018 19:03, John David Anglin wrote:
> On 2018-03-16 1:58 PM, Matt Turner wrote:
>> On Fri, Mar 16, 2018 at 10:44 AM, John David Anglin
>> <dave.anglin@bell.net> wrote:
>>> On 2018-03-16 1:29 PM, Matt Turner wrote:
>>>> This week I succeeded in building a stripped-down kernel without
>>>> mlong-calls (in Gentoo), but was unable to get anything to link
>>>> without mlong-calls when CONFIG_PARISC_PAGE_SIZE_16KB=y.
>>>>
>>> I wouldn't recommend the above option.  It affects alignment of some things
>>> in kernel
>>> and as you found it makes the kernel bigger.  There are also some things in
>>> userspace
>>> that assume 4KB pages.
>> I expect we're past the point where there are any significant
>> obstacles to userspace support. Most platforms successfully support
>> multiple page sizes these days.
>>
> But they don't have the problem we do with non equivalent aliasing. The data section starts on a
> page boundary on parisc and it doesn't overlap text.

I'd be astonished, if anything other than 4kB page size is able to 
boot to a login prompt.
For example, I know the parisc PCI-specific code (dino,lba,...) still
depends on 4kb page sizes.
I've left the CONFIG options in the source in the hope somebody
will try to finish >4kb page support at some point.

Helge
