From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] BUG 2.6.12-rc3-pa1 PCI mmap panic
Date: Sun, 1 May 2005 11:24:02 -0600
Message-ID: <20050501172402.GC17998@colo.lackof.org>
References: <20050501074901.GA13801@colo.lackof.org>
	<4274FC81.4060906@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <4274FC81.4060906@tiscali.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, May 01, 2005 at 03:57:53PM +0000, Joel Soete wrote:
> it's CONFIG_DISCONTIGMEM

What's that mean?
I was hoping someone could explain what the BUG_ON()
that tripped would mean.

> so first of all do you need DISCONTIGMEM?

Erm, define "need". I try to run the same kernels on several
a500s - several of which have > 4GB RAM.

pa8800/ZX1 has 4GB RAM installed but only 1GB is in 32-bit address space.
The rest is remapped by HW to > 32-bit.

> eventhougt what hapened if you don't use this option?

No.

> (it would also boot just miss some ram)

"some" on pa8800 is not ok.
1GB for a 4-way, 1GHz box just isn't right.

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
