Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Fri, 14 Mar 2003 10:29:24 -0700
To: Matthew Wilcox <willy@debian.org>
Cc: Lyonel Vincent <vincentl@ec-lyon.fr>, bruno_vidal@hp.com,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] enumerating devices from user space
Message-ID: <20030314172924.GC24555@dsl2.external.hp.com>
References: <20030313112232.A10172@typhon.pilat.fr> <3E706BE4.E53961BD@hp.com> <20030313134558.6cf9177c.vincentl@ec-lyon.fr> <3E7196C7.8A35605F@hp.com> <20030314133305.4311a8e6.vincentl@ec-lyon.fr> <20030314131921.GG29631@parcelfarce.linux.theplanet.co.uk> <20030314150549.3cb2e2b2.vincentl@ec-lyon.fr> <20030314140848.GI29631@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030314140848.GI29631@parcelfarce.linux.theplanet.co.uk>
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

On Fri, Mar 14, 2003 at 02:08:48PM +0000, Matthew Wilcox wrote:
> On Fri, Mar 14, 2003 at 03:05:49PM +0100, Lyonel Vincent wrote:
> > okokok I won't argue then.
> > I would have liked to have ioscan-like support, but anyway...
> 
> Well, you can have it in 2.5; start looking at sysfs.

willy and I talked offline and it seems like the right
answer is to backport _the user interface_ - ie something
that *looks* like sysfs but could be based on /proc.

I'd basically like to see all resources in struct parisc_device
exported using the same name as the field - matching sysfs field
names use for PCI where appropriate. Willy suggested id be broken
out into it's struct parisc_device_id parts and provided
directly has hex strings (eg hw_type  entry could contain "0x5").
Details of how sysfs currently looks are still changing - don't get
hung up in the current details.

grant
