From: Matthew Wilcox <willy@debian.org>
Subject: Re: [parisc-linux] glibc pthreads actual threads?
Date: Mon, 19 May 2003 17:32:45 +0100
Message-ID: <20030519163245.GN16608__21139.1904893846$1416622466$gmane$org@parcelfarce.linux.theplanet.co.uk>
References: <3EC761CD0000080F@ocpmta2.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org, debian-hppa@lists.debian.org
To: Joel Soete <jsoe0708@tiscali.be>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <3EC761CD0000080F@ocpmta2.freegates.net>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Mon, May 19, 2003 at 06:27:41PM +0200, Joel Soete wrote:
> But notice  a very strange behaviour:
> _the pid is not the same for each thread_ ??
> 
> Having just a small sunos 5.8 with gcc-3.2.2 (but with native libpthread)
> the pb does not occurs?
> 
> Is it a limit of glibc (in general or in 2.3 only?) for all linux or only
> hppa?

it's a limit of your understanding ;-)  POSIX specifies both behaviours
are legitimate.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
