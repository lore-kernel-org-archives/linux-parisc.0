Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Wed, 27 Aug 2003 16:18:57 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: mmogenius@v8fiesta.co.uk
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] x86 on b2000
Message-ID: <20030827221857.GG31311@dsl2.external.hp.com>
References: <20030827034036.GA9928@dsl2.external.hp.com> <72F3D1D0-D84B-11D7-8E2F-000393581E44@speakeasy.net> <20030827060516.GA11642@dsl2.external.hp.com> <20030827100630.7a3eb14f.varenet@esiee.fr> <1061976142.3f4c784e354b9@webmail.v8fiesta.co.uk> <1062015588.3f4d126503447@webmail.v8fiesta.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1062015588.3f4d126503447@webmail.v8fiesta.co.uk>
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

On Wed, Aug 27, 2003 at 09:19:49PM +0100, mmogenius@v8fiesta.co.uk wrote:
> so the basics of it is can the b2000 support an additional vga card
> other then the onboard graphics card?

If a PCI slot is available, I would expect a PCI Vis-EG card to work.

> presumabely i need a card that is compatable with 
> the box rather then any old card off the shelf ?

I think so.

> of is there more likleyhood that there will be support for this card in x ?

PCI Vis-EG + stifb driver works under xf86.

grant
