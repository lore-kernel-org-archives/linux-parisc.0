Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id B70534865
	for <parisc-linux@lists.parisc-linux.org>; Fri,  5 Jul 2002 05:45:39 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 17QRWs-0001O7-00; Fri, 05 Jul 2002 12:45:38 +0100
Date: Fri, 5 Jul 2002 12:45:38 +0100
From: Matthew Wilcox <willy@debian.org>
To: Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>
Cc: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] mem_pdc_call: how using it exactly.
Message-ID: <20020705124538.Z27706@parcelfarce.linux.theplanet.co.uk>
References: <3D257AAB.D04CD0DC@admin.france.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3D257AAB.D04CD0DC@admin.france.hp.com>; from bruno_vidal@hpfrcu03.france.hp.com on Fri, Jul 05, 2002 at 12:53:31PM +0200
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

On Fri, Jul 05, 2002 at 12:53:31PM +0200, Bruno Vidal wrote:
> static unsigned long pdc_result[32] __attribute__ ((aligned (8)));
> static unsigned long pdc_result2[32] __attribute__ ((aligned (8)));
> 
> /* Get spa for this module */
> hpa=dump_parms->hpa;
> index=0;
> iodc_data_size=32;
> 
> ret = mem_pdc_call(PDC_IODC, PDC_IODC_READ, __pa(pdc_result), hpa, index, __pa(pdc_result2), iodc_data_size);
> convert_to_wide(pdc_result);
> bytecnt = pdc_result[0];
> memcpy(dump_iodc_data, pdc_result2, iodc_data_size);
> 
> The result is always "ret = -3" -> cannot complete call without error.
> Do I forget anything (probably). Do I have to prevent interruption ? Do I have to modify PSW ?

more prosaically, i think iodc_data_size should be 32 * sizeof(long),
ie size in bytes, not number of longs.

but why code this up yourself rather than use pdc_iodc_read?

-- 
Revolutions do not require corporate support.
