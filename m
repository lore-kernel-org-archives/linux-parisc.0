Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Fri, 6 Dec 2002 21:43:14 -0700
To: "John K." <jkirk9@cfl.rr.com>
Cc: parisc-linux Mailing list <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Bad IPL checksum error on 710
Message-ID: <20021207044314.GA31907@dsl2.external.hp.com>
References: <NDBBLBLICLEJGEFEEOCIIEPJCCAA.jkirk9@cfl.rr.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <NDBBLBLICLEJGEFEEOCIIEPJCCAA.jkirk9@cfl.rr.com>
From: grundler@dsl2.external.hp.com (Grant Grundler)
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Fri, Dec 06, 2002 at 03:46:06PM -0500, John K. wrote:
> I downloaded debian-30r0-hppa-binary-1.iso and burned a CD.
...
> Attempting to load IPL
> IPL error: Bad IPL checksum
...
> The simple question is what do I do now?

The CD is a coaster.
The ISO definitely works on all the machines I have around here.

I suggest using a linux machine with a CD writer and "cdrecord -data".
The "cdrecord How-to" describes the 2-3 stesp - very simple.

grant
