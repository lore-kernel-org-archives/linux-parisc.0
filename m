Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>
Cc: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] mem_pdc_call: how using it exactly. 
In-Reply-To: Message from Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>
   of "Fri, 05 Jul 2002 14:03:45 +0200." <3D258B21.EC28E2AF@admin.france.hp.com>
References: <3D257AAB.D04CD0DC@admin.france.hp.com> <20020705124538.Z27706@parcelfarce.linux.theplanet.co.uk>  <3D258B21.EC28E2AF@admin.france.hp.com> 
Date: Fri, 05 Jul 2002 11:17:50 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020705171751.2115B485D@dsl2.external.hp.com>
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

Bruno Vidal wrote:
> About the iodc_data_size, in the documentation it is describe as: "count byte
>   s in length".

Yes.  Gecko ERS says ARG6 is "size of memaddr in bytes".

> For example in drivers/scsi/zalon7xx.c:
> status = pdc_iodc_read(&pdc_result, hpa, 0, &iodc_data, 32 ); 
> -> it is 32.
> So If I want the 32 first bytes, it should be 32.

        status = pdc_iodc_read(&pdc_result, hpa, 0, &iodc_data, 32 );
	if (status == PDC_RET_OK) {
		clock = (int) pdc_result[16];
	} else {
	....

This looks wrong.  pdc_result[16] probably contains garbage.

> Now why doing it myself, because I don't want to use spinlock while
> dumping, and pdc_iodc_read use spinlock. Perhaps, it is not a good
> solution, what do you think about using spinlock while dumping ?

I would rather see the dump code avoid the spinlock and
replicate the pdc calls. ie assume PDC calls can crash the
system too. But if this is a PITA, re-initialize the lock and use the
regular calls.

grant
