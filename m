From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: FW: [parisc-linux] Fwd: RE: Hp c3600 Gentoo Installation troubles
Date: Thu, 06 Jan 2005 13:56:10 -0500
Message-ID: <1105037770.4319.60.camel@mulgrave>
References: <NAEELOAPEHKLDEDOLEIHOEOLCCAA.bfisher@intech-intl.com>
	<200501061331.50888.vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain
Cc: Ben Fisher <bfisher@intech-intl.com>,
 gentoo-hppa@gentoo.org,
 parisc-linux@parisc-linux.org
To: Mike Frysinger <vapier@gentoo.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200501061331.50888.vapier@gentoo.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, 2005-01-06 at 13:31 -0500, Mike Frysinger wrote:
> > One theory I have is that the instruction guide never told me where to
> > mount the f0 partition.  So far as the computer knows, it's just sitting
> > there, probably not being written to.
> 
> that's because you cant mount it.  running palo takes care of all that magic.

Actually, that's not necessarily true.  If you have palo version 1.4 or
later, then the palo partition can be formatted as ext2/ext3 and mounted
just like any other partition.

However, by default palo will create unmountable partitions.

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
