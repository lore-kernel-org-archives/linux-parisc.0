From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: binutils ICE while building todays gcc HEAD on hppa-linux
Date: Wed, 25 Jun 2003 21:34:12 -0400 (EDT)
Message-ID: <200306260134.h5Q1YCE2009363__12607.8433976092$1416622540$gmane$org@hiauly1.hia.nrc.ca>
References: <200306260130.h5Q1U2x4009324@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: amodra@bigpond.net.au, doko@cs.tu-berlin.de,
	parisc-linux@lists.parisc-linux.org, binutils@sources.redhat.com
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <200306260130.h5Q1U2x4009324@hiauly1.hia.nrc.ca> from "John David Anglin" at Jun 25, 2003 09:30:02 pm
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

> @@ -3807,6 +3807,9 @@ elf32_hppa_relocate_section (output_bfd,
>  			  do_plt = 1;
>  			}
>  		    }
> +
> +	          if (off >= (bfd_vma) -2)
> +		    break;

Oops, we should abort here.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
