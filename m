Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from dns1.rz.fh-heilbronn.de (dns1.rz.fh-heilbronn.de [141.7.1.18])
	by dsl2.external.hp.com (Postfix) with ESMTP id 93C3B4829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 23 Sep 2002 14:09:54 -0600 (MDT)
Received: from lisa.stud.fh-heilbronn.de (lisa.stud.fh-heilbronn.de [141.7.11.14])
	by dns1.rz.fh-heilbronn.de (8.12.2/8.12.2) with ESMTP id g8NK9pQ0021075
	for <parisc-linux@lists.parisc-linux.org>; Mon, 23 Sep 2002 22:09:51 +0200 (MET DST)
Received: from acid (acid.stuwo.fh-heilbronn.de [141.7.150.31])
	by lisa.stud.fh-heilbronn.de (8.12.2/8.12.2) with SMTP id g8NK9okc020678
	for <parisc-linux@lists.parisc-linux.org>; Mon, 23 Sep 2002 22:09:51 +0200 (MEST)
Message-ID: <001101c2633d$40a33d70$1f96078d@acid>
From: "Yves Bodack" <bodack@stud.fh-heilbronn.de>
To: <parisc-linux@lists.parisc-linux.org>
References: <03ab01c26266$2416dea0$1f96078d@acid> <02092218054100.14750@localhost.localdomain>
Subject: Re: [parisc-linux] RTC and FB on 735/125
Date: Mon, 23 Sep 2002 22:10:24 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="Windows-1252"
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

Hi,
i got this problem solved by myself. I read out DATE in BOOT ADMIN Console
and it gave me an error (with a dump a of many zeros). Then I set a new date
in PDC and now it works just fine. So somehow the RTC was zeroed out.

Greetings Yves...

From: "Michael S. Zick" <mszick@goquest.com>
Subject: Re: [parisc-linux] RTC and FB on 735/125


> On Sunday 22 September 2002 01:30 pm, Yves Bodack wrote:
> > 1st problem I have is the Real Time Clock. On boot I get the following
> > messages:
> >
> > System Time was Thu Jan 1 00:00:10 UTC 1970
> > Setting the System Clock using the Hardware Clock as reference...
> > RTC_RD_TIME: Bad address
> > ioctl() to /dev/rtc read the time failed.
> > System Clock set. System local time is now Thu Jan 1 00:00:13 UTC 1970.
> >
> Perhaps it is really a good address and a bad clock battery.
> Mike
