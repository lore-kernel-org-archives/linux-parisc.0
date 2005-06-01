From: "Joel Soete" <soete.joel@tiscali.be>
Subject: RE: [parisc-linux] S3 ViRGE
Date: Wed, 1 Jun 2005 15:42:14 +0200
Message-ID: <4282FEEC00007D33@mail-2-bnl.tiscali.it>
References: <20050601010422.GA17369@ntlworld.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-15"
To: "Stuart Brady" <sdbrady@ntlworld.com>,
 parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050601010422.GA17369@ntlworld.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


> 
> On Tue, May 31, 2005 at 11:09:05AM +0800, J. L. Lee wrote:
> > I have S3 Virge too but there is no configurable S3 driver in the
> > kernel configuration file.
> 
> virgefb seems to be for for Amigas only.  It might be worth trying the
X
> driver (which works for me on x86).
> -- 

Just for the record, I noticed that 2.6.11.11 patch contained:
[snip]
    [PATCH] Fix matroxfb on big-endian hardware
[snip]

Is it already part of 2.6.12-rc5?

Joel


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
