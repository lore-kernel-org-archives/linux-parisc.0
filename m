Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>
Cc: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Dump driver: step by step 
In-Reply-To: Message from Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>
   of "Thu, 17 Oct 2002 19:40:35 +0200." <3DAEF613.A3A42F9E@admin.france.hp.com>
References: <3DABF865.8224BF5@admin.france.hp.com> <3DAC09D7.47F2D9C0@hpfrcu81.france.hp.com> <3DAC0D9E.BD896745@admin.france.hp.com>  <3DAEF613.A3A42F9E@admin.france.hp.com> 
Date: Thu, 17 Oct 2002 22:04:37 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20021018040437.63784482D@dsl2.external.hp.com>
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
> 	hi
> Good news, now I'm able to initialise and read/write on
> multiple disk. The solution a new time was a specific
> PDC call on PAT system (we don't need it on 712 for example):
> 
> dump_pdc_call(PDC_IO, PDC_IO_RESET_DUMP_DEVS, __pa(pdc_result),__pa(dumpdev))

IIRC, this call is PAT PDC specific. The reason it was added is PAT PDC
only initializes boot and console devices. The RESET_DUMP_DEVs was added
to initialize a list of devices so IODC could be used in the HPUX
dump path.

> where dumpdev is the list of all "struct device_path".
> It would be really interresting if someone is able to
> find the "parisc 2.0 I/O firmware" doc, it would gain
> a lot's of time to poor little programmers like me.

Best is to scrounge through HPUX source code.
With docs, it's often difficult to know *where* to find the right info.

grant
