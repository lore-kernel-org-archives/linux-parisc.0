From: Matthias Klose <doko@cs.tu-berlin.de>
Subject: Re: [parisc-linux] GCC trunk 20070630
Date: Tue, 3 Jul 2007 11:58:51 +0200
Message-ID: <18058.7643.461885.7204__18179.4635406279$1416624407$gmane$org@gargle.gargle.HOWL>
References: <18057.10210.79139.936855@gargle.gargle.HOWL>
	<200707021653.l62Grit6023802@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org,
 debian-hppa@lists.debian.org
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200707021653.l62Grit6023802@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

John David Anglin writes:
> > Testing 20070630 including the fix for PR rtl-optimization/32296 shows
> > many new C++ and libstdc++ regressions.
> 
> We also have problems with building hppa64 and Ada.  So, things are
> a mess at the moment...

The hppa64 cross compiler at least did build; Ada is broken on other
archs as well (at least 20070702).
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
