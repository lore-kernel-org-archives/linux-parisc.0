Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id CAA01223
	for <parisc-linux@puffin.external.hp.com>; Thu, 25 Jan 2001 02:52:39 -0700
Received: from pc188-bre9.cable.ntl.com (HELO rhirst.linuxcare.com) (213.105.88.188)
  by mailserv2.iuinc.com with SMTP; 25 Jan 2001 09:56:34 -0000
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 1D45AB008; Thu, 25 Jan 2001 09:44:32 +0000 (GMT)
Date: Thu, 25 Jan 2001 09:44:32 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Greg Ingram <ingram@symsys.com>
Cc: Grant Grundler <grundler@cup.hp.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] C100 and newest CVS bits
Message-ID: <20010125094431.L3571@linuxcare.com>
References: <200101241708.JAA20961@milano.cup.hp.com> <Pine.LNX.4.21.0101241157050.25744-100000@maestro.symsys.com> <20010124191457.H3571@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010124191457.H3571@linuxcare.com>; from rhirst@linuxcare.com on Wed, Jan 24, 2001 at 07:14:57PM +0000
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Jan 24, 2001 at 07:14:57PM +0000, Richard Hirst wrote:
> Your original message (assert size > 0) implies that one of the scsi
> drivers has passed down a request to map a zero length buffer.  That

That was indeed the case.  Something asks sim700.c to do a bidirectional
trasfer of length 0.  Fixed sim700.c to not pci_map_single() on such
requests.  Should be ok now.

Richard
