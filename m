Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.goquest.com (mail.goquest.com [63.172.73.8])
	by dsl2.external.hp.com (Postfix) with SMTP id 8225C4829
	for <parisc-linux@lists.parisc-linux.org>; Sun, 22 Sep 2002 17:08:32 -0600 (MDT)
Content-Type: text/plain;
  charset="CP 1252"
From: Michael S.Zick <mszick@goquest.com>
To: "Yves Bodack" <bodack@stud.fh-heilbronn.de>,
	<parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] RTC and FB on 735/125
Date: Sun, 22 Sep 2002 18:05:41 -0500
References: <03ab01c26266$2416dea0$1f96078d@acid>
In-Reply-To: <03ab01c26266$2416dea0$1f96078d@acid>
MIME-Version: 1.0
Message-Id: <02092218054100.14750@localhost.localdomain>
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

On Sunday 22 September 2002 01:30 pm, Yves Bodack wrote:
> Hi,
>
> i have a 'new' 735/125 workstation, which I run Debian 3.0 on.
> hp735# uname -a
> Linux hp735 2.4.19-32 #1 Tue Aug 20 03:25:39 MDT 2002 parisc unknown
> unknown GNU/Linux
>
> 1st problem I have is the Real Time Clock. On boot I get the following
> messages:
>
> System Time was Thu Jan 1 00:00:10 UTC 1970
> Setting the System Clock using the Hardware Clock as reference...
> RTC_RD_TIME: Bad address
> ioctl() to /dev/rtc read the time failed.
> System Clock set. System local time is now Thu Jan 1 00:00:13 UTC 1970.
>
Perhaps it is really a good address and a bad clock battery.
Mike
