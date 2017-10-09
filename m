From: John David Anglin <dave.anglin@bell.net>
Subject: Re: HP-UX for C8000
Date: Mon, 9 Oct 2017 13:40:45 -0400
Message-ID: <3417D2EF-A9FF-4E88-94DF-B8214772138B@bell.net>
References: <20170930152506.GA10542@alpha.franken.de> <D582C6C6-78B5-44F4-9705-B4723B651D8E@bell.net> <20171001114626.GA16118@alpha.franken.de> <692A47DA-6F88-44E7-AA7C-2DE516387604@bell.net> <20171006143917.GA4906@alpha.franken.de> <E9BCD0C2-329E-4E93-B4B8-2B928C458BE0@bell.net> <45425BF6-26D1-4232-957D-F3F057A8966A@bell.net> <d6efa26f-9daf-a42f-c4e8-a2f050faf322@gmx.de> <20171009160554.GA19442@alpha.franken.de>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: text/plain; charset=us-ascii
Cc: Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
To: Tom Bogendoerfer <tsbogend@alpha.franken.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20171009160554.GA19442@alpha.franken.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 2017-10-09, at 12:05 PM, Tom Bogendoerfer wrote:

> On Mon, Oct 09, 2017 at 05:34:41PM +0200, Helge Deller wrote:
>> Or, even better, add some code to palo and boot into palo to print out
>> the wanted registers?
> 
> it might be easier to use adb or kernel debugger.

I tried adb but I didn't have any luck.  It's not clear how 64-bit addresses are handled
and I suspect it can't access registers in /dev/mem since it wasn't possible to access
them with pread.

Dave
--
John David Anglin	dave.anglin@bell.net



