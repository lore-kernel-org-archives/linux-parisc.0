Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hauptpostamt.charite.de (hauptpostamt.charite.de [193.175.66.220])
	by dsl2.external.hp.com (Postfix) with ESMTP id 56FA5482A
	for <parisc-linux@lists.parisc-linux.org>; Mon,  6 May 2002 00:52:16 -0600 (MDT)
Date: Mon, 6 May 2002 08:52:14 +0200
From: Ralf Hildebrandt <Ralf.Hildebrandt@charite.de>
To: Ralf Hildebrandt <Ralf.Hildebrandt@charite.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] NTP and the real time clock
Message-ID: <20020506065214.GE14146@charite.de>
References: <20020506064402.GD14146@charite.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020506064402.GD14146@charite.de>
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

Am 06.05.2002 um 08:44:02 +0200 schrieb Ralf Hildebrandt folgendes:
> Whenever I turn off my 712/80 and turn it back on, NTP (ntpq) reports
> an offset of about 1200.
> Question: Could it be that at shutdown the time is not stored in the
> on-board real-time-clock?

I find this intriguing:

gecko:~# hwclock --show
Mon May  6 08:46:27 2002  -0.994167 seconds
gecko:~# hwclock --systohc
gecko:~# hwclock --show
Mon May  6 08:46:33 2002  -0.999854 seconds

So the hardwareclock is never set.
Which setting in "Character Devices" do I need so hwclock can access
the on-board real-time-clock?
 < > /dev/nvram support
 < > Enhanced Real Time Clock Support 

-- 
Ralf Hildebrandt (Im Auftrag des Referat V A)   Ralf.Hildebrandt@charite.de
Charite Campus Virchow-Klinikum                 Tel.  +49 (0)30-450 570-155
Referat V A - Kommunikationsnetze -             Fax.  +49 (0)30-450 570-916
There are two ways to write error-free programs. Only the third one
works.
