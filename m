From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: Bug#539378: [hppa]: fails to load nfs module: Global Offset Table
Date: Fri, 31 Jul 2009 20:37:39 +2000 (EDT)
Message-ID: <20090801003740.8BBDE5160@hiauly1.hia.nrc.ca>
References: <4A73821A.4020506@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: kyle@mcmartin.ca, carlos@systemhalted.org, elendil@planet.nl,
	539378@bugs.debian.org, debian-hppa@lists.debian.org,
	linux-parisc@vger.kernel.org, randolph@tausq.org,
	submit@bugs.debian.org
To: deller@gmx.de (Helge Deller)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4A73821A.4020506@gmx.de> from "Helge Deller" at Aug 1, 2009 01:45:30 am
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

>  	case ELF_STUB_GOT:
> -		stub->insns[0] = 0x537b0000;	/* ldd 0(%dp),%dp	*/
> +		stub->insns[0] = 0x537b0000;    /* ldd 0(%dp),%dp	*/
>  		stub->insns[1] = 0x53610020;	/* ldd 10(%dp),%r1	*/
>  		stub->insns[2] = 0xe820d000;	/* bve (%r1)		*/
>  		stub->insns[3] = 0x537b0030;	/* ldd 18(%dp),%dp	*/
>  
> -		stub->insns[0] |= reassemble_14(get_got(me, value, addend) & 0x3fff);
> +		d = get_got(me, value, addend);
> +		if (d <= 15)
> +			stub->insns[0] |= reassemble_14(d);

reassemble_14 is wrong for ldd format 3.  Need format 5 and im5 insertion.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
