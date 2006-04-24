From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Does it lakes some cloberred r1 in
Date: Mon, 24 Apr 2006 12:50:48 -0400 (EDT)
Message-ID: <200604241650.k3OGon5N027856@hiauly1.hia.nrc.ca>
References: <20060424162545.GA25893@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: grundler@parisc-linux.org (Grant Grundler)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060424162545.GA25893@colo.lackof.org> from "Grant Grundler" at
	Apr 24, 2006 10:25:45 am
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> On Mon, Apr 24, 2006 at 11:35:48AM -0400, John David Anglin wrote:
> > The intent of the errata seems to be to relax the alignment requirement
> > for ldc[dw],co in cases where the spinlock is not being shared with a
> > non-coherent I/O device.
> 
> AFAIK, only one non-coherent PA-RISC box has PA2.0 and parisc-linux
> doesn't support it: T600.

It probably has coherent I & D caches as well as this seems to be a
requirement for both 1.1 and 2.0.

> (I'm assuming ",co" completer is PA2.0 only - please correct me if
> that's wrong.)

It's not in the PA 1.1 arch...

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
