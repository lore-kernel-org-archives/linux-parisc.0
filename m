From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] BUG 2.6.11-rc4-pa1 XFS data page fault
Date: Wed, 16 Feb 2005 00:45:04 -0700
Message-ID: <20050216074504.GC6020@colo.lackof.org>
References: <20050216065539.GB5251@colo.lackof.org>
	<4208D51500003293@mail-5-bnl.tiscali.it>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <4208D51500003293@mail-5-bnl.tiscali.it>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wed, Feb 16, 2005 at 08:28:15AM +0100, Joel Soete wrote:
> >  RP(r2): 0xa7f9a6c0
> > Kernel panic - not syncing: Kernel Fault
> >
> Any chance to know what 0xa7f9a6c0 is (iirc calling address)?

return pointer - yes, the callers address.

> and fwiw it's different from previous panic: RP was 0xfa285480?

both look like garbage to me.

> mmm patch-2.6.11-rc4-bk3 (including some xfs fixes) is small, could you let
> a try?

Sure - tomorrow. You have a URL?
(Sorry - I think you posted it once before)

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
