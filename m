From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] pthread problems - test program
Date: Tue, 5 Apr 2005 21:21:17 -0400 (EDT)
Message-ID: <200504060121.j361LISD002640@hiauly1.hia.nrc.ca>
References: <20050404005038.GH8921@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: randolph@tausq.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050404005038.GH8921@tausq.org> from "Randolph Chung" at Apr 3,
	2005 05:50:38 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> > What's the situation on the following signals: SIGLTHRRES, SIGLTHRCAN
> > and SIGLTHRDBG?  I'm not sure but pthread_cond_signal may need SIGLTHRRES.
> > Are these signals 37, 38 and 39?
> 
> yes, we use the same signals. 

It looks as if we have 36 signals which may need to be blocked.  However,
_SIGSET_NWORDS is 32.  Is this a problem?

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
