From: John David Anglin <dave.anglin@bell.net>
Subject: Re: parisc 4.13-git, BUG: sleeping function called from invalid context at mm/slab.h:416
Date: Sun, 30 Jul 2017 14:21:04 -0400
Message-ID: <15C99B92-DFB7-4B86-A280-2D491A5907CB@bell.net>
References: <alpine.LRH.2.20.1707292206210.12687@math.ut.ee>  <CEB1A532-3AAD-4A4D-9A34-12A2477BE87F@bell.net>  <alpine.LRH.2.20.1707300947250.27473@math.ut.ee>  <F79536F1-AB2B-435C-A127-A1DFB4AC9CE0@bell.net> <1501428648.3670.1.camel@HansenPartnership.com> <alpine.LRH.2.20.1707302112140.27473@math.ut.ee>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: text/plain; charset=us-ascii
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
        linux-parisc@vger.kernel.org
To: Meelis Roos <mroos@linux.ee>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.LRH.2.20.1707302112140.27473@math.ut.ee>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 2017-07-30, at 2:12 PM, Meelis Roos wrote:

>> How about this?  There's no need to take the write lock when creating
>> links anyway.
> 
> No effect.

Is the backtrace still the same?

--
John David Anglin	dave.anglin@bell.net



