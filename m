From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] GCC trunk 20070630
Date: Mon, 2 Jul 2007 12:53:44 -0400 (EDT)
Message-ID: <200707021653.l62Grit6023802__1220.75307085669$1416624405$gmane$org@hiauly1.hia.nrc.ca>
References: <18057.10210.79139.936855@gargle.gargle.HOWL>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org,
 debian-hppa@lists.debian.org
To: doko@cs.tu-berlin.de (Matthias Klose)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <18057.10210.79139.936855@gargle.gargle.HOWL> from "Matthias
	Klose" at Jul 2, 2007 06:29:22 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> Testing 20070630 including the fix for PR rtl-optimization/32296 shows
> many new C++ and libstdc++ regressions.

Most of these were introduced by the dataflow merge (r125624).  I'm
currently working to confirm this.

The C++ and libstdc++ regressions are an EH bug in libgcc.  I tried
debugging this yesterday but didn't find the problem.  I know the
problems in libgcc since the test that I was debugging doesn't fail
with the system libgcc.

We also have problems with building hppa64 and Ada.  So, things are
a mess at the moment...

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
