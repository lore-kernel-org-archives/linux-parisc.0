From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [PATCH][linux-2.6] Fix gcc 4.4 warning in lba_pci.c
Date: Tue, 23 Jun 2009 00:31:21 -0600
Message-ID: <20090623063121.GA10963@lackof.org>
References: <20090620232927.GA21560@lackof.org> <20090621000635.6824C4FC6@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Grant Grundler <grundler@parisc-linux.org>,
	James.Bottomley@HansenPartnership.com, kyle@mcmartin.ca,
	deller@gmx.de, linux-parisc@vger.kernel.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090621000635.6824C4FC6@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, Jun 20, 2009 at 08:06:34PM -0400, John David Anglin wrote:
> > In the meantime...if someone can explain this error I could build and test:
> > fs/nfs/nfsroot.c:400: error: __setup_str_nfs_root_setup causes a section type conflict
> > 
> > something to do with __setup(nfs_root_setup) but it's not obvious to me what.
> 
> Google says see:
> http://lkml.org/lkml/2009/5/26/329

Thank you...removing the __initconst added by this change:
-static match_table_t __initconst tokens = {
+static const match_table_t tokens __initconst = {

allows me to build. Is no one else building with NFSROOT enabled?

thanks,
grant
