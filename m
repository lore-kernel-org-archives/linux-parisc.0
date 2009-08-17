From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: kernel segv with 2.6.31-rc6 ?
Date: Mon, 17 Aug 2009 17:04:32 -0500
Message-ID: <1250546672.7858.85.camel@mulgrave.site>
References: <4A89CC4D.5040801@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain
Cc: linux-parisc <linux-parisc@vger.kernel.org>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4A89CC4D.5040801@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, 2009-08-17 at 23:31 +0200, Helge Deller wrote:
> anyone else seeing this with 2.6.31-rc6 ?
> 
> <...system boots up...>
> Waiting for /dev to be fully populated...
>   
> sysfs: cannot create duplicate filename '/module/ac97_bus/sections/.text'

Not on ion.  However, it could be linker discrepancies ... what does 

objdump -x

show for the module in question ... does it have two .text sections?

James


