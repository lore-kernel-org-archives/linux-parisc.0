From: Tom Bogendoerfer <tsbogend@alpha.franken.de>
Subject: Re: HP-UX for C8000
Date: Tue, 10 Oct 2017 20:46:21 +0200
Message-ID: <20171010184621.GA18582@alpha.franken.de>
References: <D582C6C6-78B5-44F4-9705-B4723B651D8E@bell.net>
 <20171001114626.GA16118@alpha.franken.de>
 <692A47DA-6F88-44E7-AA7C-2DE516387604@bell.net>
 <20171006143917.GA4906@alpha.franken.de>
 <E9BCD0C2-329E-4E93-B4B8-2B928C458BE0@bell.net>
 <45425BF6-26D1-4232-957D-F3F057A8966A@bell.net>
 <d6efa26f-9daf-a42f-c4e8-a2f050faf322@gmx.de>
 <8A61C252-CA15-44AB-9225-EAA6C259E872@bell.net>
 <20171009174146.GA21988@alpha.franken.de>
 <7521862C-4EC7-47F5-AFF9-41A44775CFAB@bell.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <7521862C-4EC7-47F5-AFF9-41A44775CFAB@bell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Oct 09, 2017 at 08:56:40PM -0400, John David Anglin wrote:
> On 2017-10-09, at 1:41 PM, Tom Bogendoerfer wrote:
> 
> > thanks, but since firmware will sets all chipset stuff from scratch, there
> > is no new information in that dump.
> 
> Does this help:
> https://opensource.apple.com/source/X11server/X11server-85.3/Xquartz/xorg-server-1.4.2-apple56/hw/xfree86/os-support/bus/zx1PCI.c.auto.html

unfortunatly no. The part about setting up dma mappings and other init
code isn't in there. Nevertheless it's an interesting file, I didn't
know before.

Does anybody have HP-UX ISOs ? I have enough spare disks and C8000 to
run one with HP-UX. The problem is I don't have a mediakit and can't
find one on ebay...

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
