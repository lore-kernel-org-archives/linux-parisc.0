Return-Path: <soete.joel@tiscali.be>
Received: from smtp-out.tiscali.be (spoolo2.tiscali.be [62.235.13.211])
	by dsl2.external.hp.com (Postfix) with ESMTP id 38D5F48C4
	for <parisc-linux@lists.parisc-linux.org>;
	Sat,  3 Jan 2004 03:51:02 -0700 (MST)
Message-ID: <3FF69EE3.8070101@tiscali.be>
Date: Sat, 03 Jan 2004 10:52:19 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: Ryan Bradetich <rbradetich@uswest.net>
Subject: Re: [parisc-linux] 2.6 & pdc_console pb on c110: "Warning: unable
	to open an initial console."
References: <3FEDF301.5030901@tiscali.be>
	<1073100507.1555.6.camel@laptop.bradetich.net>
In-Reply-To: <1073100507.1555.6.camel@laptop.bradetich.net>
Content-Type: text/plain; charset=us-ascii; format=flowed
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hi Ryan,



Ryan Bradetich wrote:
> Joel,
> 
> Even though you should not need the pdc_console for what you want to do,

Well, I had the opportunity to test pdc_console on my b2k but as well as in 2.4 it make hung the kernel at boot time:
the cdrom green led stay continuously lighted (if I add or remove ide-cdrom support in the kernel)
Unfortunately I never reach to get any relevant toc info to go further in this pb invetigation :(. Now basicaly 2.6 is running on 
this system and so I will try to add some printk() to locate more accurately this event.

> pdc_console should work in theory.  It probably needs to be updated to
> work with the 2.6 kernel.  I will add this to my TODO list.
> 
Ah ok I will waiting some news so.

Thanks also and happy new year,
	Joel
