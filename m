From: Matthew Wilcox <willy@debian.org>
Subject: [parisc-linux] Re: SMP instability?
Date: Thu, 11 Apr 2002 21:40:12 +0100
Message-ID: <20020411214012.A2264__2187.4979291626$1416621232$gmane$org@parcelfarce.linux.theplanet.co.uk>
References: <59FFD7B1E114D111B4000060082F1C53024B2637@edge1.edge-technologies.com>
Reply-To: parisc-linux@parisc-linux.org
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: "'debian-hppa@lists.debian.org'" <debian-hppa@lists.debian.org>,
	parisc-linux@parisc-linux.org
To: "D'Ausilio, John" <John.Dausilio@edge-technologies.com>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <59FFD7B1E114D111B4000060082F1C53024B2637@edge1.edge-technologies.com>; from John.Dausilio@edge-technologies.com on Thu, Apr 11, 2002 at 03:16:25PM -0400
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Thu, Apr 11, 2002 at 03:16:25PM -0400, D'Ausilio, John wrote:
> Is the 2.4.18 which comes down from the archive as recent as the ones in the
> FTP server? I'm going to boot back into the original kernel and try getting
> the latest from the FTP server .. if that dosn't work I guess I'll get the
> sources and build from CVS. Any other hints/clues/suggestions? Should I just
> run single proc for now?

Yes, we've also found 2.4.18 to be unstable SMP.  I believe Grant has a
handle on this problem now, so expect it to be fixed quite soon.

-- 
Revolutions do not require corporate support.
