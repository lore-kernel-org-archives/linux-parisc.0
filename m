Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id IAA27767
	for <parisc-linux@puffin.external.hp.com>; Fri, 3 Nov 2000 08:47:42 -0700
Date: Fri, 3 Nov 2000 10:49:00 -0500
From: Phillip Beal <pdbeal@louisville.edu>
To: Alex deVries <adevries@linuxcare.com>
Cc: Phillip Beal <pdbeal01@athena.louisville.edu>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] STI Console problems on 735 and 755
Message-ID: <20001103104900.B68620@athena.louisville.edu>
References: <20001103100239.A37904@athena.louisville.edu> <3A02E9B4.5B93F47@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3A02E9B4.5B93F47@linuxcare.com>; from adevries@linuxcare.com on Fri, Nov 03, 2000 at 11:37:08AM -0500
List-ID: <linux-parisc.vger.kernel.org>

> What kind of graphics hardware is sitting on a 735 or 755?  I think
> we've only ever looked at that on a 712 and 715.  

Both the 735 and the 755 have the following device, that seems be refer
to the graphics:

Coral SGC Graphics (10) at 0xf8000000, version 0x4, 0x0, 0x77, 0x0, 0x0

However, the 755 is known only to use mono graphics, even though they
both report the same info for the Coral SGC Grpahics. 

I hope this helps,

> Can you use serial console in the meantime?

Yeah, serial works just fine.

> 
> - Alex
> 
> -- 
> Alex deVries, Principal Solutions Architect, The Puffins at Linuxcare
> 613.562.2759 tel
> alex@linuxcare.com, http://www.linuxcare.com/
> Linuxcare, Support for the revolution.

-- 
Phillip Beal
Electrical and Computer Engineering
S+LUG Vice-President
