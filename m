Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Wed, 9 Apr 2003 23:50:03 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: pageexec@freemail.hu
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] parisc-linux.org kernel
Message-ID: <20030410055003.GB21872@dsl2.external.hp.com>
References: <20030409054929.GB21306@dsl2.external.hp.com> <3E947323.14900.19F1E3AF@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3E947323.14900.19F1E3AF@localhost>
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

On Wed, Apr 09, 2003 at 07:23:15PM +0200, pageexec@freemail.hu wrote:
> > > To willy's credit, he's attempted to merge 2.4 parisc changes upstream
> > > at least twice but was torpedo'd both times.
> > 
> > i don`t want to know ;-)
> 
> actually, i'd like to (feel free to answer off-list),

Once the 2.4.20-preX bk tree that willy was using as "parent"
was discarded by marcelo because of other bugs in patches.
Or marcelo wouldn't accept the patch because he had a -pre candidate
and didn't want to risk that. Just stuff like that.

> since for all the
> other archs grsec/PaX runs on we could compile a working kernel from the
> vanilla tree - it just seems a mystery why parisc is an exception (not
> blaming anyone, just would like to see it more clear).

As willy noted, parisc is not an exception. last time willy looked at
merging, the 2.4 diff was something like 2 or 3MB. I'd hope it's a bit
smaller since Alan Cox merge a bunch of stuff into his tree.
But I haven't looked if/when Marcelo picked any of that up.
For comparison, last I heard, the 2.5 diff is something like < 100KB.

grant
