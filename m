Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 59FBE4A19
	for <parisc-linux@parisc-linux.org>; Sat,  3 Feb 2001 10:24:49 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14P6QH-0003PB-00; Sat, 03 Feb 2001 17:24:29 +0000
Date: Sat, 3 Feb 2001 17:24:29 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: penfold@customware.com.au
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Source of this version of rbootd-2.0-2
Message-ID: <20010203172429.A12985@parcelfarce.linux.theplanet.co.uk>
References: <20010203011748.F26452@parcelfarce.linux.theplanet.co.uk> <200102031525.CAA25557@customware.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200102031525.CAA25557@customware.com.au>; from penfold@customware.com.au on Sun, Feb 04, 2001 at 02:25:37AM +1100
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Sun, Feb 04, 2001 at 02:25:37AM +1100, penfold@customware.com.au wrote:
> And, in my case at least also patch defs.h :
> replace 
> #include <pcap.h>
> with 
> #include <pcap/pcap.h>
> 
> FWIW, I have libpcap-0.4-16.

i'm running debian potato, and i have Version: 0.4a6-3.  i didn't need
to do this.

-- 
Revolutions do not require corporate support.
