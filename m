Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id JAA12981
	for <parisc-linux@puffin.external.hp.com>; Sat, 30 Dec 2000 09:32:08 -0700
Received: from localhost (bz@localhost)
	by mail.zabbadoz.net (8.11.0/8.11.0) with ESMTP id eBUGZCR00141
	for <parisc-linux@thepuffingroup.com>; Sat, 30 Dec 2000 17:35:12 +0100 (CET)
Date: Sat, 30 Dec 2000 17:35:11 +0100 (CET)
From: "Bjoern A. Zeeb" <bzeeb+hplinux@zabbadoz.net>
cc: <parisc-linux@thepuffingroup.com>
Subject: Re: OT: HP A4033A Monitor and X [solved ?]
In-Reply-To: <Pine.BSF.4.30.0012301253270.5467-100000@noc.zabbadoz.net>
Message-ID: <Pine.BSF.4.30.0012301722000.5467-100000@noc.zabbadoz.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Sat, 30 Dec 2000, Bjoern A. Zeeb wrote:

> I got a second hand apollo and it's working quite fine (out of the
> box) with parisc-0.5.iso (uptimes growing :-) but as long as there
> is no support for monitor (most likely I will never need anyway)
> I wanted to use the HP A4033A monitor I got with it with some
> other PC rather than letting it get dusty in a corner.

Hi,

many thanks to all people who answered and helped.

I am posting the answer because I got mails from people having the
same problem.

I finally managed to get it working :-))

setup:
PC
G400
5-BNC cable (rgb, hsync, vsync)
X 4.0.2

I do not know why but it started to work after I accidentally
(while trying a second cable) swapped hsync and vsync.
Had no chance to get it up with 3-bnc or SyncOnGreen stuff.
I do not know if it's a problem with my card, with the cables or with
the monitor; it's just working now.

If anybody needs a XF86Config file. I put mine on
http://www.zabbadoz.net/zabbadoz-network/z1/XF86Config
(starting a not yet working dual screen setup so do not get confused)

A happy and successful new year.

-- 
Bjoern A. Zeeb				bzeeb at Zabbadoz dot NeT
56 69 73 69 74				http://www.zabbadoz.net/
