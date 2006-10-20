From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] Re: CCIO dma io_command and related io_tlb format
	questions.
Date: Fri, 20 Oct 2006 10:31:07 -0600
Message-ID: <20061020163107.GD23094@colo.lackof.org>
References: <J6YR5K$1938FDCB7E5B1C4FE794753632F5E240@scarlet.be>
	<20061012010426.GA18624@colo.lackof.org>
	<4538BB5F.5040703@scarlet.be>
	<20061020155059.GB23094@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux <parisc-linux@parisc-linux.org>
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20061020155059.GB23094@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, Oct 20, 2006 at 09:50:59AM -0600, Grant Grundler wrote:
> On Fri, Oct 20, 2006 at 12:04:47PM +0000, Joel Soete wrote:
> > mmm offhand wasn't there limits in ccio page size like in ia64 sba comments:
> > >/*
> > >** The zx1 IOC supports 4/8/16/64KB page sizes (see TCNFG register)
> 
> I don't remember.
> ia64 sba is the 3rd generation IO controller.
> U2 (ccio) is the first generation.
> Sorry, I'm not interested in comparing them.

Willy reminded me that Mongoose/WAX was the first.
He's correct of course.

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
