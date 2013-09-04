From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: Re: Does there exists any 32bit-only PARISC SMP machines?
Date: Wed, 4 Sep 2013 10:44:38 +0200
Message-ID: <20130904084438.GB4498@alpha.franken.de>
References: <521F9848.4010404@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc <linux-parisc@vger.kernel.org>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <521F9848.4010404@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, Aug 29, 2013 at 08:51:52PM +0200, Helge Deller wrote:
> So, are there any 32bit SMP machines out there?

Workstations:

J200, J210, J210XC

Server:

D250, D260, D270, D280, D350, D360
G70, H70, U70
K200, K210, K220

and some obscure beasts like T500, T520.

http://www.openpa.net/systems/index.html

has a good list.

I own an J200 with 2 CPUs. Never booted linux on it so far.

> Any other thoughts on this topic?

I'd skip supplying a 32bit SMP kernel package until there is a real demand
for it.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
