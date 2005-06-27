From: Grant Grundler <grundler@parisc-linux.org>
Subject: [parisc-linux] Re: ccio-dma more debuging
Date: Mon, 27 Jun 2005 09:08:17 -0600
Message-ID: <20050627150817.GA17711@colo.lackof.org>
References: <20050626202734.GA3338@colo.lackof.org>
	<42BAE7C300000ABE@mail-5-bnl.tiscali.it>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: Parisc List <parisc-linux@lists.parisc-linux.org>
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <42BAE7C300000ABE@mail-5-bnl.tiscali.it>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Jun 27, 2005 at 08:23:38AM +0200, Joel Soete wrote:
> Cool I found what I think being the trick:
> <http://marc.theaimsgroup.com/?l=bk-commits-head&m=107647970230357&w=2>

Yeah, that looks like the right one.

Keep in mind that parisc sba_iommu.c shares some of the code
touched by the above patch with ccio driver. See iommu-helpers.h.

> But that inforce you to take care of each name change in every palces when
> gcc could do for you ;-)

We aren't cutting/pasting from the code anymore.
I don't need that at this point.

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
