Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: "Adam J. Richter" <adam@yggdrasil.com>
Cc: James.Bottomley@steeleye.com, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Untested port of parisc_device to generic device interface 
In-Reply-To: Message from "Adam J. Richter" <adam@yggdrasil.com>
   of "Fri, 08 Nov 2002 17:28:05 PST." <200211090128.RAA31693@adam.yggdrasil.com>
References: <200211090128.RAA31693@adam.yggdrasil.com> 
Date: Fri, 08 Nov 2002 18:56:11 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20021109015611.571B44829@dsl2.external.hp.com>
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

"Adam J. Richter" wrote:
> 	One question about the machine that has no consistent memory
> option: does it take PCI cards?

Adam (and James),
They don't have PCI slots.
I hedge because HP makes a "card-mode Dino" type of card that will
fit into 715 which has a GSCtoPCI bus controller on-board along
with the target PCI device (eg 21143 tulip)

The only non-coherent machines I can think of off hand are fairly old.
Common feature is they have PCX-T and older processor:
	http://hwdb.parisc-linux.org/view.php3?type=cpu&name=PA7000%20(PCX-S)
	http://hwdb.parisc-linux.org/view.php3?type=cpu&name=PA7100%2FPA7150%20(PCX-T)

> If so, then all PCI device drivers
> should theoretically use something like wback_fake_consistent.

I don't think that would fly even if it was needed.

> If not, then it sounds like the facility needs only to apply to
> generic DMA operations for "parisc" bus cards.

I think so.
Matthew "willy" Wilcox is more familiar with the issues than I though.
I've focus'd on systems with PCI.

...
> diff -u -r linux-2.5.46/include/asm-parisc/hardware.h linux/include/asm-paris
>   c/hardware.h
> --- linux-2.5.46/include/asm-parisc/hardware.h	Wed Oct 30 21:32:15 200
>   2
> +++ linux/include/asm-parisc/hardware.h	Fri Nov  8 01:49:09 2002
> @@ -1,6 +1,7 @@
>  #ifndef _PARISC_HARDWARE_H
>  #define _PARISC_HARDWARE_H
>  
> +#include <linux/device.h>
>  #include <asm/pdc.h>
>  
>  struct parisc_device_id {
> @@ -26,14 +27,10 @@
>  struct parisc_device {
>  	unsigned long   hpa;		/* Hard Physical Address */
>  	struct parisc_device_id id;
> -	struct parisc_device *parent;
> -	struct parisc_device *sibling;
> -	struct parisc_device *child;
> -	struct parisc_driver *driver;	/* Driver for this device */

you don't want to do this unless something similar replaces it.
Coherent IO machines depend on the parent/child relationships to
initialize/operate properly.

> -	void		*sysdata;	/* Driver instance private data */
>  	char		name[80];	/* The hardware description */
>  	int		irq;
>  
> +	struct device	device;

making this the first thing in the struct would allow simple
casts to/from each "flavor" of device structure. ie PCI controller
code could look at the struct for any other bus controller safely
(and vice versa).

>  	char		hw_path;        /* The module number on this bus */
>  	unsigned int	num_addrs;	/* some devices have additional address
>    ranges. */
>  	unsigned long	*addr;          /* which will be stored here */
> @@ -66,10 +63,10 @@
>  extern char *cpu_name_version[][2]; /* mapping from enum cpu_type to strings
>    */
>  
>  struct parisc_driver {
> -	struct parisc_driver *next;
>  	char *name; 
>  	const struct parisc_device_id *id_table;
>  	int (*probe) (struct parisc_device *dev); /* New device discovered */

and *dev should point to a struct device?

willy/rbrad really need to review/collaborate with this set of change
since they've put alot of effort into the current scheme.
I'm sure both would be glad to help.

thanks!
grant
