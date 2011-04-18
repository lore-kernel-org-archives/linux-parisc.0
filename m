From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: Debian bug 622997
Date: Sun, 17 Apr 2011 21:51:55 -0600
Message-ID: <20110418035155.GA26613@parisc-linux.org>
References: <20110417151147.326EC4FCB@hiauly1.hia.nrc.ca> <1303053807.2583.1.camel@mulgrave.site> <1303068487.2583.7.camel@mulgrave.site> <20110418012519.GA25505@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>,
	linux-parisc@vger.kernel.org, 622997@bugs.debian.org
To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20110418012519.GA25505@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, Apr 17, 2011 at 09:25:19PM -0400, John David Anglin wrote:
...
> Confirm that removing this module restores boot.
> 
> This is excellent detective work.  If I might ask, how did you trace
> the module loads and successful inits?

Dave,
Besides hacking in printk's, often "initcall_debug" kernel parameter is enough
narrow down which module is hanging or crashing the system.

hth,
grant

