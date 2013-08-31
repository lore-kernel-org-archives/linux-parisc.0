From: John David Anglin <dave.anglin@bell.net>
Subject: Re: parisc debian kernel - missing  modules for C8000 - linux-image-3.10-2-parisc64-smp
Date: Sat, 31 Aug 2013 13:41:40 -0400
Message-ID: <BLU0-SMTP99E4F2E24E1A3F5BA18E7A97360@phx.gbl>
References: <521A7589.5000503@gmx.de> <BLU0-SMTP41F72FA4035273DC12703897360@phx.gbl>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Cc: Helge Deller <deller@gmx.de>,
	Parisc List <linux-parisc@vger.kernel.org>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU0-SMTP41F72FA4035273DC12703897360@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 31-Aug-13, at 1:13 PM, John David Anglin wrote:

> With radeon support enabled, I get a consistent warning at kernel/ 
> workqueue.c:1378.  See attached output
> from dmesg.  Possibly, it has something to do with ring test failure.


Found fix:
http://www.spinics.net/lists/dri-devel/msg44316.html

Ring test still fails.

Dave
--
John David Anglin	dave.anglin@bell.net



