Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Sat, 23 Aug 2003 00:21:39 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: Lev Assinovsky <LAssinovsky@algorithm.aelita.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Help: Need instruction sequence for gdb breakpoint
Message-ID: <20030823062139.GA20379@dsl2.external.hp.com>
References: <3F6F4712B759A34ABD453A8B39C10D62DEEC97@bagman.edm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3F6F4712B759A34ABD453A8B39C10D62DEEC97@bagman.edm.com>
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

On Fri, Aug 22, 2003 at 09:13:37PM +0400, Lev Assinovsky wrote:
> Hi!
> 1. I meant just a hardcoded breakpoint (not hardware)
> Partially works just BREAK 4, 8. Though I need to do "jump" to next line 
> to continue in gdb.

ah ok 
> 2. gdb doesn't work with shared libraries explicitly loaded by program.
> Could you please point to anybody from HP team?

HP Team? Sorry but officially there is no HP parisc-linux team.
Most of us are interested in kernel hacking and less in
making gdb work.

> 3. What about ddd?

sorry - haven't looked at ddd.

grant
