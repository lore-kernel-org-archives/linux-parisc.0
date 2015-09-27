From: John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH v2][RFC] parisc: Change L1_CACHE_BYTES to 16
Date: Sun, 27 Sep 2015 12:46:40 -0400
Message-ID: <87729342-A3F6-453F-BA6F-EF3C096AA92A@bell.net>
References: <42430464-867C-4E0B-8E95-C6CDB6D8A0B2@bell.net> <32A3BF6F-B243-4AD4-9AE9-A5F9DAE0270A@bell.net> <1443370656.2222.3.camel@HansenPartnership.com>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc List <linux-parisc@vger.kernel.org>,
	Helge Deller <deller@gmx.de>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1443370656.2222.3.camel@HansenPartnership.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 2015-09-27, at 12:17 PM, James Bottomley wrote:

> What makes you think we need SMP_CACHE_BYTES to be different from
> L1_CACHE_BYTES?  No other architecture does this.  The theory that gives
> us two defines was that some SMP systems would arbitrate for memory at
> geater than cache line offsets but, in practise, none does because
> that's the level at which the cross CPU memory ownership model works
> anyway.

I was just keeping the values we had before.  Changing to the new L1_CACHE_BYTES
value probably needs testing.

Dave
--
John David Anglin	dave.anglin@bell.net



