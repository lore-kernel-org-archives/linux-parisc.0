Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from laas.laas.fr (laas.laas.fr [140.93.0.15])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5DAB5482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 11 Feb 2002 01:48:07 -0700 (MST)
Message-ID: <3C6785DE.307@tuxfamily.org>
Date: Mon, 11 Feb 2002 09:50:38 +0100
From: Thomas Marteau <marteaut@tuxfamily.org>
MIME-Version: 1.0
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: Bob Radvanovsky <rsradvan@unixworks.net>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] [REQUEST] PS/2 keyboard pinouts?
References: <200202101948.NAA05497@unixworks.net> <20020211042116.A015E482A@dsl2.external.hp.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
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

Hi all,

>>Unfortunately, I don't have 30+ keyboards for all of these workstations. 
>>
>
>Here is the original posting for serial console on 712.
>
>http://lists.parisc-linux.org/pipermail/parisc-linux/1999-December/008117.html
>
>We should probably add this as a "How-To" someplace. Ideas on where?
>
I'll add this into the Console section of my HOWTO!

By the way, at this moment, you can read:


          How can I change the boot console to serial on a 712?

Unfortunately, you can't. Although 712s are configured for in-house HP 
development to use serial console, this configuration isn't supported in 
the field. You have to use a graphics console for 712s but if you really 
want it, you have a tip in the PA/Linux mailing list archive 
<http://lists.parisc-linux.org/pipermail/parisc-linux/1999-December/008117.html>. 
In fact, why will we use this beautiful 712 with serial console when you 
can have X!

( That part is from Debbie, I'll fix it )

Thomas.
