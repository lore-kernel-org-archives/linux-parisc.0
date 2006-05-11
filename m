From: Grant Grundler <grundler@parisc-linux.org>
Subject: [parisc-linux] Re: (void) cast for READ_REG
Date: Thu, 11 May 2006 11:25:17 -0600
Message-ID: <20060511172517.GA22074@colo.lackof.org>
References: <20060511063131.2B581494041@palinux.external.hp.com>
	<20060511081639.GH12272@parisc-linux.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Matthew Wilcox <matthew@wil.cx>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060511081639.GH12272@parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, May 11, 2006 at 02:16:39AM -0600, Matthew Wilcox wrote:
> The void casts are just bogus.  Please take them out.

"bogus" isn't the word I would use.
I agree with Kyle that we don't want that behavior for every function.
But I want the compiler to tell me when we throw away return values
we normally use.

I'll remove them since your last commit makes the casts superfluous.
And I don't recall why I opencoded READ_REG in the first place. :(

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
