From: tsbogend@alpha.franken.de (Thomas Bogendoerfer)
Subject: Re: [parisc-linux] Get your Matrox PCI cards out of the basement ...
Date: Thu, 3 Jun 2004 15:38:19 +0200
Message-ID: <20040603133819.GB1949@solo.franken.de>
References: <20040602221734.GA26176@solo.franken.de>
	<20040603032304.GA22448@sal.ucc.ie>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040603032304.GA22448@sal.ucc.ie>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, Jun 03, 2004 at 04:23:04AM +0100, M. Grabert wrote:
> beast kernel: matroxfb: Pixel PLL not locked after 5 secs
> beast kernel: matroxfb: Loop PLL not locked after 5 secs

bad, either the PLL setup write didn't reach hardware, or
reading of the locked bit of the PLL fails. It looks like
the PCI subsystem behaves differently between my B2600 and
your C3000 :-(

> N.B. the "PLL not locked after 5 secs" messages also appear when
> I try to change the resolution with fbset. fbset is busy for some
> seconds (at first I thought the process locked up), but then returns

makes sense. fbset triggers a reprogramming of the PLL and that
fails aber 5 seconds.

> Any hints?

not at the moment :-(

Can anybody describe the difference of the PCI bus between C3000 and
B2600 ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessary a
good idea.                                 [ Alexander Viro on linux-kernel ]
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
