From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [parisc-linux] Proposal for git tree management
Date: Mon, 9 Oct 2006 14:15:52 -0400
Message-ID: <20061009181551.GA3354@athena.road.mcmartin.ca>
References: <20061008004151.GZ2563@parisc-linux.org>
	<20061009032945.GB30517@colo.lackof.org>
	<7d01f9f00610090439g763c9260q257fad185bbdf326@mail.gmail.com>
	<20061009180652.GB28254@parisc-linux.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@parisc-linux.org,
 Thibaut VARENE <T-Bone@parisc-linux.org>
To: Matthew Wilcox <matthew@wil.cx>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20061009180652.GB28254@parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Oct 09, 2006 at 12:06:52PM -0600, Matthew Wilcox wrote:
> I agree, though I wouldn't expect rebasing to be a common operation
> (every 2-3 months), it would suck to inadvertently break the autobuilder.
>

if we queue the autobuilder based on tags, even if we rebase, we will never
have an issue, since git-prune will only remove unreachable commits. as long
as we have a tag for the pre-rebased commits, they'll never be removed, which
is the desired behaviour (since the autobuilder will always be able to check
them out.)

cheers,
	kyle
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
