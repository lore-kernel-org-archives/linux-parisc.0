From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: Patch for segfaults in minifail tests
Date: Fri, 30 Apr 2010 17:11:36 -0400
Message-ID: <20100430211136.GA11644@hiauly1.hia.nrc.ca>
References: <1272651697.2844.39.camel@mulgrave.site>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org, Helge Deller <deller@gmx.de>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1272651697.2844.39.camel@mulgrave.site>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, 30 Apr 2010, James Bottomley wrote:

> It's the essential patch we need to fix up our kmapping.  Right at the
> moment kmap of a page with a dirty cache line in userspace sees stale
> data and kunmap of a page the kernel has modified will see likewise.

Did you try using the version of copy_user_page_asm that uses
equivalent aliasing?   There is an issue with needing cache flushing
noted in pgtable.h, but if this works it may be less of a hammer.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
