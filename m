Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Sun, 30 Mar 2003 14:32:28 -0700
To: Matthew Wilcox <willy@debian.org>
Cc: "M. Grabert" <xam@cs.ucc.ie>, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] RDI Tadpole Precisionbook and Linux/PA-RISC
Message-ID: <20030330213228.GA14983@dsl2.external.hp.com>
References: <Pine.LNX.4.44.0303300852030.25173-100000@sal.ucc.ie> <20030330152036.GC29376@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030330152036.GC29376@parcelfarce.linux.theplanet.co.uk>
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

On Sun, Mar 30, 2003 at 04:20:36PM +0100, Matthew Wilcox wrote:
> > 1MB flash memory
> 
> Don't know how this is hooked up.  Might work, give it a try.

That's NVRAM. I don't know if we've documented the layout.
My gut feeing is only PDC should be touching NVRAM right now.

grant
