From: John David Anglin <dave.anglin@bell.net>
Subject: Re: HP-UX for C8000
Date: Mon, 9 Oct 2017 20:56:40 -0400
Message-ID: <7521862C-4EC7-47F5-AFF9-41A44775CFAB@bell.net>
References: <20170930152506.GA10542@alpha.franken.de> <D582C6C6-78B5-44F4-9705-B4723B651D8E@bell.net> <20171001114626.GA16118@alpha.franken.de> <692A47DA-6F88-44E7-AA7C-2DE516387604@bell.net> <20171006143917.GA4906@alpha.franken.de> <E9BCD0C2-329E-4E93-B4B8-2B928C458BE0@bell.net> <45425BF6-26D1-4232-957D-F3F057A8966A@bell.net> <d6efa26f-9daf-a42f-c4e8-a2f050faf322@gmx.de> <8A61C252-CA15-44AB-9225-EAA6C259E872@bell.net> <20171009174146.GA21988@alpha.franken.de>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: text/plain; charset=us-ascii
Cc: Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
To: Tom Bogendoerfer <tsbogend@alpha.franken.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20171009174146.GA21988@alpha.franken.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 2017-10-09, at 1:41 PM, Tom Bogendoerfer wrote:

> thanks, but since firmware will sets all chipset stuff from scratch, there
> is no new information in that dump.

Does this help:
https://opensource.apple.com/source/X11server/X11server-85.3/Xquartz/xorg-server-1.4.2-apple56/hw/xfree86/os-support/bus/zx1PCI.c.auto.html

Dave
--
John David Anglin	dave.anglin@bell.net



