From: John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH] Fix compile failure on PA-RISC
Date: Sat, 5 May 2012 16:09:52 -0400
Message-ID: <BLU0-SMTP81AFFA5151451BADCB23B3972D0@phx.gbl>
References: <Pine.LNX.4.64.1205042250130.18896@file.rdu.redhat.com> <1798237.g4OIBKAx4s@donald.sf-tec.de> <Pine.LNX.4.64.1205051445360.2623@file.rdu.redhat.com>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Cc: Rolf Eike Beer <eike-kernel@sf-tec.de>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org
To: Mikulas Patocka <mpatocka@redhat.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.64.1205051445360.2623@file.rdu.redhat.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 5-May-12, at 2:55 PM, Mikulas Patocka wrote:

> I acknowledge that your patches work. So send them directly to  
> Linus. I
> think there is not much maintenance being done on PA-RISC.

James wrote back in March "I haven't yet actually tried git head on  
parisc
(and I won't be able to until I actually get my machines back  
[currently being
shipped across the atlantic]) but if there's a problem it will show up  
quickly:
parisc actually uses cpu hotplug to boot its secondary cpus."

Helge resigned due to lack of time.

This is my understanding as to why there is a maintenance gap.

For what I have been doing, I only use stable kernels.  I'm currently
running 3.3.4.

Dave
--
John David Anglin	dave.anglin@bell.net



