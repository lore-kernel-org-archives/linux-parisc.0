From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] List of things that are known no to work on
Date: Fri, 17 Jun 2005 15:01:28 -0400 (EDT)
Message-ID: <200506171901.j5HJ1TdA022606__34475.072930991$1416624549$gmane$org@hiauly1.hia.nrc.ca>
References: <e6eae02905061711053b72fb5@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: James.Bottomley@steeleye.com,
 carlos@systemhalted.org,
 debian-hppa@lists.debian.org,
 parisc-linux@parisc-linux.org
To: parisc@gmail.com
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <e6eae02905061711053b72fb5@mail.gmail.com> from "Max Grabert" at
	Jun 17, 2005 07:05:08 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> > > - 64 bit gcc that will build DSO's

This isn't really an accurate description of what's missing.  GCC
doesn't build DSO's itself.  GCC lacks libtool and various config
files for 64-bit parisc-linux.  However, very little is missing
for C support.

Although GNU ld is somewhat broken, it should be able to build 64-bit
DSO's with the support that's presently there.  That's assuming we
keep the same runtime as hpux (ok, there are some symbol predefines
and elf issues that probably need looking at).

What stops building DSO's at the moment is

/usr/bin/hppa64-linux-ld: crti.o: No such file: No such file or directory

This is a glibc file.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
