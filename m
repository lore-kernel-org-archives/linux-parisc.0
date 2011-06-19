From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: Stuck gnat1 processes
Date: Sun, 19 Jun 2011 17:30:47 -0400
Message-ID: <20110619213047.GA1817@hiauly1.hia.nrc.ca>
References: <20110610013034.GA5353@hiauly1.hia.nrc.ca> <20110610123719.GD29089@parisc-linux.org> <20110619205147.GA1430@hiauly1.hia.nrc.ca>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>,
	linux-parisc@vger.kernel.org
To: Matthew Wilcox <matthew@wil.cx>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20110619205147.GA1430@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, 19 Jun 2011, John David Anglin wrote:

> I suspect a race in interrupt handling.  Note the SLOW timer message
> associated with gnat1 process on cpu0.  Also, cpu0 doesn't seem active.

Specifically, do the cpu_mask_irq and __cpu_unmask_irq operations
on cpu_eiem need to be atomic?

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
