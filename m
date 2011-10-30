From: John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH] parisc: futex: Use same lock set as lws calls
Date: Sun, 30 Oct 2011 12:13:00 -0400
Message-ID: <BLU0-SMTP8183F951B80BB9F5455EB297D10@phx.gbl>
References: <20111009204010.GA22374@hiauly1.hia.nrc.ca> <CADZpyizJwcEFNLZyhd74wDyFvrgNpD6j+2cRhjR7ZkL0xTWAgA@mail.gmail.com> <BLU0-SMTP13C59771871C90183AFBCB97D10@phx.gbl> <2746859.nK5NlKbf2R@donald.sf-tec.de>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Cc: linux-parisc <linux-parisc@vger.kernel.org>
To: Rolf Eike Beer <eike-kernel@sf-tec.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <2746859.nK5NlKbf2R@donald.sf-tec.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 30-Oct-11, at 11:31 AM, Rolf Eike Beer wrote:

> John David Anglin wrote:
>
>> This problem is fixed in the GCC trunk and 4.4, 4.5 and 4.6 branches.
>> libmpfr4-3.1.0 now passes all tests.
>
> Can we get a link to a bug or a commit so we could easily put this  
> into the
> gentoo patchset for local usage until a new version is released?


The trunk patch is on the gcc-patches list:
http://gcc.gnu.org/ml/gcc-patches/2011-10/msg02758.html

There are two variants of the patch:
http://gcc.gnu.org/viewcvs?view=revision&revision=180655
http://gcc.gnu.org/viewcvs?view=revision&revision=180662

The first is for 4.7.  The latter applies to 4.4, 4.5 and 4.6.

Dave
--
John David Anglin	dave.anglin@bell.net



