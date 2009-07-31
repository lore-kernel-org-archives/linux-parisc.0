From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: Bug#539378: [hppa]: fails to load nfs module: Global Offset Table
Date: Fri, 31 Jul 2009 21:16:37 +2000 (EDT)
Message-ID: <20090801011638.865854CFD@hiauly1.hia.nrc.ca>
References: <20090801003740.8BBDE5160@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: deller@gmx.de, kyle@mcmartin.ca, carlos@systemhalted.org,
	elendil@planet.nl, 539378@bugs.debian.org,
	debian-hppa@lists.debian.org, linux-parisc@vger.kernel.org,
	randolph@tausq.org, submit@bugs.debian.org
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090801003740.8BBDE5160@hiauly1.hia.nrc.ca> from "John David Anglin" at Jul 31, 2009 08:37:39 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> >  	case ELF_STUB_GOT:
> > -		stub->insns[0] = 0x537b0000;	/* ldd 0(%dp),%dp	*/
> > +		stub->insns[0] = 0x537b0000;    /* ldd 0(%dp),%dp	*/
> >  		stub->insns[1] = 0x53610020;	/* ldd 10(%dp),%r1	*/
> >  		stub->insns[2] = 0xe820d000;	/* bve (%r1)		*/
> >  		stub->insns[3] = 0x537b0030;	/* ldd 18(%dp),%dp	*/
> >  
> > -		stub->insns[0] |= reassemble_14(get_got(me, value, addend) & 0x3fff);
> > +		d = get_got(me, value, addend);
> > +		if (d <= 15)
> > +			stub->insns[0] |= reassemble_14(d);
> 
> reassemble_14 is wrong for ldd format 3.  Need format 5 and im5 insertion.

The format 5 version of ldd 0(%dp),%dp is 0x0f6010db.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
