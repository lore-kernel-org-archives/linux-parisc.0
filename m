From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] fpu emulation: another stupid question
Date: Sat, 15 Jan 2005 01:01:19 -0700
Message-ID: <20050115080119.GB518@colo.lackof.org>
References: <41DE4A3A0000261D@mail-1-bnl.tiscali.it>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <41DE4A3A0000261D@mail-1-bnl.tiscali.it>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, Jan 14, 2005 at 12:40:01PM +0100, Joel Soete wrote:
> Hi all,
> 
> afaik all parisc cpu have a fpu?

No - but I think parisc-linux requires it to be present.

> So do we need the emaulation code in our kernel?

Yes. Besides previous comments, ISTR not all FPU implementations
implement all the same instructions.

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
