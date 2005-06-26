From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] Problem with two NICs on B132L+
Date: Sun, 26 Jun 2005 14:42:02 -0600
Message-ID: <20050626204202.GB3338@colo.lackof.org>
References: <42BEB9B5.4090108@bigfoot.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Ullrich Seibel <useibel@bigfoot.de>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <42BEB9B5.4090108@bigfoot.de>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, Jun 26, 2005 at 04:20:37PM +0200, Ullrich Seibel wrote:
> tulip0:  Index #0 - Media MII (#11) described by a 21142 MII PHY (3) block.
> tulip0: ***WARNING***: No MII transceiver found!

Kyle McMartin needs to backport the patch Thibaut Varenet cooked up
with my help that fixes 21142 support. Ie Debian 2.6.8.x kernel
needs to roll if it wants to fix this problem.

This patch was recently accepted into -mm (Andrew Morton's source tree).

thanks for posting the entire console output.

hth,
grant

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
