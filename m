From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] parisc: check hardcoded value of SHMLBA against value
 reported by firmware
Date: Tue, 29 Oct 2013 22:28:29 +0100
Message-ID: <5270287D.2030308@gmx.de>
References: <20131029210544.GA18167@p100.box> <1383081984.2071.34.camel@dabdike.int.hansenpartnership.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Cc: linux-parisc@vger.kernel.org
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1383081984.2071.34.camel@dabdike.int.hansenpartnership.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 10/29/2013 10:26 PM, James Bottomley wrote:
> On Tue, 2013-10-29 at 22:05 +0100, Helge Deller wrote:
>> Our value of SHMLBA is hardcoded to 4MB on parisc due to aliasing restrictions
>> of the platform. The firmware function PDC_CACHE does return the machine
>> dependend value of this aliasing requirement.
>> So, if there is a difference between those two - which we don't expect - let's
>> report it at least.
> 
> We know that architecturally it's defined to be 16MB.  However, we also
> know from the chip architects that the greatest stride ever done or
> planned was 4MB, which is why we use it.  HPUX does the same, so there's
> not much point issuing a warning, because it's likely that IODC isn't
> setting up the values correctly and there's nothing a warning will
> achieve except worrying the users if they bother to read it.

Ok, thanks for this info.
I'll drop that patch.

Helge

