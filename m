From: Jeroen Roovers <jer@gentoo.org>
Subject: Re: 3.12.8 is doing nasty things
Date: Fri, 24 Jan 2014 22:07:23 +0100
Message-ID: <20140124220723.5985ac4e@marga.jer-c2.orkz.net>
References: <2696873.HIAXvrDslF@caliban.sf-tec.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: Rolf Eike Beer <eike-kernel@sf-tec.de>
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <2696873.HIAXvrDslF@caliban.sf-tec.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, 24 Jan 2014 21:44:51 +0100
Rolf Eike Beer <eike-kernel@sf-tec.de> wrote:

> I reported that I saw strange things happening after upgrading to
> 3.12.5. Meanwhile I upgraded to 3.12.8 and things became worse. I
> regularly see processes to fail randomly. I can see this as I
> somethimes get failures in my nagios because the SSH connection to
> the watched host (only the watched one runs .8) fails.

Confirmed with any kernel above 3.12.2 that I cared to test (I didn't
test 3.12.3). The issues vary from illegal instructions to segmentation
faults to double frees in userland, so it's basically a "random" thing.
I can't say it's become "worse" after 3.12.5 (since I haven't kept per
version statistics).


Regards,
     jer
