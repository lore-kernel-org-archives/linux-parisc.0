From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: qt-x11-free build fails
Date: Sat, 7 Jan 2006 13:49:15 -0500 (EST)
Message-ID: <200601071849.k07InFlv019952__35913.8606385843$1416623978$gmane$org@hiauly1.hia.nrc.ca>
References: <20060107174000.GA11145@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: 342545@bugs.debian.org,
 jbailey@debian.org,
 lamont@debian.org,
 parisc-linux@lists.parisc-linux.org,
 debian-hppa@lists.debian.org,
 341675@bugs.debian.org,
 tausq@debian.org,
 debian-release@lists.debian.org
To: grundler@parisc-linux.org (Grant Grundler)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060107174000.GA11145@colo.lackof.org> from "Grant Grundler" at
	Jan 7, 2006 10:40:00 am
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> On Sat, Jan 07, 2006 at 01:05:11AM -0800, Steve Langasek wrote:
> > Grant, thank you for your work to date on this bug.  (BTW, it would be
> > helpful if you would follow up to bug #342545 on libgcc2, instead of bug
> > #341675 which is filed against just one of the many packages affected by
> > it).

There isn't a lot of info in #342545.  However, I suspect from the
following comment

> It would be nice if somebody fluent with hppa assembly can tell us if 

>       fldw -10(,sp),fr23

that this is the same bug as reported here:
http://gcc.gnu.org/bugzilla/show_bug.cgi?id=20754.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
