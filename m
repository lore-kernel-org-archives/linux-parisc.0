From: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] k-class
	smp_call_function	at	arch/parisc/kernel/smp.c:340
Date: Mon, 28 Mar 2005 15:03:11 +0000
Message-ID: <42481CAF.5010905@tiscali.be>
References: <20050328122749.GB12853@ing.umu.se> <424800DB.6000709@tiscali.be>
	<20050328133837.GA14623@ing.umu.se>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: parisc-linux@lists.parisc-linux.org
To: Anders <dizzey@ing.umu.se>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050328133837.GA14623@ing.umu.se>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org



Anders wrote:
> On Mon, Mar 28, 2005 at 01:04:27PM +0000, Joel Soete wrote:
> 
>>
...
> 
> Well yes the system hung after those messages the FLT parts are from the 
> firmware during the reboot, so i only included them to show it was 
> rebooting.  i will be back with a test from a up kernel soon.

mmm another question: are you using a initrd.img?
fwiw I encounter the same message as you reported:
...
SCSI subsystem initialized
unwind_init: start = 0x103bad60, end = 0x103ddd50, entries = 8959
devfs: 2004-01-31 Richard Gooch (rgooch@atnf.csiro.au)
devfs: boot_options: 0x1
...
while testing latest kyle debian-kernel? (tbh, I don't remember to have encountered it before?)

Can you check if in your kernel config CONFIG_SCSI_ZALON=y
and btw remove devfs support?

Thanks,
	Joel

PS: iirc Willy also boot a k model may be ask him his config file (I don't remember if he custumized or used the default one?)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
