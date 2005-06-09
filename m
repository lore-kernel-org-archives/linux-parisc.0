From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] Remove __ldcw_align for PA-RISC 2.0 processors
Date: Thu, 9 Jun 2005 09:05:26 -0600
Message-ID: <20050609150526.GA9291@colo.lackof.org>
References: <20050609054700.GA9450@colo.lackof.org>
	<200506091429.j59ETPwv008987@hiauly1.hia.nrc.ca>
	<20050609144615.GA24611@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Matthew Wilcox <matthew@wil.cx>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050609144615.GA24611@parcelfarce.linux.theplanet.co.uk>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, Jun 09, 2005 at 03:46:15PM +0100, Matthew Wilcox wrote:
...
> For userspace, it's obviously different.  There, we have to cope with
> any PA processor, and thus have to use a "self aligning" lock, but the
> kernel can be fine tuned.

For *32-bit* userspace, I agree. Someday someone will be motivated
to get a 64-bit userspace together.

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
