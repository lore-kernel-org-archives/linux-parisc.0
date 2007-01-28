From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] binutils-2.17.50.0.10+ hates hppa ?
Date: Sun, 28 Jan 2007 13:20:18 -0500 (EST)
Message-ID: <200701281820.l0SIKI2t027060__14917.9807318889$1416624271$gmane$org@hiauly1.hia.nrc.ca>
References: <119aab440701280908q2c22371che5d9af38dd589c95@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: carlos@systemhalted.org (Carlos O'Donell)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <119aab440701280908q2c22371che5d9af38dd589c95@mail.gmail.com>
	from "Carlos O'Donell" at Jan 28, 2007 12:08:50 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> On 1/28/07, Jeff Bailey <jbailey@raspberryginger.com> wrote:
> > Except that this is what a number of distros  (Gentoo, Fedora, Ubuntu) are
> > shipping at the moment.
> 
> John,
> 
> I saw your checkin on binutils, is this fixed for hppa now?
> Many thanks if it is!

Should be but I don't use linux binutils.

Regarding "linux binutils", I note that the current release has
changes to the default section LMA (load memory address).  This
might break EH support on hppa-linux because of the use of pc-relative
offsets in the EH data.  See the release notes for 2.17.50.0.12.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
