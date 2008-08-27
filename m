From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [PATCH 03/59] CRED: Wrap task credential accesses in the
	PA-RISC arch
Date: Wed, 27 Aug 2008 18:19:24 -0400
Message-ID: <20080827221924.GA6298@phobos.i.cabal.ca>
References: <20080827134541.19980.61042.stgit@warthog.procyon.org.uk> <20080827134557.19980.40787.stgit@warthog.procyon.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-kernel@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	Serge Hallyn <serue@us.ibm.com>,
	Kyle McMartin <kyle@mcmartin.ca>,
	Matthew Wilcox <matthew@wil.cx>,
	Grant Grundler <grundler@parisc-linux.org>,
	linux-parisc@vger.kernel.org
To: David Howells <dhowells@redhat.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080827134557.19980.40787.stgit@warthog.procyon.org.uk>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, Aug 27, 2008 at 02:45:57PM +0100, David Howells wrote:
> Wrap access to task credentials so that they can be separated more easily from
> the task_struct during the introduction of COW creds.
> 
> Change most current->(|e|s|fs)[ug]id to current_(|e|s|fs)[ug]id().
> 
> Change some task->e?[ug]id to task_e?[ug]id().  In some places it makes more
> sense to use RCU directly rather than a convenient wrapper; these will be
> addressed by later patches.
> 

OK.

Feel free to push this with the rest of them, if you haven't already,
with my blessing.

r, Kyle
