Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: Matthew Wilcox <willy@debian.org>,
	Carlos O'Donell <carlos@baldric.uwo.ca>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] malloc limits 
In-Reply-To: Message from Matthew Wilcox <willy@debian.org>
   of "Sat, 21 Sep 2002 05:14:17 BST." <20020921051417.P10583@parcelfarce.linux.theplanet.co.uk>
References: <20020920203724.GD24622@systemhalted> <200209210338.g8L3ccnN005029@hiauly1.hia.nrc.ca>  <20020921051417.P10583@parcelfarce.linux.theplanet.co.uk> 
Date: Fri, 20 Sep 2002 22:46:12 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020921044612.A753D4829@dsl2.external.hp.com>
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

Matthew Wilcox wrote:
> On Fri, Sep 20, 2002 at 11:38:37PM -0400, John David Anglin wrote:
> > I thought there was a flat memory model.  If so, shouldn't it be possible
> > for the data section to expand past 0x80000000?
> 
> There is a flat memory model... libs are mapped at 0x4000'0000 so that's
> not it.  worth looking at /proc/$pid/maps for that process, maybe?

is 0x80000000 the address or the size?
If it's the size then you get up into 0xc0000000 (which is ok).
Getting up into 0xf0000000 - 0xffffffff address is not.

grant
