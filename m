Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp.petescaff.com (petem.xs4all.nl [194.109.247.92])
	by dsl2.external.hp.com (Postfix) with ESMTP id A8D79482A
	for <parisc-linux@lists.parisc-linux.org>; Sat, 29 Dec 2001 16:56:56 -0700 (MST)
Received: from r6.petescaff.com ([192.168.0.3])
	by smtp.petescaff.com with esmtp (Exim 3.22 #5)
	id 16KTLT-0003V5-00
	for parisc-linux@lists.parisc-linux.org; Sun, 30 Dec 2001 00:56:55 +0100
Received: from apm (helo=localhost)
	by r6.petescaff.com with local-esmtp (Exim 3.33 #1 (Debian))
	id 16KTLS-0004t1-00
	for <parisc-linux@lists.parisc-linux.org>; Sun, 30 Dec 2001 00:56:54 +0100
Date: Sun, 30 Dec 2001 00:56:54 +0100 (CET)
From: Peter Mottram <peter@petescaff.com>
To: parisc-linux <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] DSL on a 715/80 with rp-pppoe
In-Reply-To: <20011229205411.GA11344@sleepie.demon.co.uk>
Message-ID: <Pine.LNX.4.42.0112300049260.17057-100000@r6.petescaff.com>
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

Until I restarted ppp on my 712 it had been working perfectly for nearly
three months with no /sbin/hotplug.

Unfortunately I am a sad unstable addict (I have been since pre-buzz days
on i386) and have updated many times since ppp was last restarted.

This one I find weird because I know that it has worked but broke sometime
recently. The only reason I restarted the system was to finally upgrade to
the 2.4.16 kernel I have been happily running on a C160 and a collection
of C110s.

PeteM

On Sat, 29 Dec 2001, Richard Hirst wrote:

> IIRC, when I first got ppp working on hppa, it would only work if
> I created a dummy /sbin/hotplug, see
>
> <http://lists.parisc-linux.org/hypermail/parisc-linux/6527.html>
>
> Richard
>
[snip]
