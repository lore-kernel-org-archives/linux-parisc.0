Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from typhon.homeip.net (voltaire-102-1-121.net1.nerim.net [213.41.188.121])
	by dsl2.external.hp.com (Postfix) with ESMTP id DBBA8482B
	for <parisc-linux@lists.parisc-linux.org>; Mon, 17 Mar 2003 06:53:34 -0700 (MST)
Date: Mon, 17 Mar 2003 14:53:27 +0100
From: Lyonel Vincent <vincentl@ec-lyon.fr>
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: Matthew Wilcox <willy@debian.org>, bruno_vidal@hp.com,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] enumerating devices from user space
Message-ID: <20030317145327.A4194@typhon.pilat.fr>
Reply-To: vincentl@ec-lyon.fr
References: <20030313112232.A10172@typhon.pilat.fr> <3E706BE4.E53961BD@hp.com> <20030313134558.6cf9177c.vincentl@ec-lyon.fr> <3E7196C7.8A35605F@hp.com> <20030314133305.4311a8e6.vincentl@ec-lyon.fr> <20030314131921.GG29631@parcelfarce.linux.theplanet.co.uk> <20030314150549.3cb2e2b2.vincentl@ec-lyon.fr> <20030314140848.GI29631@parcelfarce.linux.theplanet.co.uk> <20030314172924.GC24555@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030314172924.GC24555@dsl2.external.hp.com>; from grundler@dsl2.external.hp.com on Fri, Mar 14, 2003 at 10:29:24AM -0700
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

Hi Grant,

sounds very good to me (and way cleaner)...
I'll be happy to try to help.

cheers,
lv.

On Fri, Mar 14, 2003 at 10:29:24AM -0700, Grant Grundler wrote:
> On Fri, Mar 14, 2003 at 02:08:48PM +0000, Matthew Wilcox wrote:
> > On Fri, Mar 14, 2003 at 03:05:49PM +0100, Lyonel Vincent wrote:
> > > okokok I won't argue then.
> > > I would have liked to have ioscan-like support, but anyway...
> > 
> > Well, you can have it in 2.5; start looking at sysfs.
> 
> willy and I talked offline and it seems like the right
> answer is to backport _the user interface_ - ie something
> that *looks* like sysfs but could be based on /proc.
> 
> I'd basically like to see all resources in struct parisc_device
> exported using the same name as the field - matching sysfs field
> names use for PCI where appropriate. Willy suggested id be broken
> out into it's struct parisc_device_id parts and provided
> directly has hex strings (eg hw_type  entry could contain "0x5").
> Details of how sysfs currently looks are still changing - don't get
> hung up in the current details.
> 
> grant

-- 
The software said it requires Windows 2000 or better, so I installed Linux.
