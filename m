From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] -pie is broken on hppa
Date: Fri, 1 Jun 2007 19:55:08 -0600
Message-ID: <20070602015507.GU23968__4224.81989157877$1416624382$gmane$org@parisc-linux.org>
References: <465FBA5F.2010909@frankengul.org>
	<200706020119.l521JLOO011243@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: debian-hppa@lists.debian.org,
 parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200706020119.l521JLOO011243@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, Jun 01, 2007 at 09:19:20PM -0400, John David Anglin wrote:
> > I discovered that the breakage of portmap on hppa is related to the
> > -pie linkage.
> > Every program linked with the -pie option segfaults at start.
> > Unfortunately, portmap is unconditionnaly built with this option.
> 
> I advise not updating to libc6 2.5-9.  More than pie apps seem
> affected.  For example, svn is broken on my system.  _start in
> *crt1.o needs fixing.

This is a matter of some urgency -- I heard glibc 2.5 moved into Debian
Testing today.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
