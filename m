Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] iodc call and HPMC: dump driver. 
In-Reply-To: Message from Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>
   of "Tue, 03 Sep 2002 18:24:18 +0200." <3D74E232.88B62E31@admin.france.hp.com>
References: <3D73014A.15ED96ED@admin.france.hp.com> <20020903045049.E268F4829@dsl2.external.hp.com>  <3D74E232.88B62E31@admin.france.hp.com> 
Date: Tue, 03 Sep 2002 22:53:37 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020904045337.1B9894829@dsl2.external.hp.com>
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
> This is a multi-part message in MIME format.
> --------------9FA0B36E1D5BF1A98D31930A
> Content-Type: text/plain; charset=us-ascii
> Content-Transfer-Encoding: 7bit
> 
> 	Hi
> I'm really surprised, I take a look at HPMC trace, and I was really
> surprised of the faulty address. So I try to write on console.
> And I m really surprised by the result:
> PAGE0->mem_cons.hpa: 0x2000
> PAGE0->mem_boot.hpa: 0x900
> PAGE0->mem_kbd.hpa: 0xffffffff 

Which model machine is this from?

> It is not good at all !!! It seems to be completly wrong hpa !!!!

Note that "hpa" might just be a "handle" and not a real physical address.
It depends on the firmware. Usually it's the physical address though.
I think something else is wrong with your definition or something.

PAGE0 is used in arch/parisc/kernel/firmware.c, inventory.c, pdc_cons.c
and it works in those locations.

> The good one for mem_boot.hpa must be: 0xfffffffffed30000 (in my case
> according to dmesg and mapio). But the system has boot,

No - it doesn't have to be.

> so it was correct a few time ago. I'll retry by using my own
> hpa and I'll don't trust anymore PAGE0.

Well, modify palo to dump interesting page zero values and then
you'll know what they are supposed to be. I'm pretty sure
firmware sets that up.

hth,
grant
