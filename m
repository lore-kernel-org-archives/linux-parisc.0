Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from dns2.dot.at (dns2.dot.at [212.9.128.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id C20544A19
	for <parisc-linux@lists.parisc-linux.org>; Mon, 19 Feb 2001 16:03:06 -0700 (MST)
Received: from dot.at (IDENT:plattner@dot-tc01-035.dot.at [212.9.128.75])
	by dns2.dot.at (8.9.3/8.9.2) with ESMTP id AAA01898
	for <parisc-linux@lists.parisc-linux.org>; Tue, 20 Feb 2001 00:16:19 +0100
Sender: plattner@dns2.dot.at
Message-ID: <3A91A628.176CC23F@dot.at>
Date: Tue, 20 Feb 2001 00:03:04 +0100
From: Christoph Plattner <christoph.plattner@dot.at>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] 9000/720 and RTC - driver problem ?
List-ID: <linux-parisc.vger.kernel.org>

I have problems with the RTC on this machine...
`hwclock' accesses via `/dev/rtc' (which I created).
It reports an error on reading from the clock:

196:/# hwclock --utc --systohc
RTC_RD_TIME: Bad address
ioctl() to /dev/rtc to read the time failed.
196:/# 

I used the generic RTC driver under "charcater devices".

Have I to select another one ?
Must I patch the driver ... ?
Are there any experiences on that issue ?

Cheers
	Christoph P.



-- 
-------------------------------------------------------------------------
private:	christoph.plattner@dot.at
company:	christoph.plattner@alcatel.at
