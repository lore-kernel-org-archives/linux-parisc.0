From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [PATCH][linux-2.6] Fix gcc 4.4 warning in lba_pci.c
Date: Tue, 23 Jun 2009 23:31:46 -0600
Message-ID: <20090624053146.GA29485@lackof.org>
References: <20090620232927.GA21560@lackof.org> <20090621000635.6824C4FC6@hiauly1.hia.nrc.ca> <20090623063121.GA10963@lackof.org> <119aab440906230439k6a145ddfwd7f44f742260b93d@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Grant Grundler <grundler@parisc-linux.org>,
	John David Anglin <dave@hiauly1.hia.nrc.ca>,
	James.Bottomley@hansenpartnership.com, kyle@mcmartin.ca,
	deller@gmx.de, linux-parisc@vger.kernel.org
To: Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab440906230439k6a145ddfwd7f44f742260b93d@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Jun 23, 2009 at 07:39:37AM -0400, Carlos O'Donell wrote:
> On Tue, Jun 23, 2009 at 2:31 AM, Grant
...
> > allows me to build. Is no one else building with NFSROOT enabled?
> 
> I boot directly from disk on both my test machines (a500, c3k).

Me too in general...but I still have that enabled since the
Cupertino test ring have multiple machines and it's quite easy
to test with NFS root.

thanks,
grant
