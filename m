From: John David Anglin <dave.anglin@bell.net>
Subject: Re: PCI resource problem on C360
Date: Thu, 3 Aug 2017 19:17:48 -0400
Message-ID: <830FE285-995A-4274-AC6E-A913D723B9D8@bell.net>
References: <20170803140717.GA7380@alpha.franken.de> <89A4641B-DE37-41B1-9F9C-B6312F8F0C84@bell.net> <4d46bfba-170f-2c79-cf69-45d02ccc5a9f@gmx.de>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: text/plain; charset=us-ascii
Cc: Tom Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-parisc@vger.kernel.org
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4d46bfba-170f-2c79-cf69-45d02ccc5a9f@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 2017-08-03, at 6:45 PM, Helge Deller wrote:

> On 03.08.2017 17:58, John David Anglin wrote:
>> On 2017-08-03, at 10:07 AM, Tom Bogendoerfer wrote:
>> 
>>> Is this a known problem ? Source tree is current parisc git.
>> 
>> I don't think so.  Doesn't happen on rp3440:
> 
> I had lots of such problems when I tried various VGA and other
> PCI cards in my c3000.
> 
> I think HP designed many of the PCI slots for special usage only,
> e.g. some slots allow PCI graphic cards while others don't.
> 
> Maybe plug your cards one-by-one into another slot and check again?

There's something about the firmware disabling dual graphics adapters in slots 1 or 2
if another is plugged into 3 or 4 in the user guide.  I would try slot 4 first.

Some C series units had feeble power supplies and various combination of HP graphics
cards aren't supported.

The c3000 has some PCIX slots and maybe both 3.3 and 5V PCI slots.

I suggest 64bit kernel as it is best tested.

Dave
--
John David Anglin	dave.anglin@bell.net



