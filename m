From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] Re: backport sba change to ccio
Date: Sun, 6 Mar 2005 16:52:40 -0700
Message-ID: <20050306235240.GB14771@colo.lackof.org>
References: <20050304050324.GA30252@colo.lackof.org>
	<42075CE80000B426@mail-6-bnl.tiscali.it>
	<20050304163610.GA7363@colo.lackof.org> <42298B2A.702@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <42298B2A.702@tiscali.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, Mar 05, 2005 at 10:34:18AM +0000, Joel Soete wrote:
> The snow let me play a bit and the test pass as well as previously as far 
> as my c110 is a 32bit and so not affected by my mistake.
> btw what's up of __LP64__ and CONFIG_64BIT ?

Use CONFIG_64BIT. The cc dependencies will catch when if one wants
to re-use the same tree for different builds.

> I just attached the last udiff file to allow others to test it eventually 
> on 64bit model :-)

shouldn't matter if a system has 32 or 64bit kernel for these changes.
I've committed the "diff4" patch.

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
