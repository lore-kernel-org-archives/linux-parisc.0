From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] need help to fix outdated comment in ccio-dma
Date: Sun, 22 May 2005 19:44:29 -0600
Message-ID: <20050523014429.GC8960@colo.lackof.org>
References: <20050522022224.60F7A494058@palinux.hppa>
	<42905AA1.4010605@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <42905AA1.4010605@tiscali.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, May 22, 2005 at 10:10:41AM +0000, Joel Soete wrote:
> I would still like to update this comment in the head this file:
> [snip]
> **  Philipp Rumpf has a "Real Mode" driver for PCX-W machines at:
> **      CVSROOT=:pserver:anonymous@198.186.203.37:/cvsroot/linux-parisc
> **      cvs -z3 co linux/arch/parisc/kernel/dma-rm.c
> [snip]

Actually, I'm very tempted to just delete this comment.

> '198.186.203.37' doesn't seems to be a relevant address, so shouldn't we 
> better refer to cvs ccio-rm-dma.c?

If someone maintained it, Yes. But prumpf doesn't maintain it and
I'm not aware of anyone that actually uses ccio-rm-dma since it
*only* works on C360.  I'm completely un-interested in trying to support it.

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
