Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Mon, 3 Feb 2003 10:30:57 -0700
To: Nahkola Mikko <mnahkola@trinms01.ntc.nokia.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Yet another tar-triggered problem?
Message-ID: <20030203173057.GC17807@dsl2.external.hp.com>
References: <20030203154450.GO7503@aurinko.ntc.nokia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030203154450.GO7503@aurinko.ntc.nokia.com>
From: grundler@dsl2.external.hp.com (Grant Grundler)
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Mon, Feb 03, 2003 at 05:44:50PM +0200, Nahkola Mikko wrote:
> ... the 70096's scrollback was full of something that looks like
> a hex dump, and then a HPMC at the end.

Likely a problem with st or scsi driver.
Not many people are using tape drives so we don't get much
feedback on that.

> Is anyone interested in the hex dump?

Well, TBH, I'd be more interested in one from a 2.4.20 kernel.
Too much code has changed since 2.4.18.

> 
> The HPMC is as follows:
> 		Code=1 regs=102f3080 (Addr=00000000)
> 	
>      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
> PSW: 00000000000001000000000000001110 Not tainted
> r00-03  00000000 10300010 1010d4e8 ffffffff
...
> IASQ: 00000000 00000000 IAOQ: 1024a2d0 1024a2d4

Can you look up (IOAQ) 1024a2d0 and (GR02) 1010d4e8
in the matching System.map?
I'm curious where it died.
Though with HPMCs, it's likely to be a bug in some other code path.

thanks,
grant
