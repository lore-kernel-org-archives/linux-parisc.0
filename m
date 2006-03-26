From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] Re: linux-2.6 deller (ioremap-changes)
Date: Sat, 25 Mar 2006 22:45:53 -0700
Message-ID: <20060326054553.GA9955@colo.lackof.org>
References: <200603230746.37433.deller@gmx.de> <200603260145.k2Q1jwSr012419@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: Helge Deller <deller@gmx.de>,
 parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <grundler@lackof.org>
In-Reply-To: <200603260145.k2Q1jwSr012419@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>

On Sat, Mar 25, 2006 at 08:45:58PM -0500, John David Anglin wrote:
> > But I did booted yesterday the latest CVS 32bit Kernel on my c3k and it worked fine, so I assume you shouldn't see any problems either...
> 
> I tried the default 2.6.16-pa5 from www.parisc-linux.org this afternoon.
> I still get a lot of ip_tables messages on the console which unfortunately
> aren't captured in any log file.

I haven't paid attn to iptables changes but I probably should.
In any case, that will "only" affect things like NAT or firewall.

>   I've attached the diff between 2.6.15-rc7-pa
> and 2.6.16-pa5 dmesg files.  Is the eth0 difference significant?

Yes. One is using MMIO and the other is using IO port space.
c3000defconfig could use MMIO too. I keep forgetting if
the "GSC" Tulips (via card-mode Dino) now reliably can
use MMIO too.

grant
