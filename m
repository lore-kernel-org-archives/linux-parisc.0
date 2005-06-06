From: Stuart Brady <sdbrady@ntlworld.com>
Subject: Re: [parisc-linux] matroxfb bugfix
Date: Mon, 6 Jun 2005 17:55:16 +0100
Message-ID: <20050606165516.GA25251@ntlworld.com>
References: <20050601010422.GA17369@ntlworld.com>
	<4282FEEC00007D33@mail-2-bnl.tiscali.it>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@lists.parisc-linux.org,
 Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <4282FEEC00007D33@mail-2-bnl.tiscali.it>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wed, Jun 01, 2005 at 03:42:14PM +0200, Joel Soete wrote:
> Just for the record, I noticed that 2.6.11.11 patch contained:
> [snip]
>     [PATCH] Fix matroxfb on big-endian hardware
> [snip]
> 
> Is it already part of 2.6.12-rc5?

It's in the changelog for 2.6.12-rc2.

Has anyone tested it on parisc?  (Apparently the corruption only occured
in accelerated mode.)
-- 
Stuart Brady
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
