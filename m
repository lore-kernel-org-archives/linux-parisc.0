Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Branch Prediction 
In-Reply-To: Message from "John David Anglin" <dave@hiauly1.hia.nrc.ca>
   of "Sat, 26 Oct 2002 13:05:04 EDT." <200210261705.g9QH54Zx002355@hiauly1.hia.nrc.ca>
References: <200210261705.g9QH54Zx002355@hiauly1.hia.nrc.ca> 
Date: Sat, 26 Oct 2002 19:23:03 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20021027012303.7B576484E@dsl2.external.hp.com>
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

"John David Anglin" wrote:
> I wonder if the PA-8700 in the rp2470 has it?

gsyprf11 is a 650Mhz PA8700. please try it.

> I suppose it also could be an add-on chip.

Think so?
After reading the description I had the impression BTS has to be on chip
and integrated in order to get the speed. But I'm just a SW engineer...

> I am guessing but I think setting it would help on machines with
> dynamic prediction hardware.  There is probably a paper somewhere
> on this on the HP site.

> My understanding is that pc-relative branches can be predicted
> from examination of the code.  Indirect branches (e.g., call
> returns) can't.

yes.  IIRC, branches forward tend to not be taken and branches backwards
tend to be loops. Or something along that line. But with PBO, the
static hints are better. And HPUX has a very cool "driver" called
"flipper" that will flip to static hints to match performance path
at run time.
 
> I don't know how the dynamic prediction hardware
> works but I would think it wouldn't be there if it didn't
> improve branch prediction.

yeah - I'll what I can learn about it this week.

thanks,
grant
