Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hauptpostamt.charite.de (hauptpostamt.charite.de [193.175.66.220])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1E4A1482B
	for <parisc-linux@lists.parisc-linux.org>; Mon,  6 May 2002 04:57:18 -0600 (MDT)
Date: Mon, 6 May 2002 12:57:15 +0200
From: Ralf Hildebrandt <Ralf.Hildebrandt@charite.de>
To: Randolph Chung <tausq@debian.org>
Cc: Ralf Hildebrandt <Ralf.Hildebrandt@charite.de>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] NTP and the real time clock
Message-ID: <20020506105714.GS14146@charite.de>
References: <20020506064402.GD14146@charite.de> <20020506065214.GE14146@charite.de> <20020506080328.GA30370@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020506080328.GA30370@tausq.org>
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

Am 06.05.2002 um 01:03:29 -0700 schrieb Randolph Chung folgendes:

> > So the hardwareclock is never set.
> 
> Are you sure?

Well, no.
 
> legolas:/usr/src/linux-ide# hwclock --show
> Mon May  6 00:05:08 2002  -0.995996 seconds
> legolas:/usr/src/linux-ide# date 050600002002
> Mon May  6 00:00:00 PDT 2002
> legolas:/usr/src/linux-ide# hwclock --systohc
> legolas:/usr/src/linux-ide# hwclock --show
> Mon May  6 00:00:23 2002  -0.999298 seconds

OK, seems to work.
But what is that "-0.999298 seconds" stuff?

-- 
Ralf Hildebrandt (Im Auftrag des Referat V A)   Ralf.Hildebrandt@charite.de
Charite Campus Virchow-Klinikum                 Tel.  +49 (0)30-450 570-155
Referat V A - Kommunikationsnetze -             Fax.  +49 (0)30-450 570-916
When the government outlaws cryptography, bayl pevzvanyf jvyy unir
cevinpl. 
