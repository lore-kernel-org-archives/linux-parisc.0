From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] PA-Linux version of libunwind
Date: Sat, 4 Dec 2004 19:33:31 -0700
Message-ID: <20041205023331.GB5905@colo.lackof.org>
References: <200412050119.iB51Jln3001654@napali.hpl.hp.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: davidm@hpl.hp.com
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200412050119.iB51Jln3001654@napali.hpl.hp.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, Dec 04, 2004 at 05:19:47PM -0800, David Mosberger wrote:
> Hi,
> 
> I have started to add PA-Linux support to Libunwind.

David,
Awesome!

> At the moment,
> I'm only targeting DWARF2 unwind info (not the SOM-style PARISC
> unwind-records) and not everything is implemented/working yet.

SOM is dead AFAIK. Only HPUX 32-bit uses SOM for anything.
I'm not sure where DWARF fits into the gcc releases but maybe
someone could remind me.

>   Even
> so, many tests in the built-in test-suite already succeed.  Thus, I
> think that even in this early state, others may have some use for it
> so I thought it might be a good idea to mention it on this list (and
> of course, bug-fixes/contributions are always welcome, too ;-).

:^)

> At the moment, the PA Linux support is available only via the
> bitkeeper repository at:
> 
> 	bk://unwind.bkbits.net/libunwind/

This worked for me:
# bk clone http://unwind.bkbits.net/libunwind/
# cd libunwind
# bk -r co -q

BTW, bitkeeper client is available for parisc-linux from bitkeeper.com.
I have it installed on most of my machines.

thanks again,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
