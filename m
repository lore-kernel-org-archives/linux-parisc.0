From: Tom Bogendoerfer <tsbogend@alpha.franken.de>
Subject: Re: HP-UX for C8000
Date: Mon, 9 Oct 2017 18:05:54 +0200
Message-ID: <20171009160554.GA19442@alpha.franken.de>
References: <20170930152506.GA10542@alpha.franken.de>
 <D582C6C6-78B5-44F4-9705-B4723B651D8E@bell.net>
 <20171001114626.GA16118@alpha.franken.de>
 <692A47DA-6F88-44E7-AA7C-2DE516387604@bell.net>
 <20171006143917.GA4906@alpha.franken.de>
 <E9BCD0C2-329E-4E93-B4B8-2B928C458BE0@bell.net>
 <45425BF6-26D1-4232-957D-F3F057A8966A@bell.net>
 <d6efa26f-9daf-a42f-c4e8-a2f050faf322@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: John David Anglin <dave.anglin@bell.net>,
        linux-parisc@vger.kernel.org
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <d6efa26f-9daf-a42f-c4e8-a2f050faf322@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Oct 09, 2017 at 05:34:41PM +0200, Helge Deller wrote:
> Or, even better, add some code to palo and boot into palo to print out
> the wanted registers?

it might be easier to use adb or kernel debugger. As I don't have
any HP-UX box handy right now, I'm not able to give instructions.

If HP-UX supports load able kernel modules, that would be another
option.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
