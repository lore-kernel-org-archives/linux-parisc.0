Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id E256F4841
	for <parisc-linux@lists.parisc-linux.org>; Sat,  8 Nov 2003 15:05:10 -0700 (MST)
Date: Sat, 8 Nov 2003 17:00:11 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Joel Soete <soete.joel@tiscali.be>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: [parisc-linux-cvs] linux-2.6 carlos
Message-ID: <20031108220011.GJ21080@systemhalted>
References: <20031108205955.7039B49402D@palinux.hppa> <20031108205825.GI21080@systemhalted> <3FAD63B7.6020805@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3FAD63B7.6020805@tiscali.be>
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

On Sat, Nov 08, 2003 at 09:44:23PM +0000, Joel Soete wrote:
> +       case 13:
> +               if (user_mode(regs)) {
> +#ifdef PRINT_USER_FAULTS
> +                       printk(KERN_DEBUG "\nhandle_interruption() id=%d 
> command='%s'\n",
> +                           current->pid, current->comm);
> +                       show_regs(regs);
> +#endif
> +                       /* Conditional Trap
> +                          The condition succees in an instruction which 
> traps on condition  */
> +                       si.si_signo = SIGFPE;
> [...]
> +                       return;
> +               } else break;
> 
> (sorry for bad wrap but I also join the patch I suggested)
> 
> But you can prefer to ignore as it is just a work around and that I 
> don't yet see what other solution could be bring to such pb?

Adding the check for user_mode. Thanks Joel!
It seems that the kernel tries to use 'addi,tc' and a few other whichs
might generate a trap.

c.
