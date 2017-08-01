From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: parisc 4.13-git, BUG: sleeping function called from invalid
 context at mm/slab.h:416
Date: Tue, 01 Aug 2017 07:26:14 -0700
Message-ID: <1501597574.2736.1.camel@HansenPartnership.com>
References: <alpine.LRH.2.20.1707292206210.12687@math.ut.ee>
         <CEB1A532-3AAD-4A4D-9A34-12A2477BE87F@bell.net>
         <alpine.LRH.2.20.1707300947250.27473@math.ut.ee>
         <F79536F1-AB2B-435C-A127-A1DFB4AC9CE0@bell.net>
         <alpine.LRH.2.20.1708011050580.27473@math.ut.ee>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: linux-parisc@vger.kernel.org
To: Meelis Roos <mroos@linux.ee>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.LRH.2.20.1708011050580.27473@math.ut.ee>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, 2017-08-01 at 10:52 +0300, Meelis Roos wrote:
> > 
> > Since this code hasn't changed in a long time, it should be
> > possible to bisect problem.
> 
> I know the patch works, but out of curiosity I bisected it and found 
> that the BUG is brough out with the following commit. Seems to make 
> sense.

Yes, I guessed it would be something like that.  The bug was actually
always in our code; that commit just causes us to notice it.  Bisect
naturally takes you to that commit rather than the original problem one
(which is way back in history now).

James

