Return-Path: <willy@www.linux.org.uk>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk
	[195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1CE8048E1
	for <parisc-linux@lists.parisc-linux.org>;
	Mon, 26 Jan 2004 10:25:09 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 1AlATx-0006OW-NP; Mon, 26 Jan 2004 17:25:05 +0000
Date: Mon, 26 Jan 2004 17:25:05 +0000
From: Matthew Wilcox <willy@debian.org>
To: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] A fix for B2k and CONFIG_PDC_CONSOLE pb
Message-ID: <20040126172505.GQ11844@parcelfarce.linux.theplanet.co.uk>
References: <20040124210320.GA16272@colo.lackof.org>
	<400CB8A100004C60@ocpmta3.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <400CB8A100004C60@ocpmta3.freegates.net>
Sender: <willy@www.linux.org.uk>
Cc: Christoph Plattner <christoph.plattner@gmx.at>,
	Grant Grundler <grundler@parisc-linux.org>,
	parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Mon, Jan 26, 2004 at 06:00:53PM +0100, Joel Soete wrote:
>  
>  	/* Bail if no console input device. */
> -	if (!PAGE0->mem_kbd.iodc_io)
> +	if ((PAGE0->mem_cons.cl_class != CL_DUPLEX) && !PAGE0->mem_kbd.iodc_io)
>  		return 0;
>  	
>  	/* wait for a keyboard (rs232)-input */
>  	spin_lock_irqsave(&pdc_lock, flags);
> -	real32_call(PAGE0->mem_kbd.iodc_io,
> -		    (unsigned long)PAGE0->mem_kbd.hpa, ENTRY_IO_CIN,
> -		    PAGE0->mem_kbd.spa, __pa(PAGE0->mem_kbd.dp.layers), 
> -		    __pa(iodc_retbuf), 0, __pa(iodc_dbuf), 1, 0);
> +	if (PAGE0->mem_cons.cl_class == CL_DUPLEX)

This doesn't make sense.  PAGE0->mem_cons.cl_class has to be CL_DUPLEX
otherwise the test above would have failed.  Do you perhaps mean that &&
above to be an || ?  If so, this would all read better as ...

	/* wait for a keyboard (rs232)-input */
	spin_lock_irqsave(&pdc_lock, flags);
	if (PAGE0->mem_cons.cl_class == CL_DUPLEX) {

		real32_call(PAGE0->mem_cons.iodc_io,
			    (unsigned long)PAGE0->mem_cons.hpa, ENTRY_IO_CIN,
			    PAGE0->mem_cons.spa, __pa(PAGE0->mem_cons.dp.layers), 
			    __pa(iodc_retbuf), 0, __pa(iodc_dbuf), 1, 0);
	} else if (PAGE0->mem_kbd.iodc_io) {
		real32_call(PAGE0->mem_kbd.iodc_io,
			    (unsigned long)PAGE0->mem_kbd.hpa, ENTRY_IO_CIN,
			    PAGE0->mem_kbd.spa, __pa(PAGE0->mem_kbd.dp.layers), 
			    __pa(iodc_retbuf), 0, __pa(iodc_dbuf), 1, 0);
	} else {
		spin_unlock_irqrestore(&pdc_lock, flags);
		return 0;
	}

Slightly ugly to have two unlocks for the same lock, but that's better
than duplicating the test.  I haven't looked at the code, maybe we could
use a goto instead.

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain
