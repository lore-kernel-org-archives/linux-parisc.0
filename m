From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: Re: [parisc-linux] pthread problems - test program
Date: Wed, 6 Apr 2005 14:13:37 -0400
Message-ID: <20050406181337.GX1833@baldric.uwo.ca>
References: <200504060842.j368gtvK004155@hiauly1.hia.nrc.ca>
	<200504061611.j36GBWEc005840@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200504061611.j36GBWEc005840@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wed, Apr 06, 2005 at 12:11:31PM -0400, John David Anglin wrote:
> > #define SIGXCPU         33      /* CPU limit exceeded (4.2 BSD).  */
> > #define SIGXFSZ         34      /* File size limit exceeded (4.2 BSD).  */
> > #define SIGSTKFLT       36      /* Stack fault.  */
> 
> I guess the answer to my question is these signals aren't used,
> so we only support a maximum of 32 signals that can be masked.
> Hopefully, an EINVAL error will be generated if the above signals
> used.

Ah, ok.

We still have the problem of a *stuck* thread using linuxthreads.
Which we don't have a clear solution for...

More debugging is required. Perhaps I'll take a break from TLS glibc
stuff to debug this a bit.

c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
