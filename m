Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.zabbadoz.net (mail.zabbadoz.net [195.2.176.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id 873254840
	for <parisc-linux@lists.parisc-linux.org>; Sun,  6 Jan 2002 10:43:55 -0700 (MST)
Date: Sun, 6 Jan 2002 18:43:53 +0100 (CET)
From: "Bjoern A. Zeeb" <bzeeb+hplinux@zabbadoz.net>
To: Helge Deller <deller@gmx.de>
Cc: <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] LED blinking ;-(
In-Reply-To: <200201061755.08978.deller@gmx.de>
Message-ID: <Pine.BSF.4.30.0201061828520.727-100000@noc.zabbadoz.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Sun, 6 Jan 2002, Helge Deller wrote:

> On Sunday 06 January 2002 17:33, Bjoern A. Zeeb wrote:
>
> > ... can one change this to a constant on ? - or at least not blinking
> > that frequent or in a radom intervall ?
>
> I assume you talk about the "Heartbeat LED" with which we blink in the
> same frequency as a heart. That's also the behaviour under HP/UX.

don't know. only seen a hp/ux once on that machine ;-)

> and change it with one of the following commands:
> pa64:~# echo "0 1 1" > /proc/pdc/led
> turns off only the heartbeat LED,

Ahh :-)) It's on now. No more blinking.
Much better like this and the machine can live where it is :-)

Thanks a lot.

-- 
Bjoern A. Zeeb				bzeeb at Zabbadoz dot NeT
56 69 73 69 74				http://www.zabbadoz.net/
