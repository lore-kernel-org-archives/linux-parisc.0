From: John David Anglin <dave.anglin@bell.net>
Subject: Re: TLB Miss Bug?
Date: Fri, 25 Nov 2011 20:47:30 -0500
Message-ID: <BLU0-SMTP4EB77321633599EA38C1897CC0@phx.gbl>
References: <BLU0-SMTP178D0B9C9992607985308C97CE0@phx.gbl>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Cc: linux-parisc List <linux-parisc@vger.kernel.org>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU0-SMTP178D0B9C9992607985308C97CE0@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 24-Nov-11, at 8:16 AM, John David Anglin wrote:

> So, my theory is there is a bug in the TLB miss handling.  Somehow a  
> data miss ejects the instruction entry,
> and we get into a loop inserting I and D TLB entries.  Sometimes the  
> machine gets out of the loop but it takes
> hours.


The TLB conf is:

D-TLB conf: sh 3 page 1 cst 1 aid 0 pad1 0
I-TLB conf: sh 3 page 1 cst 1 aid 3 pad1 0

I believe the sh value indicates either pitlb or pdtld may be used  
(i.e., there is just one shared tlb) on rp3440.
Thus, the above scenario seems possible.

Dave
--
John David Anglin	dave.anglin@bell.net



