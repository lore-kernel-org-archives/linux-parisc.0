From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] Space registers and how to use them
Date: Sun, 25 Sep 2005 11:35:13 -0600
Message-ID: <20050925173513.GA22786@colo.lackof.org>
References: <20050925034342.GA1459@parisc-linux.org>
	<43367383.6030307@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@parisc-linux.org
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <43367383.6030307@tiscali.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, Sep 25, 2005 at 09:53:07AM +0000, Joel Soete wrote:
> Btw can you help me to undurstand the concept of the 4 quadrants as it was 
> spoken in:
> <http://lists.parisc-linux.org/pipermail/parisc-linux/2002-December/018602.html>

A "quadrant" is 1GB of address space. Think of each 1GB of address space
in 4GB as a "quadrant".

> Used in hpux? (documented somewhere?)

Probably.

> Is it related to the usage of sr4-7 as 4 different kernel spaces?

Yes. "2 bit s" field in fdc/fic map each "quadrant" to sr4-7.
ie 0-1GB uses sr4, 1-2GB uses sr5, etc.

John was just saying it doesn't matter since parisc-linux uses
the same value in all four (sr4-7) space registers.

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
