From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: Re: [parisc-linux] pthread problems - test program
Date: Wed, 6 Apr 2005 00:59:54 -0400
Message-ID: <20050406045954.GU1833@baldric.uwo.ca>
References: <20050404005038.GH8921@tausq.org>
	<200504060121.j361LISD002640@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200504060121.j361LISD002640@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, Apr 05, 2005 at 09:21:17PM -0400, John David Anglin wrote:
> > > What's the situation on the following signals: SIGLTHRRES, SIGLTHRCAN
> > > and SIGLTHRDBG?  I'm not sure but pthread_cond_signal may need SIGLTHRRES.
> > > Are these signals 37, 38 and 39?
> > 
> > yes, we use the same signals. 
> 
> It looks as if we have 36 signals which may need to be blocked.  However,
> _SIGSET_NWORDS is 32.  Is this a problem?

I don't quite understand what you mean by this? Can you show me the code
that defines this and where the error might be?

c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
