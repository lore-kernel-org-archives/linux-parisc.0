Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hotmail.com (oe23.law4.hotmail.com [216.33.148.16])
	by dsl2.external.hp.com (Postfix) with ESMTP id 64779482A
	for <parisc-linux@lists.parisc-linux.org>; Mon,  6 May 2002 01:57:29 -0600 (MDT)
From: "kenneth westelinck" <kennywest1@hotmail.com>
To: "Ralf Hildebrandt" <Ralf.Hildebrandt@charite.de>
Cc: <parisc-linux@lists.parisc-linux.org>
References: <20020506064402.GD14146@charite.de> <20020506065214.GE14146@charite.de>
Subject: Re: [parisc-linux] NTP and the real time clock
Date: Mon, 6 May 2002 09:52:35 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Message-ID: <OE23wyLx5GjxJOAzGlD00002868@hotmail.com>
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

You'll need to set this option: CONFIG_GENRTC=y

----- Original Message -----
From: "Ralf Hildebrandt" <Ralf.Hildebrandt@charite.de>
To: "Ralf Hildebrandt" <Ralf.Hildebrandt@charite.de>
Cc: <parisc-linux@lists.parisc-linux.org>
Sent: Monday, May 06, 2002 8:52 AM
Subject: Re: [parisc-linux] NTP and the real time clock


> Am 06.05.2002 um 08:44:02 +0200 schrieb Ralf Hildebrandt folgendes:
> > Whenever I turn off my 712/80 and turn it back on, NTP (ntpq) reports
> > an offset of about 1200.
> > Question: Could it be that at shutdown the time is not stored in the
> > on-board real-time-clock?
>
> I find this intriguing:
>
> gecko:~# hwclock --show
> Mon May  6 08:46:27 2002  -0.994167 seconds
> gecko:~# hwclock --systohc
> gecko:~# hwclock --show
> Mon May  6 08:46:33 2002  -0.999854 seconds
>
> So the hardwareclock is never set.
> Which setting in "Character Devices" do I need so hwclock can access
> the on-board real-time-clock?
>  < > /dev/nvram support
>  < > Enhanced Real Time Clock Support
>
> --
> Ralf Hildebrandt (Im Auftrag des Referat V A)
Ralf.Hildebrandt@charite.de
> Charite Campus Virchow-Klinikum                 Tel.  +49 (0)30-450
570-155
> Referat V A - Kommunikationsnetze -             Fax.  +49 (0)30-450
570-916
> There are two ways to write error-free programs. Only the third one
> works.
>
>
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
>
