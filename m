Return-Path: <willy@www.linux.org.uk>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk
	[195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5A2F44834
	for <parisc-linux@lists.parisc-linux.org>;
	Sat,  1 May 2004 18:55:18 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 1BK5GG-0003gb-C5; Sun, 02 May 2004 01:55:16 +0100
Date: Sun, 2 May 2004 01:55:16 +0100
From: Matthew Wilcox <willy@debian.org>
To: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: Re: [parisc-linux] Changing hppa default on panic to "reboot after
	180 seconds"?
Message-ID: <20040502005516.GE2281@parcelfarce.linux.theplanet.co.uk>
References: <20040501223343.GX12850@baldric.uwo.ca>
	<20040501224554.GY12850@baldric.uwo.ca>
	<20040501225507.GZ12850@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20040501225507.GZ12850@baldric.uwo.ca>
Sender: <willy@www.linux.org.uk>
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Sat, May 01, 2004 at 06:55:08PM -0400, Carlos O'Donell wrote:
> So how about this hookup?
> 
> @@ -452,9 +452,8 @@ void parisc_terminate(char *msg, struct 
>  	 * system will shut down immediately right here. */
>  	pdc_soft_power_button(0);
>  	
> -	/* Gutter the processor! */
> -	for(;;)
> -	    ;
> +	/* Call kernel panic() so reboot timeouts work properly */
> +	panic(msg);
>  }

We already output the msg; doing this would output it twice ...

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain
