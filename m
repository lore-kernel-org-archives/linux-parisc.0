Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Mon, 11 Aug 2003 13:12:52 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] xfree86 4.2.1-9 build problem
Message-ID: <20030811191252.GB25311@dsl2.external.hp.com>
References: <20030811152442.GB20405@dsl2.external.hp.com> <200308111730.h7BHUf9S018795@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200308111730.h7BHUf9S018795@hiauly1.hia.nrc.ca>
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

On Mon, Aug 11, 2003 at 01:30:40PM -0400, John David Anglin wrote:
> Using the g++ driver or adding `-shared-libgcc' to the link command
> should work around the problem.

I already knew g++ did.
I just confirmed adding `-shared-libgcc' did too.

thanks,
grant
