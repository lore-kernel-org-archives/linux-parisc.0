From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Fixed strace [ was Re: ls -l is broken ]
Date: Thu, 17 Apr 2008 03:53:57 -0400
Message-ID: <20080417075357.GB23641@phobos.i.cabal.ca>
References: <20080406224204.GE16451@parisc-linux.org> <20080406231000.D53CB4FC8@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Matthew Wilcox <matthew@wil.cx>, linux-parisc@vger.kernel.org,
	debian-hppa@lists.debian.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080406231000.D53CB4FC8@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, Apr 06, 2008 at 07:09:59PM -0400, John David Anglin wrote:
> > If you strace it, what syscall returns -EOPNOTSUPP?
> 
> strace is broken and quits before the relevant syscall.  Think I
> mentioned this before is a different context.
> 

Fixed & updated strace available at
http://people.debian.org/~kyle/strace/

cheers, Kyle
