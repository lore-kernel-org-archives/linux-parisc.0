Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: hplinux@eagle.grdl.noaa.gov
Cc: parisc-linux@parisc-linux.org, grundler@dsl2.external.hp.com
Subject: Re: [parisc-linux] PA-RISC 0.9.3 + C200 + Visualize-EG = HPMC 
In-Reply-To: Message from hplinux@eagle.grdl.noaa.gov
   of "Wed, 27 Feb 2002 12:03:24 EST." <3C7D115C.9AEE5DDB@eagle.grdl.noaa.gov>
References: <3C7D115C.9AEE5DDB@eagle.grdl.noaa.gov> 
Date: Wed, 27 Feb 2002 10:28:44 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020227172844.2534F485A@dsl2.external.hp.com>
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

hplinux@eagle.grdl.noaa.gov wrote:
> The graphics card on my C200 is a Visualize-EG (A4450A) which is, I
> believe, a GSC vs. PCI card. In any case, trying to start X blanks the
> screen, then a few seconds later I get a High Priority Machine Check
> error as the workstation locks up. Any insights or workarounds most
> appreciated!

We are still trying to figure out what causes the HPMC
with PCI gfx cards. STI console works and that's it for now.

So far, I've figured out that xf1bppPolyGlyphBltBlack() is
the userspace routine that triggers the HPMC. Don't know
the code path how it got there or what happens before hand.

grant
