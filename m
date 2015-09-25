From: John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH] parisc: adjust L1_CACHE_BYTES to 128 bytes on PA8800 and
 PA8900 CPUs
Date: Fri, 25 Sep 2015 11:56:25 -0400
Message-ID: <56056EA9.9070404@bell.net>
References: <20150902162000.GC2444@ls3530.box>
 <1441287043.2235.6.camel@HansenPartnership.com>
 <1441288665.2235.17.camel@HansenPartnership.com> <55EB5EFA.4040407@gmx.de>
 <56017FB3.5050709@gmx.de> <17069A9B-BA68-4BDA-9342-83E33A22D547@bell.net>
 <1443104427.2203.17.camel@HansenPartnership.com> <56042730.2050706@bell.net>
 <1443113829.2203.39.camel@HansenPartnership.com>
 <BA678D0F-591B-4925-A50B-852C0C3419F7@bell.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Cc: Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BA678D0F-591B-4925-A50B-852C0C3419F7@bell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 2015-09-25 8:20 AM, John David Anglin wrote:
> Our atomic_t types are guarded by ldcw locks.  So, they are not really subject to contention.
> You could be correct that L1_CACHE_BYTES could be reduced to 16 (i.e., maximum alignment
> needed for any type on parisc) provided it isn't used somewhere where we need the actual L1
> cache line size as returned by the PDC.
Digging through various documentation, I now believe that L1_CACHE_BYTES 
is 16 bytes on ALL PA-RISC
processors.  We are getting confused by the L2 length reported by the 
PDC.  The PA-8800 is essentially
two PA-8700s integrated on the same die.

See page 10 in this document:
https://parisc.wiki.kernel.org/images-parisc/e/e9/PA-8700wp.pdf

It shows the PA-8700 L1 design.

Dave

-- 
John David Anglin  dave.anglin@bell.net

