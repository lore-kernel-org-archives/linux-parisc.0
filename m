From: rubisher <rubisher@scarlet.be>
Subject: Re: Yet another ccio fix idea?
Date: Sat, 15 Mar 2008 12:03:05 +0000
Message-ID: <47DBBAF9.8070205@scarlet.be>
References: <20080314153512.0AEAC4E6A@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: James.Bottomley@HansenPartnership.com, soete.joel@scarlet.be,
	grundler@parisc-linux.org, linux-parisc@vger.kernel.org,
	kyle@parisc-linux.org, matthew@wil.cx
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080314153512.0AEAC4E6A@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

John David Anglin wrote:
>>> The depw will operate on the left word.  Looks like it should be
>>>
>>>         asm volatile("depw  %1,31,12,%R0" : "+r" (pa) : "r" (hints));
> 
> Sorry, the `R' to access the right half of pa is needed when generating
> 32-bit code.  The original form might be ok when generating 64-bit
> code but I'd have to check the arch.  With 64-bit code, you might need
> to use depd.  The other approach might be to change pa to u32.
> 
> Dave
Ok if I have some time next week I will check.

Tx,
	r.
