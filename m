From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Using -pg on hppa *is* broken
Date: Thu, 1 Jan 2004 16:00:16 -0500 (EST)
Message-ID: <200401012100.i01L0G0L019101__41226.3073878877$1416623096$gmane$org@hiauly1.hia.nrc.ca>
References: <20040101200318.GB7069@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: lamont@debian.org, parisc-linux@lists.parisc-linux.org,
	debian-hppa@lists.debian.org
To: carlos@baldric.uwo.ca (Carlos O'Donell)
Return-Path: <dave@hiauly1.hia.nrc.ca>
In-Reply-To: <20040101200318.GB7069@systemhalted> from "Carlos O'Donell" at
	Jan 1, 2004 03:03:19 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

> The main issue was that the 'start' symbol needs to be canonicalized
> before passing on to the gmon routines. This requires entry.h to be

I still think that using __c_f_f_c for this special case is overkill.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
