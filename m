From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: Re: [parisc-linux] hppa glibc 2.3.2-9 available for the brave testers!
Date: Mon, 20 Oct 2003 00:34:16 -0400
Message-ID: <20031020043415.GB26432__46652.0649999895$1416622892$gmane$org@systemhalted>
References: <20031017180912.GD27289@systemhalted> <3F91A332.9050700@tiscali.be> <3F91D2C3.8020209@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org, debian-hppa@lists.debian.org
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <3F91D2C3.8020209@tiscali.be>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Sat, Oct 18, 2003 at 11:54:43PM +0000, Joel Soete wrote:
> So squid didn't hang any more at start up but still failled:
> 'Setting up squid (2.5.4-2) ...
> Creating squid spool directory structure
> FATAL: Could not determine fully qualified hostname.  Please set 
> 'visible_hostname'

recvfrom, six argument syscall, fails. I found this out people who use
nscd found it crashing.

c.
