Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id E7C574829
	for <parisc-linux@lists.parisc-linux.org>; Sat, 10 May 2003 15:21:46 -0600 (MDT)
Message-Id: <200305102121.h4ALLiFk008499@hiauly1.hia.nrc.ca>
To: joel.soete@tiscali.be (Joel Soete)
Date: Sat, 10 May 2003 17:21:44 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: randolph@tausq.org, parisc-linux@lists.parisc-linux.org
In-Reply-To: <3EBD61A5.8030205@tiscali.be> from "Joel Soete" at May 10, 2003 08:31:33 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Subject: [parisc-linux] Re: Yet another '__canonicalize_funcptr_for_compare' pb
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

>         dev = __dev_get_by_name(ifr->ifr_name);
>         if (dev) {
>                 /* Device exist */
>                 tun = dev->priv;
> 
>                 if (dev->init != tun_net_init || tun->attached)
>                         return -EBUSY;
> 
>                 /* Check permissions */
> ...
> 
> I suspect first if(dev) because dev is a pointer to a struct but finaly 
> it is in "if (dev->init != tun_net_init..." which would become "if 
> (dev->init != (void*)tun_net_init...".

__canonicalize_funcptr_for_compare is only used in comparisons involving
function pointers.

> Is it the right workaround? fixe?

Probably.  There are some tricky issues with respect to loadable
kernel modules.

> I have another stupid question: as hppa seems to be the only platform 
> requiring this stuff and I don't see how to check all src to track this 
> pb (practicaly only try and chess?), how much would it be difficult to 
> implement this __canonicalize_funcptr_for_compare into the hppa lib kernel?

You can tell if a kernel or module uses __canonicalize_funcptr_for_compare
with nm.  If you find it's used somewhere, check each object module for
it.  You can find the code location of it with "objdump -d".  This will
give a pretty good idea where in the source the comparison occurs.

As to a kernel implementation, this is hard.  If the function pointer
is in user space, canonicalization requires a bunch of tests and then
a call to code in the dynamic loader in the user program.

As far as function pointers in the kernel address space, this would
take some research.  Direct comparison (i.e., using "void *" casts)
will work ok as long as the pointer either points directly to the
kernel function involved or unique plabels are used.  If all
kernel function addresses get bound immediately when a module
is loaded, this would simplify the situation and the canonicalization
could be done simply by looking at the function address in the plabel.
The exact details depend on how the kernel and modules are linked.

The reason why function pointer canonicalization is needed on the
pa is that there can be several plabels pointing to the same function
a user program.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
