Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Thu, 14 Aug 2003 09:23:48 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: Joel Soete <jsoe0708@tiscali.be>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] itlb miss handler optimizations!
Message-ID: <20030814152348.GA17578@dsl2.external.hp.com>
References: <20030814114653.GJ10015@parcelfarce.linux.theplanet.co.uk> <3F2A5B04000030E1@ocpmta1.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3F2A5B04000030E1@ocpmta1.freegates.net>
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

On Thu, Aug 14, 2003 at 03:56:42PM +0200, Joel Soete wrote:
> In the 2 cases, if a fault occurs an interrupt (6, 15, 16,17 or 20) is
> 'triggered'?

yes, but most people call them "traps" or "faults" to be more specific.
Chapter 5 of the PA 2.0 arch book differentiates nicely.

grant
