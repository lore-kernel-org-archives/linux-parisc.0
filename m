Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA04135
	for <parisc-linux@puffin.external.hp.com>; Wed, 23 Aug 2000 13:05:58 -0600
Date: Wed, 23 Aug 2000 15:05:15 -0400 (EDT)
From: Andrew Park <apark@cdf.toronto.edu>
To: Matt Taggart <taggart@carmen.fc.hp.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: Switch to serial console ( was Re: [parisc-linux] disk required?
 )
In-Reply-To: <20000823181034.19BAC381A0@carmen.fc.hp.com>
Message-ID: <Pine.SOL.4.21.0008231500570.10441-100000@misty.cdf>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Wed, 23 Aug 2000, Matt Taggart wrote:

> This is the point where the kernel switches over to serial console. The 
> machine is still running, just attach a serial console or use minicom or 
> something.
> 
> Unfortunately this is quickly becoming a FAQ. I wish we had documented it in 
> the CD README. It doesn't help that the last message you see is "pdc_cons die".


hmmm....  I found the following quote from

http://www.oswg.org/oswg-nightly/oswg/en_US.ISO_8859-1/articles/parisc-linux/parisc-linux-boot.html#CONSOLES

<quote>
3.1.2.3.3. How can I change the boot console to serial on a 712?

  Unfortunately, you can't. Although 712s are configured for in-house
       HP development to use serial console, this configuration isn't
  supported in the field. You have to use a graphics console for 712s.
</quote>

I have 712/80 (sorry, I should have mentioned earlier).  Would I still
be able to use a serial console despite what the documentation says?
Thanks


Andrew Park
           
________________________________________________________________________ 
CDFlab Systems Administrator                       www.cdf.utoronto.ca |
GnuPG Signature              www.cdf.utoronto.ca/~apark/public_key.txt |
------------------------------------------------------------------------
