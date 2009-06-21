From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [PATCH][linux-2.6] Fix gcc 4.4 warning in lba_pci.c
Date: Sat, 20 Jun 2009 20:06:34 -0400 (EDT)
Message-ID: <20090621000635.6824C4FC6@hiauly1.hia.nrc.ca>
References: <20090620232927.GA21560@lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: James.Bottomley@HansenPartnership.com, grundler@parisc-linux.org,
	kyle@mcmartin.ca, deller@gmx.de, linux-parisc@vger.kernel.org
To: grundler@parisc-linux.org (Grant Grundler)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090620232927.GA21560@lackof.org> from "Grant Grundler" at Jun 20, 2009 05:29:27 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> In the meantime...if someone can explain this error I could build and test:
> fs/nfs/nfsroot.c:400: error: __setup_str_nfs_root_setup causes a section type conflict
> 
> something to do with __setup(nfs_root_setup) but it's not obvious to me what.

Google says see:
http://lkml.org/lkml/2009/5/26/329

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
