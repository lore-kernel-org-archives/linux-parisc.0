From: Helge Deller <deller@gmx.de>
Subject: Re: PCI resource problem on C360
Date: Fri, 4 Aug 2017 00:45:31 +0200
Message-ID: <4d46bfba-170f-2c79-cf69-45d02ccc5a9f@gmx.de>
References: <20170803140717.GA7380@alpha.franken.de>
 <89A4641B-DE37-41B1-9F9C-B6312F8F0C84@bell.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Cc: linux-parisc@vger.kernel.org
To: Tom Bogendoerfer <tsbogend@alpha.franken.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <89A4641B-DE37-41B1-9F9C-B6312F8F0C84@bell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 03.08.2017 17:58, John David Anglin wrote:
> On 2017-08-03, at 10:07 AM, Tom Bogendoerfer wrote:
> 
>> Is this a known problem ? Source tree is current parisc git.
> 
> I don't think so.  Doesn't happen on rp3440:

I had lots of such problems when I tried various VGA and other
PCI cards in my c3000.

I think HP designed many of the PCI slots for special usage only,
e.g. some slots allow PCI graphic cards while others don't.

Maybe plug your cards one-by-one into another slot and check again?

Helge
