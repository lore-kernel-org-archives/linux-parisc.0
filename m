From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Machine hanging during high-traffic NFS
Date: Thu, 21 Jul 2005 19:28:41 -0400 (EDT)
Message-ID: <200507212328.j6LNSfto010960@hiauly1.hia.nrc.ca>
References: <20050721123607.GA27978@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: grundler@parisc-linux.org (Grant Grundler)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050721123607.GA27978@colo.lackof.org> from "Grant Grundler" at
	Jul 21, 2005 06:36:07 am
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> On Thu, Jul 21, 2005 at 01:42:12AM -0600, Kurt Fitzner wrote:
> > I 'downgraded' to 2.6.8.1-pa11 as Mr. Anglin suggested and I am not able
> > to reproduce the hang.  Would it be helpful if I were to identify the
> > exact kernel version where the hang first begins to occur?
> 
> Definitely. Be warned that this can be very time consuming.
> If you can narrow the window to a major kernel release,
> that would already be very helpful. The exact -paX version
> would of course be perfect.

I know that 32-bit 2.6.10 isn't stable on my c3k.  There is a known
bug with kernel memcpy and fpregs.  Either James' fix needs to be
backported, or builds need to be done with gcc-4.0.0 (or 4.0.1) using
the -mfixed-range as discussed previously on the list.  I haven't
had time to try this.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
