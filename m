Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from megatonmonkey.net (cr821974-a.lndn1.on.wave.home.com [24.112.53.173])
	by dsl2.external.hp.com (Postfix) with ESMTP id 76D11482A
	for <parisc-linux@lists.parisc-linux.org>; Sat, 30 Jun 2001 10:21:37 -0600 (MDT)
Date: Sat, 30 Jun 2001 12:22:36 -0400
From: "Carlos O'Donell Jr." <carlos@baldric.uwo.ca>
To: Yan Han <yhan@uwo.ca>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] request to boot (denied)
Message-ID: <20010630122236.A6437@megatonmonkey.net>
References: <002901c100ca$c74d24c0$d10c6481@HCI009>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <002901c100ca$c74d24c0$d10c6481@HCI009>; from yhan@uwo.ca on Fri, Jun 29, 2001 at 02:39:06PM -0400
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Jun 29, 2001 at 02:39:06PM -0400, Yan Han wrote:
> Hi!
> 
> We got the message of "08:00:09:87:e4:8f: request to boot 
> (denied) " from the system message. 
> But  we ran the rbootd in this machine. Does anyone know how to figure it out?
> 
> thanks,
>

Han,

There are two important things you need to do:

A. Please _read_ the manual for rbootd. (man rbootd)

B. Please _check_ the mailing list archive for solutions to this problem. 
   (http://www.parisc-linux.org/mailing-lists/)

Secondly, I would recommend that you contact one of the Unix admins from
the Computer Science faculty at UWO (Scott Feeney, Magi, Bruce Richards) and
drop your general Unix questions in their direction.

It seems to me that many of your problems stem from not having
experience with a general Unix environment.

You might want to go here:
http://www.linuxcare.com/linux-business/bookshelf/newbie.epl#0672315459
(and purchase one or two of these books, since they will be forever usefull!)

Yes, that was a shameless Linuxcare plug ;)

---

Usefull checklist of things:

1. Do you have /etc/rbootd.conf ?
2. Is rbootd.conf setup properly ?
3. Do you have a kernel in the proper directory ? /var/lib/rbootd ?
4. Permissions on the image ?
5. Is rbootd running ?
6. Did you pass the right parameters to rbootd on startup ? (rbootd -d /etc/rbootd.conf)

Rbootd:
ftp://puffin.external.hp.com/pub/parisc/binaries/tgz/rbootd-2.0-2.tar.gz

Ever patient,
Carlos.
