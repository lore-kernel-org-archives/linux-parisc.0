From: LaMont Jones <lamont@hp.com>
Subject: Re: [parisc-linux] second sr0 patch
Date: Sun, 23 Feb 2003 15:20:35 -0700 (MST)
Message-ID: <20030223222035.26E3812133__26411.9902895347$1416622233$gmane$org@security.hp.com>
References: <20030223204842.E2938@parcelfarce.linux.theplanet.co.uk>
Cc: binutils@sources.redhat.com, parisc-linux@lists.parisc-linux.org
To: willy@debian.org (Matthew Wilcox)
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <20030223204842.E2938@parcelfarce.linux.theplanet.co.uk>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

In article <20030223204842.E2938@parcelfarce.linux.theplanet.co.uk> you wrote:

> --- gas/config/tc-hppa.c	23 Jan 2003 12:51:04 -0000	1.102
> +++ gas/config/tc-hppa.c	23 Feb 2003 19:21:09 -0000
> @@ -1794,7 +1794,7 @@ pa_ip (str)
>  	      if (!pa_parse_number (&s, 0))
>  		break;
>  	      num = pa_number;
> -	      CHECK_FIELD (num, 3, 0, 1);
> +	      CHECK_FIELD (num, 3, 1, 1);
>  	      INSERT_FIELD_AND_CONTINUE (opcode, num, 14);
>  
>  	    /* Handle a 3 bit space identifier at 18.  */

I don't think this is a good plan.  Emit a warning, sure, but there is
a large collection of legacy PARISC assembly code out there that has
this perfectly legal, and hp-ux assembler-accepted-from-day-0 construct.

lamont
