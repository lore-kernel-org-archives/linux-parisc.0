From: Mike Frysinger <vapier@gentoo.org>
Subject: Re: FW: [parisc-linux] Fwd: RE: Hp c3600 Gentoo Installation troubles
Date: Thu, 6 Jan 2005 14:12:48 -0500
Message-ID: <200501061412.49024.vapier@gentoo.org>
References: <NAEELOAPEHKLDEDOLEIHOEOLCCAA.bfisher@intech-intl.com>
	<200501061331.50888.vapier@gentoo.org>
	<1105037770.4319.60.camel@mulgrave>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Cc: gentoo-hppa@lists.gentoo.org,
 parisc-linux@parisc-linux.org
To: Ben Fisher <bfisher@intech-intl.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1105037770.4319.60.camel@mulgrave>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thursday 06 January 2005 01:56 pm, James Bottomley wrote:
> On Thu, 2005-01-06 at 13:31 -0500, Mike Frysinger wrote:
> > > One theory I have is that the instruction guide never told me where to
> > > mount the f0 partition.  So far as the computer knows, it's just
> > > sitting there, probably not being written to.
> >
> > that's because you cant mount it.  running palo takes care of all that
> > magic.
>
> Actually, that's not necessarily true.  If you have palo version 1.4 or
> later, then the palo partition can be formatted as ext2/ext3 and mounted
> just like any other partition.
>
> However, by default palo will create unmountable partitions.

touche salesman ;)
lemme rephrase ... the default gentoo setup is such that you never have to 
mount the partition ... setup /etc/palo.conf and run palo
-mike
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
