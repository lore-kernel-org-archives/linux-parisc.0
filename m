Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Mon, 25 Aug 2003 13:19:15 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: James Bottomley <James.Bottomley@steeleye.com>
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Re: [parisc-linux-cvs] linux carlos
Message-ID: <20030825191915.GA377@dsl2.external.hp.com>
References: <3F2E2C7700004E38@ocpmta2.freegates.net> <20030825164553.GB28778@dsl2.external.hp.com> <1061830247.2044.165.camel@mulgrave>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1061830247.2044.165.camel@mulgrave>
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Mon, Aug 25, 2003 at 11:50:45AM -0500, James Bottomley wrote:
> Not for 2.6 we shouldn't.

My intent was not to commit the code, but just get debugging working.

> The beginnings of the hotplug CPU API made
> logical CPU numbers deprecated (even for x86, which was the worst
> logical vs phsyical number abuser).  We need to move entirely to
> physical numbers only for 2.6

That's not technically possible.
PARISC firmware uses the HPA to reference specific devices (including CPU).

We can use the same CPU number as PAT PDC and call them "physical".
But systems which don't have PAT PDC can only use arbitrary numbers
assigned by the parisc-linux startup code. Maybe there is a way to
make the numbers match PIM info output but I'm not sure how.

hth,
grant
