Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Thu, 26 Dec 2002 22:49:02 -0700
To: Carlos O'Donell <carlos@baldric.uwo.ca>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Why do we relax e_ident[EI_OSABI] in gdb?
Message-ID: <20021227054902.GA6159@dsl2.external.hp.com>
References: <20021227023137.GD8363@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20021227023137.GD8363@systemhalted>
From: grundler@dsl2.external.hp.com (Grant Grundler)
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

On Thu, Dec 26, 2002 at 09:31:37PM -0500, Carlos O'Donell wrote:
> Anyone have some ideas why we have this patch in gdb, and thus relax the 
> EI_OSABI check?

Maybe this mail explains it?
http://lists.parisc-linux.org/hypermail/parisc-linux/2357.html

search for ELF_OSABI on lists.p-l.o turned up alot of hits.
But looks like just one thread.

grant
