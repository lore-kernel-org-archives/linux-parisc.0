From: Helge Deller <deller@gmx.de>
Subject: Re: HP-UX for C8000
Date: Mon, 9 Oct 2017 17:34:41 +0200
Message-ID: <d6efa26f-9daf-a42f-c4e8-a2f050faf322@gmx.de>
References: <20170930152506.GA10542@alpha.franken.de>
 <D582C6C6-78B5-44F4-9705-B4723B651D8E@bell.net>
 <20171001114626.GA16118@alpha.franken.de>
 <692A47DA-6F88-44E7-AA7C-2DE516387604@bell.net>
 <20171006143917.GA4906@alpha.franken.de>
 <E9BCD0C2-329E-4E93-B4B8-2B928C458BE0@bell.net>
 <45425BF6-26D1-4232-957D-F3F057A8966A@bell.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Cc: Tom Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-parisc@vger.kernel.org
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <45425BF6-26D1-4232-957D-F3F057A8966A@bell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 08.10.2017 18:41, John David Anglin wrote:
> On 2017-10-08, at 12:22 PM, John David Anglin wrote:
>> mmap: Invalid argument
> Same occurs when gcc is used to compile program.

Maybe PDC does not reset (all of?) those registers when it reboots?
If so, maybe it's possible to boot into Linux afterwards and get the registers from there?

Or, even better, add some code to palo and boot into palo to print out
the wanted registers?

Helge
