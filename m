From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] pthread problems - test program
Date: Wed, 6 Apr 2005 04:42:54 -0400 (EDT)
Message-ID: <200504060842.j368gtvK004155@hiauly1.hia.nrc.ca>
References: <20050406045954.GU1833@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: carlos@baldric.uwo.ca (Carlos O'Donell)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050406045954.GU1833@baldric.uwo.ca> from "Carlos O'Donell" at
	Apr 6, 2005 00:59:54 am
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> On Tue, Apr 05, 2005 at 09:21:17PM -0400, John David Anglin wrote:
> > > > What's the situation on the following signals: SIGLTHRRES, SIGLTHRCAN
> > > > and SIGLTHRDBG?  I'm not sure but pthread_cond_signal may need SIGLTHRRES.
> > > > Are these signals 37, 38 and 39?
> > > 
> > > yes, we use the same signals. 
> > 
> > It looks as if we have 36 signals which may need to be blocked.  However,
> > _SIGSET_NWORDS is 32.  Is this a problem?
> 
> I don't quite understand what you mean by this? Can you show me the code
> that defines this and where the error might be?

It appears that we have 36 potentially maskabable interrupts but
_SIGSET_NWORDS is defined as if we had 32 (x86 number).

>>From bits/sigaction.h:

    ...
    /* Additional set of signals to be blocked.  */
	__sigset_t sa_mask;
    };

/* Bits in `sa_flags'.  */

>>From bits/sigset.h:

# define _SIGSET_NWORDS (1024 / (8 * sizeof (unsigned long int)))
typedef struct
  {
    unsigned long int __val[_SIGSET_NWORDS];
  } __sigset_t;


>>From bits/signum.h:

/* Signals.  */
#define SIGHUP          1       /* Hangup (POSIX).  */
...
#define SIGXCPU         33      /* CPU limit exceeded (4.2 BSD).  */
#define SIGXFSZ         34      /* File size limit exceeded (4.2 BSD).  */
#define SIGSTKFLT       36      /* Stack fault.  */

#define _NSIG           65      /* Biggest signal number + 1
                                   (including real-time signals).  */

#define SIGRTMIN        (__libc_current_sigrtmin ())
#define SIGRTMAX        (__libc_current_sigrtmax ())

/* These are the hard limits of the kernel.  These values should not be
   used directly at user level.  */
#define __SIGRTMIN      37

I'm wondering if _SIGSET_NWORDS is correctly defined.

I've been trying to match up some defines in a file to add Ada
tasking to GCC for parisc from an x86 file.  I don't know that
there is a problem but the above seemed strange (i.e., SIGXCPU,
SIGXFSZ and SIGSTKFLT don't appear to be maskable on parisc but
they are maskable on x86).

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
