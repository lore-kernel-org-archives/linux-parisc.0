Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hotmail.com (f124.law4.hotmail.com [216.33.149.124])
	by dsl2.external.hp.com (Postfix) with ESMTP id F22944847
	for <parisc-linux@lists.parisc-linux.org>; Tue, 16 Apr 2002 02:27:35 -0600 (MDT)
From: "Kenneth Westelinck" <kennywest1@hotmail.com>
To: deller@gmx.de, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] not freeing initmem and power button
Date: Tue, 16 Apr 2002 08:27:33 +0000
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Message-ID: <F124jLDxo1dHkLl0atJ00008874@hotmail.com>
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

I'll try this tonight. Thanks.


>From: Helge Deller <deller@gmx.de>
>To: "Kenneth Westelinck" <kennywest1@hotmail.com>, 
>parisc-linux@lists.parisc-linux.org
>Subject: Re: [parisc-linux] not freeing initmem and power button
>Date: Tue, 16 Apr 2002 02:30:39 +0200
>
>On Monday 15 April 2002 13:59, Kenneth Westelinck wrote:
> > >The power-button should work if you update to a newer kernel (>=
> > >2.4.18-pa19).
> >
> > Cool, does this mean: if I push the button, the system will do a clean
> > shutdown? Or if I push the button, nothing happens?
> >
> > Is there an easy way to disable this.
>
>In Kernel 2.4.18-pa20 I've added a /proc/sys/kernel/power
>procfs entry which lets you enable/disable the soft power switch
>at runtime:
>
># echo 0 > /proc/sys/kernel/power		# disables the power switch
># echo 1 > /proc/sys/kernel/power		# enables the power switch
>
># cat /proc/sys/kernel/power
>Software power switch support: enabled (1)
>
>Or, you could of course also use sysctl program/interface.
>
>Greetings,
>Helge
>


enjoy life, enjoy linux,

Kenneth

_________________________________________________________________
Download MSN Explorer gratis van http://explorer.msn.nl/intl.asp.
