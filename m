From: Stuart Brady <sdbrady@ntlworld.com>
Subject: Re: [parisc-linux] HCRX-24 and missing consoles on my C200
Date: Wed, 7 Dec 2005 20:17:50 +0000
Message-ID: <20051207201749.GA30737__28111.8279476233$1416624573$gmane$org@ntlworld.com>
References: <43971676.1010009@gmail.com>
	<20051207180130.GB11417@colo.lackof.org>
	<20051207182913.GB32168@quicksilver.road.mcmartin.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: debian-hppa@lists.debian.org,
 parisc-linux@parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20051207182913.GB32168@quicksilver.road.mcmartin.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wed, Dec 07, 2005 at 01:29:13PM -0500, Kyle McMartin wrote:
> I think I have a HCRX here (A4070 with A4072), I can try and fix this
> but not until at least January.

This looks like the same card that I have:

1. Coral SGC Graphics at 0xf4000000 [0] { 10, 0x0, 0x004, 0x00077 }
...
STI GSC/PCI core graphics driver Version 0.9a
id 2bcb015a-9a02587, conforms to spec rev. 8.04
graphics card name: HPA4071B_LZ

I tested this recently on my 715/100:

http://lists.parisc-linux.org/pipermail/parisc-linux/2005-November/027654.html

(Worked fine, except for a few small glitches.)
-- 
Stuart Brady
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
