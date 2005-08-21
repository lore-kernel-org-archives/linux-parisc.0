From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Latest 2.6.13-rc6-pa2 test pr :_(
Date: Sun, 21 Aug 2005 11:47:48 -0400 (EDT)
Message-ID: <200508211547.j7LFlmLQ022122@hiauly1.hia.nrc.ca>
References: <430891B2.1010507@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: soete.joel@tiscali.be (Joel Soete)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <430891B2.1010507@tiscali.be> from "Joel Soete" at Aug 21,
	2005 02:37:38 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

>      737                 force_sig_info(SIGSEGV, &si, current);
> [...]
>      781                 force_sig_info(SIGSEGV, &si, current);
> [...]
> 
> This last one is specialy interesting as (if I well understand) ending handle_interruption() for case 26.
> 
> Unfortunately, not yet find how to fix it:
> 	o as tausq did for signal.c
> 	o s/force_sig_info(SIGSEGV, &si, current)/force_sig(SIGSEGV, current)/

Hmmm, possibly all SIGSEGV calls to force_sig_info are potentially
subject to looping.  I see ia64 defines a function force_sigsegv_info.
The important difference being the following bit of code:

        if (sig == SIGSEGV) {
		/*
		 * Acquiring siglock around the sa_handler-update is almost
		 * certainly overkill, but this isn't a
		 * performance-critical path and I'd rather play it safe
		 * here than having to debug a nasty race if and when
		 * something changes in kernel/signal.c that would make it
		 * no longer safe to modify sa_handler without holding the
		 * lock.
		*/
		spin_lock_irqsave(&current->sighand->siglock, flags);
		current->sighand->action[sig - 1].sa.sa_handler = SIG_DFL;
		spin_unlock_irqrestore(&current->sighand->siglock, flags);
	}

where it looks as if it resets the handler for the signal to SIG_DFL.
This same bit of code is in force_sigsegv.  If we were to do this, I
see that we need to handle SEGV_MAPERR and SI_KERNEL.

I think we may also want to reset the handler for SIGBUS.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
