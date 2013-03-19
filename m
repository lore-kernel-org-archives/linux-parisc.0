From: John David Anglin <dave.anglin@bell.net>
Subject: Re: PA8800 with 3.9.0-rc1-JeR-10942-g6dbe51c : WARNING: at lib/timerqueue.c:74
Date: Tue, 19 Mar 2013 18:49:45 -0400
Message-ID: <BLU0-SMTP626E58B90FF5663B20A26097E90@phx.gbl>
References: <20130315152226.46ad0993@marga.jer-c2.orkz.net> <BLU0-SMTP3801FFE58A0BCC9C8836A597EE0@phx.gbl> <20130318135831.7c14b6e7@marga.jer-c2.orkz.net> <5148E903.1020105@gmx.de>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Cc: Jeroen Roovers <jer@gentoo.org>, linux-parisc@vger.kernel.org
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <5148E903.1020105@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 19-Mar-13, at 6:38 PM, Helge Deller wrote:

> Out of your backtrace it seems there is a problem with timer/SMP/ 
> locking or similiar (or just our old cache-problem)...

Based on testing with rc1 and rc2, we still have some cache issues,  
although far less than before.  For some
reason, rc2 seemed worse than rc1.  Testing rc3.

This seems to be a kernel issue, so I'm not sure why we would have  
cache issues.

Dave
--
John David Anglin	dave.anglin@bell.net



