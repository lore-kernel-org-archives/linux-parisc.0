Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.pangeatech.com (unknown [63.110.32.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3FEC2482A
	for <parisc-linux@lists.parisc-linux.org>; Mon,  6 May 2002 04:29:21 -0600 (MDT)
Received: from [65.192.22.133] by mail.pangeatech.com (NTMail 7.00.0018/NU8172.00.e2123c13) with ESMTP id btkdnaaa for parisc-linux@lists.parisc-linux.org; Mon, 6 May 2002 03:27:58 -0700
Date: Mon, 6 May 2002 01:03:29 -0700
From: Randolph Chung <tausq@debian.org>
To: Ralf Hildebrandt <Ralf.Hildebrandt@charite.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] NTP and the real time clock
Message-ID: <20020506080328.GA30370@tausq.org>
Reply-To: Randolph Chung <tausq@debian.org>
References: <20020506064402.GD14146@charite.de> <20020506065214.GE14146@charite.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020506065214.GE14146@charite.de>
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

> I find this intriguing:
> 
> gecko:~# hwclock --show
> Mon May  6 08:46:27 2002  -0.994167 seconds
> gecko:~# hwclock --systohc
> gecko:~# hwclock --show
> Mon May  6 08:46:33 2002  -0.999854 seconds
> 
> So the hardwareclock is never set.

Are you sure?

legolas:/usr/src/linux-ide# hwclock --show
Mon May  6 00:05:08 2002  -0.995996 seconds
legolas:/usr/src/linux-ide# date 050600002002
Mon May  6 00:00:00 PDT 2002
legolas:/usr/src/linux-ide# hwclock --systohc
legolas:/usr/src/linux-ide# hwclock --show
Mon May  6 00:00:23 2002  -0.999298 seconds

> Which setting in "Character Devices" do I need so hwclock can access
> the on-board real-time-clock?
>  < > /dev/nvram support
>  < > Enhanced Real Time Clock Support 

You want: "Generic RTC device support" (I think it's on by default). The
fact that hwclock didn't give you an error suggests to me that you
already have that enabled.

randolph
